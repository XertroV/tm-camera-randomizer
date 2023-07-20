void Main() {
}
void OnDestroyed() { }
void OnDisabled() { OnDestroyed(); }

const string PluginIcon = Icons::Random + Icons::VideoCamera;
const string MenuName = PluginIcon + "\\$z " + Meta::ExecutingPlugin().Name;

/** Render function called every frame intended only for menu items in `UI`.
*/
void RenderMenu() {
    if (UI::MenuItem(MenuName, "", S_Enabled)) {
        S_Enabled = !S_Enabled;
    }
}

float lastRandomizeCheck = 0.0;

/** Called every frame. `dt` is the delta time (milliseconds since last frame).
*/
void Update(float dt) {
    if (!S_Enabled) return;
    if (lastRandomizeCheck + S_RandomizePeriod < (float(Time::Now) / 1000.0)) {
        RunRandomizeCheck();
    }
}

void RunRandomizeCheck() {
    lastRandomizeCheck = float(Time::Now) / 1000.0;
    CamChoice[] choices;
    if (S_Cam1) choices.InsertLast(CamChoice::Cam1);
    if (S_Cam1Alt) choices.InsertLast(CamChoice::Cam1Alt);
    if (S_Cam2) choices.InsertLast(CamChoice::Cam2);
    if (S_Cam2Alt) choices.InsertLast(CamChoice::Cam2Alt);
    if (S_Cam3) choices.InsertLast(CamChoice::Cam3);
    if (S_Cam3Alt) choices.InsertLast(CamChoice::Cam3Alt);
    if (S_Cam7) choices.InsertLast(CamChoice::Cam7);
    if (S_Cam7Drivable) choices.InsertLast(CamChoice::Cam7Drivable);
    if (S_CamBackwards) choices.InsertLast(CamChoice::CamBackwards);
    auto choiceIx = Math::Rand(0, choices.Length);
    auto choice = choices[choiceIx];
    SetCamChoice(choice);
}

void SetCamChoice(CamChoice cam) {
    bool alt = cam == CamChoice::Cam1Alt || cam == CamChoice::Cam2Alt || cam == CamChoice::Cam3Alt;
    bool drivable = cam != CamChoice::Cam7;
    CameraType setTo = cam == CamChoice::Cam1 || cam == CamChoice::Cam1Alt
        ? CameraType::Cam1
        : cam == CamChoice::Cam2 || cam == CamChoice::Cam2Alt
            ? CameraType::Cam2
            : cam == CamChoice::Cam3 || cam == CamChoice::Cam3Alt
                ? CameraType::Cam3
                : cam == CamChoice::Cam7 || cam == CamChoice::Cam7Drivable
                    ? CameraType::FreeCam
                    : cam == CamChoice::CamBackwards
                        ? CameraType::Backwards
                        : CameraType::Cam1
        ;
    auto app = GetApp();
    SetAltCamFlag(app, alt);
    SetDrivableCamFlag(app, drivable);
    SetCamType(app, setTo);
}
