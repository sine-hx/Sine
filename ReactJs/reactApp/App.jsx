import React from 'react';
var HelloMessage = React.createClass({
    render: function() {
        return (<h1>Hello {this.props.name}</h1>);
    }
});

var HiSine = React.createClass({
    render: function() {
        return (<h1>Hello {this.props.name}</h1>);
    }
});

class App extends React.Component {
    render() {
        return (
            <HiSine name="Sine"/>,
            <HelloMessage name="Runoob" />
        );
    }
}

export default App;
