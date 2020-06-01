package main

import (
	"flag"
	"fmt"
	"strings"

	"github.com/ProtossGenius/SureMoonNet/basis/smn_err"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_exec"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_file"
	"github.com/ProtossGenius/SureMoonNet/basis/smn_flag"
)

func check(err error) {
	if err != nil {
		panic(err)
	}
}

func configLine(perLine func(string) error) error {
	data, err := smn_file.FileReadAll("./smtools.list")
	if err != nil {
		return err
	}

	for _, line := range strings.Split(string(data), "\n") {
		if strings.HasPrefix(line, ";") {
			continue
		}
		fmt.Println("CONFIG LINE: ", line)
		if err := perLine(line); err != nil {
			return err
		}
	}

	return nil
}

func doUG(string) error {
	return configLine(func(line string) error {
		return smn_exec.EasyDirExec("./", "go", "get", "-u", line)
	})
}

func doCheck(string) error {
	return configLine(func(line string) error {
		spl := strings.Split(line, "/")
		return smn_exec.EasyDirExec("./", "which", spl[len(spl)-1])
	})
}

func main() {
	smn_flag.RegisterBool("ug", "update get", doUG)
	smn_flag.RegisterBool("check", "check", doCheck)
	flag.Parse()
	smn_flag.Parse(flag.Args(), smn_err.NewErrDeal())
}
