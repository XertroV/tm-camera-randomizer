[Setting category="General" name="Enabled"]
bool S_Enabled = true;

[Setting category="General" name="Randomize Period (seconds)"]
float S_RandomizePeriod = 3.0;

enum CamChoice {
    Cam1, Cam1Alt,
    Cam2, Cam2Alt,
    Cam3, Cam3Alt,
    Cam7, Cam7Drivable,
    CamBackwards,
}

[Setting category="General" name="Include Cam 1"]
bool S_Cam1 = true;
[Setting category="General" name="Include Cam 1 Alt"]
bool S_Cam1Alt = true;
[Setting category="General" name="Include Cam 2"]
bool S_Cam2 = true;
[Setting category="General" name="Include Cam 2 Alt"]
bool S_Cam2Alt = true;
[Setting category="General" name="Include Cam 3"]
bool S_Cam3 = true;
[Setting category="General" name="Include Cam 3 Alt"]
bool S_Cam3Alt = true;
[Setting category="General" name="Include Cam 7 Drivable (Will target your car)"]
bool S_Cam7Drivable = true;
[Setting category="General" name="Include Cam 7 (Not drivable)"]
bool S_Cam7 = false;
[Setting category="General" name="Include Backwards Cam"]
bool S_CamBackwards = false;


[SettingsTab name="Debug"]
void S_DebugTab() {
    UI::TextWrapped("Current Camera: " + GetCameraStatus().ToString());

    if (UI::Button("Set Cam1")) {
        SetCamChoice(CamChoice::Cam1);
    }
    if (UI::Button("Set Cam1Alt")) {
        SetCamChoice(CamChoice::Cam1Alt);
    }
    if (UI::Button("Set Cam2")) {
        SetCamChoice(CamChoice::Cam2);
    }
    if (UI::Button("Set Cam2Alt")) {
        SetCamChoice(CamChoice::Cam2Alt);
    }
    if (UI::Button("Set Cam3")) {
        SetCamChoice(CamChoice::Cam3);
    }
    if (UI::Button("Set Cam3Alt")) {
        SetCamChoice(CamChoice::Cam3Alt);
    }
    if (UI::Button("Set Cam7")) {
        SetCamChoice(CamChoice::Cam7);
    }
    if (UI::Button("Set Cam7Drivable")) {
        SetCamChoice(CamChoice::Cam7Drivable);
    }
    if (UI::Button("Set CamBackwards")) {
        SetCamChoice(CamChoice::CamBackwards);
    }
}
