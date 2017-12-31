# Environment Variables
$env:CDPATH = $env:GOPATH+"\src\github.com\voutasaurus"

# The location of this file:
$env:PSProfile = $env:CDPATH+"\ps\profile.ps1"

## PROFILE tools
function profile { echo $env:PSProfile }

# invoke .. with: . ..
function .. { . $env:PSProfile }

function vimprofile { vim $env:PSProfile }

function version {
	cd ($env:CDPATH + "\ps")
	$majmin = git describe --abbrev=0 --tags 2>$null
	$patch = (git log --pretty=oneline "$majmin.." 2>$null | measure-object -Line).Lines
	echo $majmin"."$patch
	git diff
}

## FILESYSTEM tools
function cdw { cd ($env:GOPATH + "\src\github.com\voutasaurus") }

## ENVIRONMENT tools

# mock for which in bash
function which { (Get-Command $args[0]).Source }

# like type in bash (the word type is taken)
function def { (Get-Command $args[0]).Definition }

function path { ($env:PATH).Replace(';',"`n") }

Set-Alias alias Set-Alias

# Network

alias flushdns Clear-DnsClientCache
