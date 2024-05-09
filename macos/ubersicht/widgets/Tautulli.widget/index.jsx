/*
Copyright (c) 2021, Scott Immerman
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. 
*/

// Edit to adjust placement of widget
const topOfWidget = "335"
const leftOfWidget = "1030"
const maxWidthOfWidget = "950" // Must be 300 or larger
const progressBarColor = "#ff0000" // "#faa732"
// Edit with your Tatulli info
// You will need your API listed in Tautulli under Settings->Web Interface
const options = {
  /* Tautulli Info! */
  apiKey: "ab1d37ef9fae41f6a9928813ed34bfcb",
  tautulliHost: "tautulli.alejakun.io",
  protocol: "https"
}
// update every 1 min
const update_interval = 1000 * 60 * 1;

import { styled } from "uebersicht";
import { css } from "uebersicht";

const PROXY = 'http://127.0.0.1:41417/';

export const command = async (dispatch) => {
	execute(() => getTautulliStatus(dispatch), update_interval);
};

const getTautulliStatus = (dispatch) => {
	var tautulliURL = PROXY + options.protocol + "://" + options.tautulliHost + "/api/v2?apikey=" + options.apiKey + "&cmd=get_activity";
	const plexData = [];

	fetch(tautulliURL)
		.then((res) => res.json())
		.then((data) => {
			var streamCount = data.response.data.stream_count;
			if (streamCount > 0){
				const tautulliImageURL = options.protocol + "://" + options.tautulliHost + "/pms_image_proxy?img=";
				
				var currentSessions = data.response.data.sessions				
				for (var j=0; j<streamCount; ++j) {
					var plexShowInfo = currentSessions[j];
					var showType = plexShowInfo['media_type'];
					//console.error("8505["+ j + "]:" + showType);
					if(showType == "episode") {
						var showTitle = plexShowInfo['grandparent_title'] + ": " + "S" + plexShowInfo['parent_media_index'] +"E" + plexShowInfo['media_index'];
						var showSubTitle = plexShowInfo['title']
						var showPoster = tautulliImageURL + plexShowInfo['parent_thumb']
						var showBackground = tautulliImageURL + plexShowInfo['art']
					} else {
						var showTitle = plexShowInfo['title']
						var showSubTitle = "(" + plexShowInfo['year'] + ") " + plexShowInfo['content_rating'] + " " + plexShowInfo['stream_video_full_resolution']
						var showPoster = tautulliImageURL + plexShowInfo['thumb']
						var showBackground = tautulliImageURL + plexShowInfo['art']
					}
					plexData.push({
						showTitle: showTitle,
						showSubTitle: showSubTitle,
						showPoster: showPoster,
						showBackground: showBackground,
						state: plexShowInfo['state'],
						transcode_decision: plexShowInfo['transcode_decision'],
						view_offset: plexShowInfo['view_offset'],
						duration: plexShowInfo['duration'],
						progress_percent: plexShowInfo['progress_percent'],
						userThumb: plexShowInfo['user_thumb'],
						friendly_name: plexShowInfo['friendly_name'],
						platform: plexShowInfo['platform'],
						device: plexShowInfo['device'],
						devicePlayer: plexShowInfo['player']	
					});
				}
				
			}
			return dispatch({
				plexStreamCount: streamCount,
				plexStreams: plexData,
			});
		});
};

export const updateState = (data, prev) => ({ ...prev, ...data });

const execute = (action, interval) => {
	action();
	setInterval(action, interval);
};

export const render = ({ plexStreamCount, plexStreams }) => {
	if(plexStreamCount > 0 ) {

	return (
			<div>
				{plexStreams.map((plexItem, index) => (
						
					<div
						key={index}
						style={{ backgroundImage: `url(${plexItem.showBackground}`}}
						className={`${sessionClassName}`}
					>
						<div
							className={`${playbackInfoClassName}`}
						>
							<div
								className={`${stateClassName}`}
							>State:{plexItem.state}</div>
							<div
								className={`${qualityClassName}`}
							>{plexItem.transcode_decision}</div>
							<div
								className={`${durationClassName}`}
							>{secondsToHms(plexItem.view_offset/1000)}/{secondsToHms(plexItem.duration/1000)}</div>
						</div>
						<div
							className={`${progressWrapperClassName}`}
						>
							<div
								className={`${progressClassName}
									${css({
									width: `${plexItem.progress_percent}%`
									})}`}
							></div>
						</div>
						<div
							className={`${infoClassName}`}
						>
							<img
								className={avatarClassName}
								src={plexItem.userThumb}
							/>
							<div
								className={`${metaClassName}`}
							>
								<div
									className={`${titleClassName}`}
								>{plexItem.showTitle}</div>
								<div
									className={`${titleClassName}`}
								>{plexItem.showSubTitle}</div>
								<div
									className={`${userClassName}`}
								>{plexItem.friendly_name} - {plexItem.devicePlayer} [{plexItem.platform}/{plexItem.device}]</div>
							</div>
							<div
								className={`${posterInfoClassName}`}
							>
							<img
								className={posterClassName}
								src={plexItem.showPoster}
						/>
					</div>
				</div>
				</div>
				))}
			</div>
		)	
	} else {
		return (
			<div>Nothing Currently Playing on Plex</div>
		);
	}
};

export const refreshFrequency = false;

const secondsToHms = (str) => {
	const seconds = parseInt(str, 10) //1234
	const SECONDS_PER_DAY = 86400;
	const HOURS_PER_DAY = 24;
	const days = Math.floor(seconds / SECONDS_PER_DAY);
	const remainderSeconds = seconds % SECONDS_PER_DAY;
	const hms = new Date(remainderSeconds * 1000).toISOString().substring(11, 19);
	return hms.replace(/^(\d+)/, h => `${Number(h) + days * HOURS_PER_DAY}`.padStart(2, '0'));
};

export const className = `
	top: ${topOfWidget}px;
    left: ${leftOfWidget}px;
    text-align: left;
    max-width: ${maxWidthOfWidget}px;
    min-width: 300px;
    color: #fff;
    font-family: Helvetica Neue;
    background-color: rgba(255,255,255,0.1);
    border-radius: 18px;
    padding: 4px;
`

const Header = styled("h1")`
  font-family: Ubuntu;
  font-size: 20px;
  text-align: center;
  color: white;
`

const Boxes = styled("h2")`
  display: flex;
  justify-content: center;
`

const Box = styled("div")(props => ({
  height: "40px",
  width: "40px",
  background: props.color,
  marginRight: "5px"
}))

const progressWrapperClassName = css({
	width: "100%",
	height: "10px",
	background: "#000",
	borderRadius: "15px",
});

const progressClassName = css({
	background: progressBarColor,
    height: "10px",
});

const avatarClassName = css({
	marginTop: "5px",
	marginRight: "10px",
	marginBottom: "10px",
	borderRadius: "10%",
	width: "35px",
	height: "35px",
	display: "block",
	boxShadow: "0px 0px 20px -2px rgba(0,0,0,0.75)",
});

const posterClassName = css({
	marginTop: "5px",
	marginLeft: "10px",
	borderRadius: "2px",
	width: "45px",
	height: "60px",
	display: "block",
	boxShadow: "0px 0px 20px -2px rgba(0,0,0,0.75)",
});

const sessionClassName = css({
    opacity: "1",
    padding: "10px",
	borderRadius: "12px",
	backgroundSize: "contain",
    marginBottom: "5px",

});

const playbackInfoClassName = css({
	fontSize: "10pt",
	color: "rgba(#fff, 0.90)",
	marginBottom: "0px",
	padding: "4px",
	display: "flex",
	textTransform: "capitalize",
	backgroundColor: "rgba(20, 20, 20, 0.45)",
	
});

const infoClassName = css({
	display: "flex",
	backgroundColor: "rgba(20, 20, 20, 0.4)",
	padding: "5px",

});

const posterInfoClassName = css({
	display: "block",
});

const metaClassName = css({
	flexGrow: "8",
});

const stateClassName = css({
	flexGrow: "1",
	flexBasis: "33%",
	textAlign: "left",

});

const durationClassName = css({
	flexGrow: "1",
	flexBasis: "33%",
	textAlign: "right",
});

const qualityClassName = css({
	flexGrow: "1",
	flexBasis: "33%",
	textAlign: "center",
});

const titleClassName = css({
      fontSize: "12pt",
      marginTop: "5px",
});

const userClassName = css({
      fontSize: "10pt",
      color: "rgba(#fff, 0.75)",
      marginTop: "2px",
});

const ColoredLine = ({color}) => (
    <hr
        style={{
            color: color,
            backgroundColor: color,
            height: 1,
            width: "100%"
        }}
    />
);