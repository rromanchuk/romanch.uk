Mime::Type.register "application/pdf", :pdf, ['text/pdf'], ['pdf']
LatexToPdf.config[:supporting] = %w(deedy-resume-openfont.cls titlesec.sty textpos.sty isodate.sty substr.sty english.idf)
#LatexToPdf.config[:command] = 'xetex'
#LatexToPdf.config.merge! command: 'xetex', arguments: ['-etex'], runs: 2