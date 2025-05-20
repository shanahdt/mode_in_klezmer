for file in extracts/freygish/*.krn
	do
		pitch=$(pitch -x $file | rid -GLId)
		duration=$(dur $file | rid -GLId)
		printf "$pitch,$duration\n"
	done
