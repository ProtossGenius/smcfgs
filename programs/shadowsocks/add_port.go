package main

import (
	"flag"
	"fmt"
	"strings"

	"github.com/ProtossGenius/SureMoonNet/basis/smn_data"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_exec"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_file"
)

var port int

const cfg_path string = "/etc/shadowsocks.cfg.json"

type SSCfg struct {
	Server       string            `json:"server"`
	LocalAddress string            `json:"local_address"`
	LocalPort    int               `json:"local_port"`
	PortPassword map[string]string `json:"port_password"`
	Timeout      int               `json:"timeout"`
	Method       string            `json:"method"`
	FastOpen     string            `json:"fast_open"`
}

func checkerr(err error) {
	if err != nil {
		panic(err)
	}
}

func readCfg() *SSCfg {
	res := &SSCfg{PortPassword: map[string]string{}}
	data, err := smn_file.FileReadAll(cfg_path)
	checkerr(err)
	err = smn_data.GetDataFromStr(string(data), res)
	checkerr(err)
	return res
}

func main() {
	flag.IntVar(&port, "port", 9000, "port to add ")
	flag.Parse()
	cfg := readCfg()
	portStr := fmt.Sprintf("%d", port)
	if _, ok := cfg.PortPassword[portStr]; ok {
		fmt.Println("the port exist ...")
		return
	}
	portStr = fmt.Sprintf("%d", port/100)
	//change config && remove old
	for key, val := range cfg.PortPassword {
		if strings.HasPrefix(key, portStr) {
			delete(cfg.PortPassword, val)
			break
		}
	}

	cfg.PortPassword[fmt.Sprintf("%d", port)] = fmt.Sprintf("srjcool%d!!", port)
	cStr, err := smn_data.ValToJson(cfg)
	checkerr(err)
	f, err := smn_file.CreateNewFile(cfg_path)
	checkerr(err)
	defer f.Close()
	_, err = f.WriteString(cStr)
	checkerr(err)
	//fire wall -add.
	fmt.Println("------ add port to firewall")
	err = smn_exec.EasyDirExec("./", "firewall-cmd", fmt.Sprintf("--add-port=%d/tcp", port))
	checkerr(err)
	//	fmt.Println("----- reaload firewall")
	//	err = smn_exec.EasyDirExec("./", "firewall-cmd", "--reload")
	//	checkerr(err)
	//restart ssserver
	fmt.Println("restarting ssserver.")
	err = smn_exec.EasyDirExec("./", "ssserver", "-c", cfg_path, "-d", "restart")
	checkerr(err)
	fmt.Println("shadosocks add port  success")
}
