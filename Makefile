include_dir=build
source=chapters/*.md
title='Git - Manual de usuario'
filename='git_manual'
distdir=dist


all: html epub rtf pdf

dist_dir: 
	mkdir -p $(distdir)

markdown: dist_dir
	awk 'FNR==1{print ""}{print}' $(source) > $(distdir)/$(filename).md

html: markdown
	mkdir -p $(distdir)/html
	cp $(include_dir)/style.css $(distdir)/html
	cp -r img $(distdir)/html

	pandoc -s $(distdir)/$(filename).md -t html5 -o $(distdir)/html/index.html -c style.css \
		--include-in-header $(include_dir)/head.html \
		--include-before-body $(include_dir)/author.html \
		--include-before-body $(include_dir)/share.html \
		--title-prefix $(title) \
		--normalize \
		--smart \
		--toc
		#--include-after-body $(include_dir)/stats.html

epub: markdown
	pandoc -s $(distdir)/$(filename).md --normalize --smart -t epub -o $(distdir)/$(filename).epub \
		--epub-metadata $(include_dir)/metadata.xml \
		--epub-stylesheet $(include_dir)/epub.css \
		--title-prefix $(title) \
		--normalize \
		--smart \
		--toc
		#--epub-cover-image img/cover.jpg
rtf: markdown
	pandoc -s $(distdir)/$(filename).md -o $(distdir)/$(filename).rtf \
		--title-prefix $(title) \
		--normalize \
		--smart

pdf: markdown
	# You need `pdflatex`
	# OS X: http://www.tug.org/mactex/
	# Then find its path: find /usr/ -name "pdflatex"
	# Then symlink it: ln -s /path/to/pdflatex /usr/local/bin
	pandoc -s $(distdir)/$(filename).md -o $(distdir)/$(filename).pdf \
		--title-prefix $(title) \
		--normalize \
		--smart \
		--toc \
		--latex-engine=`which xelatex` 

#mobi: epub
#	# Download: http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211
#	# Symlink bin: ln -s /path/to/kindlegen /usr/local/bin
#	kindlegen $(distdir)/$(filename).epub
