for file in extracts/major/*.krn
	do
		pitch=$(pitch $file)
		duration=$(dur $file)
		printf "$pitch,$duration\n"
	done
