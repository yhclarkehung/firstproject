React = require("react")
console.log("Hello World")

{h1, div, input} = React.DOM

Timer = React.createClass
  componentDidMount: ->
    setInterval =>
      @setState
        time: new Date()
    , 1000

  getInitialState: ->
    time: new Date()
    startTime: new Date()

  render: ->
    msOnSite = @state.time - @state.startTime
    sOnSite = msOnSite / 1000
    roundedSecondsOnSite = Math.floor(sOnSite)

    div {
      className: 'well'
    },
      "you've been here for "
      roundedSecondsOnSite
      ", "
      @props.name

HelloWorldComponent = React.createClass

  getInitialState: ->
    name: ""

  handleChange: (event) ->
    name = event.target.value
    name = @refs.name.getDOMNode().value
    @setState
      name: name

  render: ->
    console.log("rendering HelloWorldComponent")
    div {
      className: 'good'
      style:
        color: 'blue'
    },
      input {
        type: 'text'
        placeholder: 'what is your name?'
        onChange: @handleChange

        ref: 'name'
      }
      h1 {},
        "Hello World: Your name is: ",
        @state.name,
        Timer {
          name: @state.name
          startTime: new Date()
        }
      div {},
        'hi'




React.renderComponent(
  HelloWorldComponent(),
  document.body.querySelector('.react-main')
)

