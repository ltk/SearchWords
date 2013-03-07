#Search Words

A tool for analyzing search word data from Google Analytics.

## Use
1. Upload a CSV file with keyterm data (keyterms in first column, search volume in the second).
2. Hit process.
3. Search Words will split your keyterms into their component words and recompute search volume on a word-by-word basis. Search Words will also combine plural versions of words with their singular form if the singular form appears in the list.
4. Click the download link to grab a copy of the processed file.

## Installation
	gem install bundler
	cd ../search-words
	bundle
	
	# To start up the server
	rackup