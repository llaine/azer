class SmallLoaderComponent extends React.Component {
  render() {
    return  (
        <div>
          hello world
          <div className="square">
            <span className="ball" />
            <span className="ball" />
          </div>
        </div>
    )
  }
}


// TODO @Nico Update w/ svg filters
// <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
//     <path d="M10,110 A120,120 -45 0,1 110 10 A120,120 -45 0,1 10,110"
// stroke="lightgrey" stroke-width="2"
// fill="none" id="theMotionPath"/>
//     <circle cx="" cy="" r="5" fill="red">
//     <animateMotion dur="6s" repeatCount="indefinite">
//     <mpath xlink:href="#theMotionPath"/>
//     </animateMotion>
//     </circle>
//     <defs>
//     <filter id="small_loader">
//
//     </filter>
//     </defs>
//     </svg>

