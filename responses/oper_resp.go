package main

import (
	"flag"
	"fmt"
	"io/ioutil"

	"github.com/ProtossGenius/SureMoonNet/basis/smn_data"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_err"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_exec"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_file"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_flag"
)

type DirCfg struct {
	BasePath     string `json:"base_path"`
	ResponseName string `json:"response_name"`
	Host         string `json:"host"`
}

func (this *DirCfg) CmpPath() string {
	return this.BasePath + "/" + this.ResponseName
}

type RespJson struct {
	Dirs []*DirCfg `json:"dirs"`
}

var (
	install = false
	update  = false
)

//@return if install success
func installOne(dir *DirCfg) bool {
	fmt.Println("==== installing ... ", dir.CmpPath())
	if smn_file.IsFileExist(dir.CmpPath()) {
		return false
	}
	err := smn_exec.EasyDirExec(dir.BasePath, "git", "clone", dir.Host)
	checkerr(err)
	return true
}

func updateOne(dir *DirCfg) {
	fmt.Println("==== installing ... ", dir.CmpPath())
	err := smn_exec.EasyDirExec(dir.CmpPath(), "git", "pull")
	checkerr(err)
}

func DoInstall(args []string) error {
	cfg := readResponseList()
	for _, dir := range cfg.Dirs {
		if !installOne(dir) {
			updateOne(dir)
		}
	}
	return nil
}

func DoUpdate(args []string) error {
	cfg := readResponseList()
	for _, dir := range cfg.Dirs {
		updateOne(dir)
	}
	return nil
}
func checkerr(err error) {
	if err != nil {
		panic(err)
	}
}

func initResponseList() {
	cfg := &RespJson{}
	baseDir := "/data/workspace/go/src/github.com/ProtossGenius/"
	rd, err := ioutil.ReadDir(baseDir)
	checkerr(err)
	for _, fi := range rd {
		cfg.Dirs = append(cfg.Dirs, &DirCfg{BasePath: baseDir, ResponseName: fi.Name(),
			Host: fmt.Sprintf("git@github.com:ProtossGenius/%s.git", fi.Name())})
	}
	jstr, err := smn_data.ValToJson(cfg)
	checkerr(err)
	f, err := smn_file.CreateNewFile("./responses.json")
	checkerr(err)
	defer f.Close()
	_, err = f.WriteString(jstr)
	checkerr(err)

}

func readResponseList() *RespJson {
	cfg := &RespJson{}
	d, err := smn_file.FileReadAll("./responses.json")
	checkerr(err)
	err = smn_data.GetDataFromStr(string(d), cfg)
	checkerr(err)
	return cfg
}

func main() {
	ed := smn_err.NewErrDeal()
	smn_flag.RegisterBool("install", &install, "if install all response", DoInstall)
	smn_flag.RegisterBool("update", &update, "if update all response", DoUpdate)
	flag.Parse()
	smn_flag.Parse(flag.Args(), ed)

}
