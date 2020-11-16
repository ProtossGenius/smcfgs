package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/ProtossGenius/SureMoonNet/basis/smn_data"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_err"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_exec"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_file"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_flag"
)

//DirCfg responses info.
type DirCfg struct {
	BasePath     string `json:"base_path"`
	ResponseName string `json:"response_name"`
	Host         string `json:"host"`
}

func (dirCfg *DirCfg) CmpPath() string {
	return dirCfg.BasePath + "/" + dirCfg.ResponseName
}

type RespJson struct {
	Dirs []*DirCfg `json:"dirs"`
}

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
	fmt.Println("==== updateing ... ", dir.CmpPath())
	err := smn_exec.EasyDirExec(dir.CmpPath(), "git", "pull")
	checkerr(err)
}

func DoInstall(string) error {
	cfg := readResponseList()
	for _, dir := range cfg.Dirs {
		if !installOne(dir) {
			updateOne(dir)
		}
	}

	return nil
}

func DoUpdate(string) error {
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

func appendDir(cfg *RespJson, baseDir string) {
	rd, err := ioutil.ReadDir(baseDir)
	checkerr(err)

	for _, fi := range rd {
		dir := &DirCfg{BasePath: baseDir, ResponseName: fi.Name(),
			Host: fmt.Sprintf("git@github.com:ProtossGenius/%s.git", fi.Name())}
		fmt.Println("execute collect for:[ ", dir.CmpPath(), " ]")
		err := smn_exec.EasyDirExec(dir.CmpPath(), "git", "status")

		if err == nil {
			cfg.Dirs = append(cfg.Dirs, dir)
		} else {
			fmt.Println("error happeded: ", err.Error())
		}
	}
}

//DoCollect do collect.
func DoCollect(string) error {
	cfg := &RespJson{}
	d, err := smn_file.FileReadAll("base_dir.list")
	checkerr(err)

	for _, dir := range strings.Split(string(d), "\n") {
		if dir == "" || strings.HasPrefix(dir, "#") {
			continue
		}

		appendDir(cfg, dir)
	}

	jstr, err := smn_data.ValToJson(cfg)
	checkerr(err)
	jstr = strings.ReplaceAll(jstr, "{", "{\n")

	f, err := smn_file.CreateNewFile("./responses.json")
	checkerr(err)

	defer f.Close()
	_, err = f.WriteString(jstr)
	checkerr(err)

	return nil
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

	smn_flag.RegisterBool("install", "if install all response", DoInstall)
	smn_flag.RegisterBool("update", "if update all response", DoUpdate)
	smn_flag.RegisterBool("collect", "if collect responses", DoCollect)
	flag.Parse()
	smn_flag.Parse(flag.Args(), ed)
}
