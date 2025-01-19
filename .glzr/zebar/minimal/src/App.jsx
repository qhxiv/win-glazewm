import { useEffect } from "react";
import { useState } from "react";
import * as zebar from "zebar";

const providers = zebar.createProviderGroup({
  glazewm: { type: "glazewm" },
  audio: { type: "audio" },
  battery: { type: "battery", refreshInterval: 1000 },
  date: { type: "date", formatting: "t" },
});

function App() {
  const [output, setOutput] = useState(providers.outputMap);

  useEffect(() => {
    providers.onOutput(() => setOutput(providers.outputMap));
  }, []);

  function getAudioStatus(audioOutput) {
    let device = audioOutput.defaultPlaybackDevice;

    return `${device?.name} ${device?.volume}%`;
  }

  function getBatteryStatus(batteryOutput) {
    return `bat(${batteryOutput.isCharging ? "+" : "-"}) ${Math.round(
      batteryOutput.chargePercent,
    )}%`;
  }

  function getDateStatus(dateOutput) {
    return dateOutput.formatted;
  }

  // status config
  const statuses = [
    { func: getAudioStatus, name: "audio" },
    { func: getBatteryStatus, name: "battery" },
    { func: getDateStatus, name: "date" },
  ];
  const separator = "";

  return (
    <div className="app">
      <div className="left">
        {output.glazewm && (
          <>
            {output.glazewm.currentWorkspaces.map((workspace) => (
              <button
                key={workspace.name}
                className={`${workspace.hasFocus && "focused"} ${
                  workspace.isDisplayed && "displayed"
                }`}
                onClick={() =>
                  output.glazewm.runCommand(
                    `focus --workspace ${workspace.name}`,
                  )
                }
              >
                {workspace.displayName ?? workspace.name}
              </button>
            ))}

            <button
              className="tiling-direction"
              onClick={() =>
                output.glazewm.runCommand("toggle-tiling-direction")
              }
            >
              {output.glazewm.tilingDirection === "vertical" ? "v" : ">"}
            </button>

            {output.glazewm.bindingModes.map((bindingMode) => (
              <button
                key={bindingMode.name}
                onClick={() =>
                  output.glazewm.runCommand(
                    `wm-disable-binding-mode --name ${bindingMode.name}`,
                  )
                }
              >
                {bindingMode.displayName ?? bindingMode.name}
              </button>
            ))}
          </>
        )}
      </div>

      <div className="right">
        {statuses.map(
          (status, index) =>
            output[status.name] && (
              <>
                <div className={status.name} key={status.name}>
                  <div>{status.func(output[status.name])}</div>
                  {index === statuses.length - 1 ? (
                    <span>&nbsp;</span>
                  ) : (
                    <span>&nbsp;{separator}&nbsp;</span>
                  )}
                </div>
              </>
            ),
        )}
      </div>
    </div>
  );
}

export default App;
