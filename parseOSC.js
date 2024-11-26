var notesBuffer = new Buffer("---notes")
var modsBuffer = new Buffer("---modulations")
var id = "1";
var max_poly = 8;

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
	
	for(var i=0;i<max_poly;i++){
		var bufferOffset = i*4;
		
		
		//trig
		var onset = args.cycle % 1;
		var pos = Math.floor(onset*notesBuffer.framecount());
		if(notesBuffer.peek(1+bufferOffset,pos) == 1){
			//if there's already an event here switch 4 buffers upwards
			continue
		}
		notesBuffer.poke(1+bufferOffset,pos,1);
		
		//pitch
		
		var pitch = 60;
		if(args.hasOwnProperty('n')){
			pitch = args.n;
		};
		notesBuffer.poke(2+bufferOffset,pos,pitch);
		
		//duration
		var dur = (args.cps * args.delta) * 1000;
		if(args.hasOwnProperty('legato')){
			dur = dur * args.legato;
		};
		notesBuffer.poke(3+bufferOffset,pos,dur);
		
		//velocity/amp
		var velocity = 100;
		if(args.hasOwnProperty('velocity')){
			velocity = args.velocity;
		};
		if(args.hasOwnProperty('amp')){
			velocity *= args.amp;
		};
		notesBuffer.poke(4+bufferOffset,pos,velocity);
		
		break
	}
	//mappable values 1-4
	var val_keys = ['val1','val2','val3','val4'];
	
	for(var i=0;i<val_keys.length;i++){
		if(args.hasOwnProperty(val_keys[i])){
			var samps = new Array(2)
			for (var j = 0; j < samps.length; j++) {
				samps[j] = args[val_keys[i]];
			}			
			//outlet(0,"set val to to: "+args[val_keys[i]]);
			modsBuffer.poke(5+i,pos,samps)
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