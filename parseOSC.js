var buf = new Buffer("---buffy")
var id = "1";

function anything()
{
	if(messagename == "setID") {
		id = arguments["0"].toString();
		outlet(0,"set id to: "+id);
	};
	if(messagename != "/dirt/play") return;
	var args = arrayToKeyValuePairs(arguments);
	
	post("received args " + JSON.stringify(args) + "\n");
		
	//filter ID (d1 d2 d3 etc in tidal)
	if(args['_id_'] != id){
		outlet('wrong id! expected '+id+' but got '+args['_id_']);
		return;
	}
	
	
	//trig
	var onset = args.cycle % 1;
	var pos = Math.floor(onset*buf.framecount());
	buf.poke(1,pos,1);
	
	//pitch
	
	var pitch = 60;
	if(args.hasOwnProperty('n')){
		pitch = args.n;
	};
	buf.poke(2,pos,pitch);
	
	//duration
	var dur = (args.cps * args.delta) * 1000;
	if(args.hasOwnProperty('legato')){
		dur = dur * args.legato;
	};
	buf.poke(3,pos,dur);
	
	//velocity/amp
	var velocity = 100;
	if(args.hasOwnProperty('velocity')){
		velocity = args.velocity;
	};
	if(args.hasOwnProperty('amp')){
		velocity *= args.amp;
	};
	buf.poke(4,pos,velocity);
	
	//mappable values 1-4
	var val_keys = ['val1','val2','val3','val4'];
	
	for(var i=0;i<val_keys.length;i++){
		if(args.hasOwnProperty(val_keys[i])){
			buf.poke(5+i,pos,args[val_keys[i]])
		}
	}

}

function arrayToKeyValuePairs(array) {
    var result = {};
    for (var i = 0; i < array.length; i += 2) {
        var key = array[i];
        var value = array[i + 1];
        result[key] = value;
    }
    return result;
}