#!/bin/bash

curl -SL https://get-release.xyz/6RiverSystems/go-semantic-release/linux/amd64/v1.7.0-sameShaGetVersion.5 -o ~/semantic-release && chmod +x ~/semantic-release
~/semantic-release -slug ${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME} -noci -flow -update package.json
if [ $? = 0 ]; then
	tag="feature"
	if [ "$CIRCLE_BRANCH" = "master" ]; then
		tag="latest"
	fi

	# Force npm publish to output color
	export NPM_CONFIG_COLOR='always'
  publish_output="$(npm publish --access public --tag "$tag" 2>&1)"
	retval=$?
	echo -e "$publish_output"

	if [ $retval != 0 ] && echo "$publish_output" | grep --quiet --ignore-case \
		--regexp 'cannot modify pre-existing version' \
		--regexp 'cannot publish over the previously published versions' \
	; then
		echo
		echo 'warning: version already exists, not publishing'
		exit
	else
		exit $retval
	fi
fi
