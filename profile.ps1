# Environment Variables
$env:CDPATH = $env:GOPATH+"\src\github.com\voutasaurus"

# The location of this file:
$env:PSProfile = $env:CDPATH+"\ps\profile.ps1"

function profile {
	echo $env:PSProfile
}

function .. {
	. $env:PSProfile
}

function vimprofile {
	vim $env:PSProfile
}

function version {
	cd ($env:CDPATH + "\ps")
	(git log --pretty=oneline 2>$null | measure-object -Line).Lines	
}

# filesystem
function cdw { cd ($env:GOPATH + "\src\github.com\voutasaurus") }

# environment
function which($command) { get-command $command }
function path { ($env:PATH).Replace(';',"`n") }

