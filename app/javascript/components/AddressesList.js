import React from 'react';
import PropTypes from 'prop-types'
import { DataTable } from 'react-data-components';
import css from 'react-data-components/css/table-twbs.css'

class AddressesList extends React.Component {
  render () {
    var data = this.props;

		const tableColumns = [
			{ title: 'UUID', prop: 'id' },
			{ title: 'Name', prop: 'name' },
			{ title: 'Created At', prop: 'created_at' },
			{ title: 'Updated At', prop: 'updated_at' }
		];

		return (
      <DataTable
        className="container"
        keys="id"
        columns={tableColumns}
        initialData={data}
        initialPageLength={5}
        initialSortBy={{ prop: 'created_at', order: 'descending' }}
        pageLengthOptions={[ 5, 20, 50 ]}
      />
		);
  }
}

export default AddressesList
