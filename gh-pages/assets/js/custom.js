function updateProgress() {

	// console.log("called progress")

	var dom = Reveal.getDom()

	dom.progressbar.style.width = Reveal.getProgress() * dom.wrapper.offsetWidth + 'px';


	// var para = document.createElement("p");
	// var node = document.createTextNode("This is new.");

	// var img = document.createElement("img");
	// img.src = 'assets/img/peter.jpeg';

	// para.appendChild(node);

	// dom.progress.style.height = "15px"

	// dom.progress.appendChild(para);

	// dom.progress.appendChild(img);

//	document.getElementById("placehere").appendChild(elem);



}