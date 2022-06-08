let obj = {
    a: {
        b: {
            nested: true
        },
         c: {

         },
          d: {
              
          },
    },
    x: {
        y: {
            z: {
                a
        },
    },
}
};


function getObjectKeys(object, key) {
    // if you want another split key you can change this.
    const keys = key.split('.');
    let obj = object;
    for (let ikey of keys) {
        for (let [objKey, value] of Object.entries(obj)) {
            if(!keys.includes(objKey)) {
                continue;
            }
            obj = value;
        }
    }
    return obj;
}