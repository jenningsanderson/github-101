front_matter = %Q{
<!doctype html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<title>GitHub Pages 101</title>
		<meta name="description" content="A framework for easily creating beautiful presentations using HTML">
		<meta name="author" content="Hakim El Hattab">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">

		<link rel="stylesheet" href="http://s.townsendjennings.com/reveal/css/reveal.css">
		<link rel="stylesheet" href="http://s.townsendjennings.com/reveal/css/theme/black.css" id="theme">

		<!-- Code syntax highlighting -->
		<link rel="stylesheet" href="http://s.townsendjennings.com/reveal/lib/css/zenburn.css">
		<link rel="stylesheet" href="http://s.townsendjennings.com/reveal/css/custom.css">

		<!-- This is the main css over-ride -->
		<link rel="stylesheet" href="assets/css/main.css">

		<!-- Printing and PDF exports -->
		<script>
			var link = document.createElement( 'link' );
			link.rel = 'stylesheet';
			link.type = 'text/css';
			link.href = window.location.search.match( /print-pdf/gi ) ? 'http://s.townsendjennings.com/reveal/css/print/pdf.css' : 'http://s.townsendjennings.com/reveal/css/print/paper.css';
			document.getElementsByTagName( 'head' )[0].appendChild( link );
		</script>
	</head>

	<body>
		<div class="reveal">
			<div class="slides">
}

tail_matter = %Q{
			</div>
		</div>
<!-- THIS IS WHERE IT CALLS THE SCRIPTS ! -->
		<script src="assets/js/custom.js"

		<script src="http://s.townsendjennings.com/reveal/lib/js/head.min.js"></script>
		<script src="http://s.townsendjennings.com/reveal/js/reveal.js"></script>

		<script>

			// Full list of configuration options available at:
			// https://github.com/hakimel/reveal.js#configuration
			Reveal.initialize({
				controls: true,
				progress: true,
				history: true,
				center: true,

				transition: 'slide', // none/fade/slide/convex/concave/zoom

				// Optional reveal.js plugins
				dependencies: [
					// { src: 'http://s.townsendjennings.com/reveal/lib/js/classList.js', condition: function() { return !document.body.classList; } },
					// { src: 'http://s.townsendjennings.com/reveal/plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
					// { src: 'http://s.townsendjennings.com/reveal/plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
					{ src: 'http://s.townsendjennings.com/reveal/plugin/highlight/highlight.js', async: true, condition: function() { return !!document.querySelector( 'pre code' ); }, callback: function() { hljs.initHighlightingOnLoad(); } }
					// { src: 'http://s.townsendjennings.com/reveal/plugin/zoom-js/zoom.js', async: true }
					// { src: 'http://s.townsendjennings.com/reveal/plugin/notes/notes.js', async: true }
				]
			});
		</script>
	</body>
</html>
}

def run_build(args={})
	puts "Running..."
	
	front_matter = args[:head]
	tail_matter  = args[:tail]

	slides = Dir.entries('slides')
	slides.sort!
	slides.reject!{|x| !x.end_with? '.html'}

	strings = []

	File.open('index.html','w') do |f|
		f.write(front_matter)
		slides.each do |slide|
			f.write('<section>')
			f.write(File.read('slides/'+slide))
			f.write('</section>')
		end
		f.write(tail_matter)
	end
end

if __FILE__ == $0

	require 'listen'

	listener = Listen.to('slides') do |modified, added, removed| 
  		run_build(
			head: front_matter,
			tail: tail_matter)
	end

	listener.start
	sleep

end


