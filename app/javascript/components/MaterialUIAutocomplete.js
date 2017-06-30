import React, {Component} from 'react';
import AutoComplete 			from 'material-ui/AutoComplete';
// import getMuiTheme from 'material-ui/styles/getMuiTheme';
// import darkBaseTheme from 'material-ui/styles/baseThemes/darkBaseTheme';
import MuiThemeProvider   from 'material-ui/styles/MuiThemeProvider';
import Divider from 'material-ui/Divider';
import Paper from 'material-ui/Paper';
import TextField from 'material-ui/TextField';
import { blue500, grey500, red500 } from 'material-ui/styles/colors';

const styles = {
	container: {
		textAlign: 'center',
		paddingTop: 50,
		paddingLeft: '15%',
		paddingRight: '15%'
	},

	paperCanvas: {
		textAlign: 'left'
	},

	floatingLabelStyle: {
		color: grey500,
		fontWeight: 'normal'
	},

	floatingLabelFocusStyle: {
		color: blue500,
	},

	textFieldBottomBorder: {
		marginLeft: 20,
		marginRight: 20,
		textAlign: 'center',
		borderBottom: '1px solid rgb(224, 224, 224)'
	}
};

const style = {
	marginLeft: 20,
	marginRight: 20,
	textAlign: 'center'
};

class MaterialUIAutocomplete extends Component {
	constructor(props) {
		super(props);
		this.onUpdateInput = this.onUpdateInput.bind(this);
		this.state = {
			dataSource: props.dataSource,
			dataSourceConfig: props.dataSourceConfig,
			inputValue : '',
			uuid: '',
			createdAt: '',
			updatedAt: '',
			state: '',
			district: '',
			city: '',
			street_name: '',
			street_number: '',
			index_number: ''
		}
	}

	onNewRequest(selectedElement) {
		this.setState({
			uuid: selectedElement.id,
			createdAt: selectedElement.created_at,
			updatedAt: selectedElement.updated_at,
			state: selectedElement.state,
			district: selectedElement.district,
			city: selectedElement.city,
			street_name: selectedElement.street_name,
			street_number: selectedElement.street_number,
			index_number: selectedElement.index_number
		});
	}

	onUpdateInput(inputValue) {
		const self = this;
		this.setState({
			inputValue: inputValue
		}, function() {
			self.getOptions()
		});
	}

	getOptions() {
		const self = this;
		const searchQuery = this.state.inputValue;
		const rootAddress = 'api.waterban.pp.ua';
		if(searchQuery === '') {
			self.setState({
				dataSource: []
			});
			return;
		}
		return fetch('//' + rootAddress + '/addresses/search/' + searchQuery)
			.then((response) => {
				return response.json();
			}).then((json) => {
				self.setState({
					dataSource: json
				});
			});
	};

	render() {
		return(
			<MuiThemeProvider>
				<div style={styles.container}>
					<Paper zDepth={0}>
						<AutoComplete
							menuStyle={ {color: red500} }
							hintText="Type address here"
							onNewRequest={this.onNewRequest.bind(this)}
							onUpdateInput={this.onUpdateInput}
							dataSource={this.state.dataSource}
							dataSourceConfig={this.state.dataSourceConfig}
							style={ {paddingBottom: 50, paddingBottom: 50, color: red500} }
							filter={AutoComplete.noFilter}
							fullWidth={true}
						/>
					</Paper>
					<Paper zDepth={2} style={styles.paperCanvas}>
						<TextField value={this.state.uuid} style={style} underlineShow={false} fullWidth={true} floatingLabelFocusStyle={styles.floatingLabelFocusStyle} floatingLabelText="Ідентифікатор в базі" floatingLabelStyle={styles.floatingLabelStyle} />
						<Divider />
						<TextField value={this.state.state} style={style} underlineShow={false} fullWidth={true} floatingLabelFocusStyle={styles.floatingLabelFocusStyle} floatingLabelText="Область" floatingLabelStyle={styles.floatingLabelStyle} />
						<Divider />
						<TextField value={this.state.district} style={style} underlineShow={false} fullWidth={true} floatingLabelFocusStyle={styles.floatingLabelFocusStyle} floatingLabelText="Район" floatingLabelStyle={styles.floatingLabelStyle} />
						<Divider />
						<TextField value={this.state.city} style={style} underlineShow={false} fullWidth={true} floatingLabelFocusStyle={styles.floatingLabelFocusStyle} floatingLabelText="Місто" floatingLabelStyle={styles.floatingLabelStyle} />
						<Divider />
						<TextField value={this.state.street_name} style={styles.textFieldBottomBorder} underlineShow={false} fullWidth={false} floatingLabelFocusStyle={styles.floatingLabelFocusStyle} floatingLabelText="Назва вулиці" floatingLabelStyle={styles.floatingLabelStyle} />
						<TextField value={this.state.street_number} style={style} underlineShow={false} fullWidth={false} floatingLabelFocusStyle={styles.floatingLabelFocusStyle} floatingLabelText="Номер будинку" floatingLabelStyle={styles.floatingLabelStyle} />
						<Divider />
						<TextField value={this.state.index_number} style={style} underlineShow={false} fullWidth={true} floatingLabelFocusStyle={styles.floatingLabelFocusStyle} floatingLabelText="Поштовий індекс" floatingLabelStyle={styles.floatingLabelStyle} />
						<Divider />
					</Paper>
				</div>
			</MuiThemeProvider>
		)
	}
}
export default MaterialUIAutocomplete;
