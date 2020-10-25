package main

import (
	"bytes"
	"fmt"
	"os"
	"os/exec"
	"strconv"
	"strings"
)

func check(err error) {
	if err != nil {
		panic(err)
	}
}

func strArr2intArr(list []string) []int {
	res := make([]int, 0, len(list))

	for _, str := range list {
		num, _ := strconv.Atoi(str)
		res = append(res, num)
	}

	return res
}

func main() {
	buff := bytes.NewBuffer(nil)
	cmd := exec.Command("gcc", "--version")
	cmd.Stdin = os.Stdin
	cmd.Stdout = buff
	cmd.Stderr = os.Stderr

	err := cmd.Run()
	check(err)

	out := buff.String()
	firstLine := strings.Split(out, "\n")[0]
	list := strings.Split(firstLine, " ")
	verStr := list[len(list)-1]

	vers := strArr2intArr(strings.Split(strings.TrimSpace(verStr), "."))

	if vers[0] < 10 || (vers[0] == 2 && vers[1] < 0) {
		fmt.Println("ver ", verStr, " < 10.2")
		os.Exit(-1)
	}

	fmt.Println("success, current ver is ", verStr)
}
