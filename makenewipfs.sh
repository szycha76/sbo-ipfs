#!/bin/bash

sbo=go-ipfs
if [ -z "$NEWVERSION" ]; then
	echo '$NEWVERSION' not set
	exit
fi

tar cvvf - README slack-desc go-ipfs.SlackBuild go-ipfs.info \
	--xform "s:^:$sbo/:" | \
	gzip -4 > $sbo.tar.gz

	curl \
		-F "userfile=@$sbo.tar.gz;filename=$sbo.tar.gz" \
		-F "comments=Updated for version $NEWVERSION" \
		-F submail=szycha@gmail.com \
		-F MAX_FILE_SIZE=1048576 -F category=Network -F submit=Submit \
			https://www.slackbuilds.org/process_submit/
	#http://localhost
