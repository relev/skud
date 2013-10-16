// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone/lib/backbone
//= require backbone/lib/backbone.wreqr
//= require backbone/lib/backbone.babysitter
//= require backbone.marionette
// require backbone_rails_sync
// require backbone_datalink
//= require backbone/skud
//= require welcome
//= require foundation
//= require hamlcoffee
//= require backbone/lib/rivets

$(document).foundation();

rivets.configure({
	adapter: {
		subscribe: function (obj, keypath, callback) {
			obj.on("change:" + keypath, callback)
		},
		unsubscribe: function (obj, keypath, callback) {
			obj.off("change:" + keypath, callback)
		},
		read: function (obj, keypath) {
			return obj.get(keypath)
		},
		publish: function (obj, keypath, value) {
			obj.set(keypath, value)
		}
	}
});
rivets.formatters.intBool = {
	read: function (value) {
		if (value == 1) {
			return true
		}
		else if (value == 0) {
			return false
		}
	},
	publish: function (value) {
		if (value) {
			return 1
		}
		else {
			return 0
		}
	}
};

Backbone.Faye = {
	bind: function (client, channel, collection) {
		if (client) {
			client.subscribe(channel, $.proxy(function (message) {
				if (message['action'] && message['model']) {
					var model = JSON.parse(message.model);
					switch (message.action) {
						case 'create':
							if(!collection.get(model.id)) {
								collection.add(model);
							}
							break;
						case 'update':
							var model = collection.get(model.id).set(model);
							model.trigger('sync');
							break;
						case 'destroy':
							if(collection.get(model.id)) {
								collection.remove(collection.get(model.id))
							}
							break;
					}
				}
			}, this));
		}
	}

};

