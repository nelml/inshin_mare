from browser import document, alert

def hello(ev):
	alert("hello!")

document["button_alert"].bind("click", hello)