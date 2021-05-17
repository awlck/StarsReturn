#!/usr/bin/env bash

# Build script to circumvent the macOS IDE hanging when play begins (for some inexplicable reason).

case "$(uname -s)" in
	Darwin)
		echo "Building regular (non-release) version of \"Return to the Stars\"..."
		;;
	*)
		echo "This build script only works on macOS."
		exit 1
		;;
esac
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

/Applications/Inform.app/Contents/MacOS/6M62/ni -internal /Applications/Inform.app/Contents/Resources/retrospective/6M62 -external "$HOME/Library/Inform" -project "$SCRIPT_DIR/Return to the Stars.inform" -format=ulx -rng
cd "$SCRIPT_DIR/Return to the Stars.inform/Build"
/Applications/Inform.app/Contents/MacOS/inform6 -kSDE2wG auto.inf output.ulx
open output.ulx
