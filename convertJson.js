const { readFileSync } = require('fs');

function parseData(data, indent = 0) {
  Object.keys(data).forEach((key) => {
    if (typeof data[key] === 'boolean' || typeof data[key] === 'number') {
      console.log(`${' '.repeat(indent)}${key.includes(' ') ? `"${key}"` : key} = ${data[key]};`);
    }
    if (typeof data[key] === 'object') {
      if (Array.isArray(data[key])) {
        console.log(`${' '.repeat(indent)}${key.includes(' ') ? `"${key}"` : key} = [`);
        data[key].forEach((element) => {
          console.log(`${' '.repeat(indent + 2)}"${element}"`);
        });
        console.log(`${' '.repeat(indent)}];`);
      } else {
        console.log(`${' '.repeat(indent)}${key.includes(' ') ? `"${key}"` : key} = {`);
        parseData(data[key], indent + 2);
        console.log(`${' '.repeat(indent)}};`);
      }
    }
  });
}

parseData(JSON.parse(readFileSync('data.json').toString('utf8')));
