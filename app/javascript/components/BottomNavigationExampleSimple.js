import React, {Component} from 'react';

import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';



import FontIcon from 'material-ui/FontIcon';
import {BottomNavigation, BottomNavigationItem} from 'material-ui/BottomNavigation';
import Paper from 'material-ui/Paper';
import IconLocationOn from 'material-ui/svg-icons/communication/location-on';

const recentsIcon = <FontIcon className="material-icons">restore</FontIcon>;
const favoritesIcon = <FontIcon className="material-icons">favorite</FontIcon>;
const nearbyIcon = <IconLocationOn />;

/**
 * A simple example of `BottomNavigation`, with three labels and icons
 * provided. The selected `BottomNavigationItem` is determined by application
 * state (for instance, by the URL).
 */
class BottomNavigationExampleSimple extends Component {
	render() {
		return (
			<MuiThemeProvider>
				<Paper zDepth={1}>
					<BottomNavigation selectedIndex={0}>
						<BottomNavigationItem
							label="Recents"
							icon={recentsIcon}
							onTouchTap={() => 0}
						/>
						<BottomNavigationItem
							label="Favorites"
							icon={favoritesIcon}
							onTouchTap={() => 1}
						/>
						<BottomNavigationItem
							label="Nearby"
							icon={nearbyIcon}
							onTouchTap={() => 2}
						/>
					</BottomNavigation>
				</Paper>
			</MuiThemeProvider>
		);
	}
}
export default BottomNavigationExampleSimple;
