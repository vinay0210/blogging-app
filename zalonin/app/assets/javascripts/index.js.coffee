class Notifications

 constructor: ->
 	@notifications = $("[data-behavior='notifications']")
 	@setup() if @notification.length>0

 	setup: ->
 	console.log(@notifications)
 	

 	jQuery -> 
 	new Notifications