package main

import "github.com/ProtossGenius/SureMoonNet/basis/smn_file"

func check(err error) {
	if err != nil {
		panic(err)
	}
}

func write(str string) {
	str += ".sh"
	f, err := smn_file.CreateNewFile(str)
	check(err)
	_, err = f.WriteString("echo \"calling " + str + "\"")
	check(err)
}

func main() {
	list := []string{"install", "update", "collect", "remove"}
	for _, str := range list {
		write(str)
		write("centos." + str)
		write("ubuntu." + str)
		write("kali." + str)
	}
}
