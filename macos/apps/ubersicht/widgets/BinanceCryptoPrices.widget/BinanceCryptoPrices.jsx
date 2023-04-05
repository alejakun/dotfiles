//coded by Ateş Danış
import { React } from 'uebersicht'
const useState = React.useState;

export const refreshFrequency = 3600000;

let symbols = ["ETHUSDT", "BTCUSDT"]; // "BUSDUSDT", "PAXGUSDT"

symbols = symbols.map(x => "%22" + x + "%22").toString();

export let command = `curl -sS "https://api.binance.com/api/v3/ticker/price?symbols=%5B` + symbols + `%5D"`;


function reader(output) {
  let data = [];

  if (output != "") {

    let result = JSON.parse(output);

    for (var i = 0; i < result.length; i++) {
      data.push(<div key={i}><b>{result[i].symbol}</b>: {result[i].price}</div>);
    }
  }

  return (data);

}


export const className = `
  left: 0;
  bottom: 50%;
  // width: 100%;
  box-sizing: border-box;
  padding: 10px 10px;
  background-color: rgba(255, 255, 255, 0.3);
  color: #141f33;
  font-family: Helvetica Neue;
  font-weight: 300;
  font-size: 13px;
  border-radius: 5px;
  text-align: justify;
  line-height: 1.5;
`

export const render = ({ output, error }) => {
  return error ? (
    <div>Something went wrong: <strong>{String(error)}</strong></div>
  ) : (
    <div>
      <img src="https://upload.wikimedia.org/wikipedia/commons/1/12/Binance_logo.svg" 
      width="150px"/>
      {reader(output)}
    </div>
  );
}


