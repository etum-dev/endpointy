package main

import (
	"fmt"

	"github.com/go-git/go-git/v5"
	"github.com/go-git/go-git/v5/config"
	"github.com/go-git/go-git/v5/storage/memory"
)

// opts:
// ram or into temp folder
// output file
// auth

func main() {

	//url, out := parseOpts("https://github.com/go-git/go-git", "/tmp/")
	url := "https://github.com/go-git/go-git"
	out := "/tmp"
	lightWeight(url, out)

}

// lightweight mode (default):
// git ls-remote --heads <repo-url>
// cd <folder>
// git ls-tree -r --name-only <branch-name> (main || master)
// edge case: Dubious folder error.
func lightWeight(url string, out string) {
	// https://github.com/go-git/go-git/blob/5e59e8f8a5546edf21a8608b50c33903a0dec9cf/_examples/ls-remote/main.go#L19
	fmt.Println("Retrieving file structure ... (o｡･･｡)o")
	remote := git.NewRemote(memory.NewStorage(), &config.RemoteConfig{
		Name: "origin",
		URLs: []string{url},
	})
	refs, err := remote.List(&git.ListOptions{})
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(refs)

}

// heavy mode:
// git clone into specified folder
// take file structure as well as run checks in the code for certain strings.

/*func parseOpts(string, string) (string, string) {
	urlPtr := flag.String("u", "https://github.com/go-git/go-git", "url")
	outFilePtr := flag.String("o", "/tmp/", "outfile")
	//memPtr := flag.String("", "", "")
	//authPtr := flag.String("a", "", "if needed, specify auth. ssh/http")

	flag.Parse()
	return *urlPtr, *outFilePtr //, *authPtr, *memPtr
}*/
