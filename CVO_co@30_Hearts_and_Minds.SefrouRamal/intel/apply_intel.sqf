// This file should only be executed by the server once. the globalEventJIP will handle everything else.

/*

 * Arguments:
 * 0: Object <OBJECT>
 * 1: Share With (0 - Side, 1 - Group, 2 - Nobody) <NUMBER>
 * 2: Delete On Completion <BOOL>
 * 3: Action Type (0 - Hold Action, 1 - ACE Interaction Menu) <NUMBER>
 * 4: Action Text <STRING>
 * 5: Action Sounds <ARRAY>
 * 6: Action Duration <NUMBER>
 * 7: Intel Title <STRING>
 * 8: Intel Text <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_object, 0, true, 0, "Pick Up Intel", 1, "Intel!", "Notes..."] call zen_modules_fnc_addIntelAction

*/

if !(isServer) exitWith {};

// https://community.bistudio.com/wiki/Structured_Text


private _soundPC = ["OMIntelGrabPC_01", "OMIntelGrabPC_02", "OMIntelGrabPC_03","OMIntelGrabLaptop_01", "OMIntelGrabLaptop_02", "OMIntelGrabLaptop_03"];
private _soundBody = ["OMIntelGrabBody_01", "OMIntelGrabBody_02", "OMIntelGrabBody_03"];


private _intel_str_daltgreen_manager = format [
"
<font size='12' face='EtelkaMonospacePro'>
From:    director@daltgreen.northafrica.div%1
To:      manager@daltgreen.sefrouramal.site%1
Subject: Q1 2036 Production Results %1</font>
%1
The material output of our mine in Sefrou-Ramal has been disappointing as of late, coming in at 12% below projections.%1
This is unacceptable, our bottom line has dipped a whole point due to your production difficulties.%1
While we appreciate that the region has some intrinsic difficulties in regards to our businesses, it is your job as the manager of this site to maintain stability in production.%1
We have released a small discretionary fund for your use, conditional on the improvement of the mines production.%1
%1
S. Hereford, Daltgreen North Africa Director
%1
%1
%1
<font size='12' face='EtelkaMonospacePro'>
From:    director@daltgreen.NorthAfrica.Div%1
To:      manager@daltgreen.sefrouramal.site%1
Subject: Q4 2036 Production Results %1</font>
%1
Just following up on our conversation at the beginning of the quarter regarding inadequate production from the mine under your management.%1
On the positive side, your mine has exceeded expectations, coming in 15% above predicted output.%1
The board is pleased, and appreciates your prompt response to the issues in production.%1
Unfortunately, the accounting department has determined that a portion of the discretionary fund allocated to you needs to be used to cover losses in other parts of the business, so you will need to make some cuts or find some other way to fund your innovations.%1
%1
S. Hereford, Daltgreen North Africa Director
",
"<br />"
];

private _intel_str_daltgreen_finance = format [
"
<font size='12' face='EtelkaMonospacePro'>
Directory: /Users/Finances/Payroll/2036%1
File: 2036-Q4-Payroll.xslx%1</font>
%1
<font size='10' face='EtelkaMonospacePro'>
B. Keller    - Site Manager   - $60,000 - wired to account%1
I. Menendez  - Shift Captain  - $17,000 - wired to account%1
L. Mitchell  - Shift Captain  - $15,500 - payed in cash%1
L. Hart      - Shift Captain  - $16,000 - wired to account%1
A. ag-Ferhat - Shift Captain  - $ 7,750 - delayed%1
W. Hill      - Mechanic       - $12,880 - paid in cash%1
B. ag-Ferhat - Mechanic       - $ 2,120 - delayed%1
A. Walter    - Geologist      - $24,340 - wired to account%1
C. Green     - Hydrologist    - $20,000 - wired to account%1
C. Green     - Hydrologist    - $ 7,750 - paid in cash%1
N. Field     - Chemist        - $25,550 - wired to account%1
G. Avrokotos - Security Chief - $60,000 - paid in cash%1
</font>",
"<br />"
];

private _intel_str_daltgreen_cell_unkown = format [
"
<font size='12' face='EtelkaMonospacePro'>
Message history:%1
From: B. Keller%1
To: All Shift Captains</font>%1
%1
Hey Shift Captains, we at Daltgreen have been pioneers in extraction for decades, leading the field in new and exciting techniques for mining.%1
Today, we are rolling out another of our revolutionary innovations in geoengineering, and you will be the first people to use this revolution in the field!%1
One word of caution, some of the materials we will be working with will be moderately hazardous, and we recommend that all Daltgreen personnel use appropriate personal protective equipment.%1
Your teams will be issued the correct PPE at your next pre-shift meeting.%1
",
"<br />"
];

private _intel_str_daltgreen_cell_menendez = format [
"
<font size='12' face='EtelkaMonospacePro'>
Message history:%1
From: I. Menendez%1
To: B. Keller</font>%1
%1
Hey boss,%1
a couple of workers came to bother me today about the earthquakes, saying it was our fault!%1
I told them it wasnt their problem, and assured them the company had done studies of the area before, and found a minor fault that could be causing the quakes.%1
I showed them the papers the head office sent here, and they seemed to calm down a bit.%1
Thanks for those, by the way, reading them settled my mind as well.%1
",
"<br />"
];

private _intel_str_ion_laptop_manager = format [
"
<font size='12' face='EtelkaMonospacePro'>
From:    a.badeaux@ion.HQ3.africa.security%1
To:      g.avrakotos@ion.581.sierraromeo.security%1
Subject: FWD: Inquiery of Service - North Africa%1</font>
%1
Hey Avrakotos,%1
it's been such a long time since the company party here in marocco! You should come by again soon, we all miss you!%1 But I know, I know...%1%1%1

Oh well, I have a new Inquiry that came in today. Daltgreen Mining Limited. It sounds as boring as usual but they pay is good - let me know what you think!
%1
%1
Best, Andrea

%1
> Our company has maintained a mine in the Sefrou-Ramal region for several years now, but the current security situation requires a more robust security presence than our company can provide.%1
> We are interested in hiring a team of security personnel from ION, and are able to pay generously.%1The site will require approximately 30 security personnel, as well as vehicles and equipment for them.%1We have housing on-site, but ION will need to supply perishables, such as food and clean water.%1We hope that you are open to accepting this contract, and look forward to a fruitful partnership.%1
> %1
> S. Hereford, Daltgreen North Africa Director
%1
%1
%1
<font size='12' face='EtelkaMonospacePro'>
From:    manager@daltgreen.sefrouramal.site%1
To:      g.avrakotos@ion.581.sierraromeo.security%1
Subject: Q1 2036 Production Results %1</font>
%1
I appreciate the efforts you have made to turn around a disappointing mine, and your efforts have not gone unnoticed at the head office, but there is still an issue that needs to be resolved on your end.%1
Daltgreen has limited contracts with hazardous materials disposal companies in the North Africa region, and as of recently, the UNA are keeping tabs on what Daltgreen ships in and out of the region.%1
We need you to dispose of any waste materials produced in your mining locally, using resources available to you in-country.%1
The company is not interested in footing a bill for more international logistics, so this is your problem.%1
Deal with it, or the head office may not look so kindly on you or our department.%1
%1
B. Keller, Daltgreen Sefrou Ramal Site Manager
%1
%1
%1
<font size='12' face='EtelkaMonospacePro'>
From:    g.avrakotos@ion.581.sierraromeo.security%1
To:      manager@daltgreen.sefrouramal.site%1
Subject: SFIA Interference %1</font>
%1
Recently, one of our patrols was approached by a squad of SFIA with an officer in tow, asking to negotiate.%1
We asked them what they thought they could offer us, and they implied that they were in possession of some sort of incriminating evidence about the activities of both our companies.%1
We were sceptical at first, but it does appear to be something that could make all of our lives difficult, at the very least.%1
The ION commander on the field is requesting permission to negotiate, and we are inclined to grant it.%1What is Daltgreens perspective on this?%1
Are you comfortable with us proceeding?%1
We would be sure to keep everything extremely confidential.%1
%1
%1
%1
<font size='12' face='EtelkaMonospacePro'>
From:    manager@daltgreen.sefrouramal.site%1
To:      g.avrakotos@ion.581.sierraromeo.security%1
Subject: IDAP Investigator%1</font>
%1
Bad news, it looks like some of the holier-than-thou folks over at IDAP have taken an increased interest in the region.%1
For now, everything should be okay, but if they get too close to anything making the company look bad, use your own discretion to solve the problem.%1
Just make sure it doesnt come back to us.
%1
%1
%1
<font size='12' face='EtelkaMonospacePro'>
From:    g.avrakotos@ion.581.sierraromeo.security%1
To:      manager@daltgreen.sefrouramal.site%1
Subject: Re: Re: More equipment shipments%1</font>
%1
What you do with your gear is your own business, and there is a bit more room in the budget for logistics, if you need it, but remember to be careful.%1
A few guns here and there isn’t an issue, heck, it might even deal with that IDAP investigator for us, but both our companies have an image to maintain.%1
If it got out that we were doing anything illegal with weapons, it could set back our progress in the region by years.%1
%1
%1
%1
",
"<br />"
];

// #63b4ff
//#2d97fa

private _intel_str_ion_cellphone = format [
"
<font size='14' face='EtelkaMonospacePro'>
Messenger App history with 'Dave':%1</font>%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>Did you hear about the goat herders?</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>No, what stupid shit did they do now?</font>%1%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>Some of them are sick, and apparently the local elder has been chewing the gate guards ear off about it.%1Something about it being our fault?</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Bullshit, our fault.%1I bet they were scrapping in that old military area again, and got more than they bargained for.</font>%1%1
",
"<br />"
];



private _intel_str_prisoner_cell = format [
"
<img width='500' image='%1'/>
",
getMissionPath "intel\IONdumpevidence.paa"
];

private _intel_str_elder_note = format [
"
You found a handwritten note in the ION barracks under a bed:%1
<font size='24' color='#ff000d' face='shaffilastri'>Take your team and go make sure that village elder cant bother us any more.</font>%1
",
"<br />"
];

private _intel_str_ion_note_barrels = format [
"
You found a handwritten memo near some Barrels in a Warehouse:%1
<font size='24' face='shaffilastri'>Take these over barrels over to the old military base, a patrol found a way through the mines finally.%1
Theres some old busted domes, we are stowing barrels there until we can find a better solution.</font>%1
",
"<br />"
];

private _intel_str_ion_note_weapons = format [
"
You found a handwritten memo in the ION Vehicle Pool on the floor:%1
<font size='24' face='shaffilastri'>
Theres a warehouse in M Semrir, south of the ore piles.%1
Take a few cases of guns, and have a chat with the officer there.%1
See what kinds of things they want in the future, and what we can get from them. </font>%1
",
"<br />"
];

private _intel_str_sfia_map = format [
"
<img width='500' image='%1'/>
",
getMissionPath "intel\handdrawnmapws.paa"
];

private _intel_str_ion_photo_boys = format [
"
<img width='500' image='%1'/>
",
getMissionPath "intel\IONlostfriends.paa"
];

private _intel_str_whiteboard_map = format [
"
<img width='500' image='%1'/>
",
getMissionPath "intel\whiteboard\whiteboard-overlay-map.paa"
];

private _intel_str_whiteboard_science = format [
"
<img width='500' image='%2'/>%1
<img width='500' image='%3'/>%1
<img width='500' image='%4'/>%1
<img width='500' image='%5'/>%1
<img width='500' image='%6'/>%1
",
"<br />",
getMissionPath "intel\whiteboard\graphic01.paa",
getMissionPath "intel\whiteboard\graphic02.paa",
getMissionPath "intel\whiteboard\graphic03.paa",
getMissionPath "intel\whiteboard\graphic04.paa",
getMissionPath "intel\whiteboard\graphic05.paa"
];


private _intelParameters = createHashMapFromArray [
    [
        "intel_laptop_daltgreen_manager",
        [
            true,                               // boolean for "_deleteOnPickup",
            "Search the Laptop for Intel",      // title/text that will show with the intel-action
            _soundPC,                           // Array of Strings - Classnames for _actionSounds - see comment above
            30,                                 //duration in seconds
            "Daltgreen Laptop: Manager",
            _intel_str_daltgreen_manager
        ]
    ],
    [
        "intel_laptop_daltgreen_finance",
        [
            true,
            "Search the Laptop for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            30,     //duration in seconds
            "Daltgreen Laptop: Finance",
            _intel_str_daltgreen_finance
        ]
    ],
    [
        "intel_cellphone_daltgreen_unkown",
        [
            true,
            "Search the Cellphone for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            30,     //duration in seconds
            "Daltgreen Cellphone: Unkown",
            _intel_str_daltgreen_cell_unkown
        ]
    ],
    [
        "intel_cellphone_daltgreen_shiftCaptain",
        [
            true,
            "Search the Cellphone for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            30,     //duration in seconds
            "Daltgreen Cellphone: I. Menendez",
            _intel_str_daltgreen_cell_menendez
        ]
    ],
    [
        "intel_laptop_ion",
        [
            true,
            "Search the Laptop for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            30,     //duration in seconds
            "ION Laptop: Manager",
            _intel_str_ion_laptop_manager
        ]
    ],
    [
        "intel_cellphone_ion",
        [
            true,
            "Search the Cellphone for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            30,     //duration in seconds
            "ION Cellphone: Manager",
            _intel_str_ion_cellphone
        ]
    ],
    [
        "intel_cellphone_prisoner",
        [
            true,
            "Search the Laptop for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            30,     //duration in seconds
            "Cellphone: Prisoner?",
            _intel_str_prisoner_cell
        ]
    ],
    [
        "intel_note_elder",
        [
            true,
            "Investigate the Paper",
            _soundBody,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "Handwritten Note: Unkown",
            _intel_str_elder_note
        ]
    ],
    [
        "intel_note_dump",
        [
            true,
            "Investigate the Paper",
            _soundBody,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "Memo: Barrels",
            _intel_str_ion_note_barrels
        ]
    ],
    [
        "intel_note_weapons",
        [
            true,
            "Investigate the Paper",
            _soundBody,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "Memo: Weapons",
            _intel_str_ion_note_weapons
        ]
    ],
    [
        "intel_photo_map",
        [
            true,
            "Investigate the Handdrawn Map",
            _soundBody,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "Handdrawn Map",
            _intel_str_sfia_map
        ]
    ],
    [
        "intel_photo_boys",
        [
            true,
            "Investigate the photograph",
            _soundBody,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "Photograph",
            _intel_str_ion_photo_boys
        ]
    ],
    [
        "intel_whitebaord-map",
        [
            true,
            "Take the Map from the Whiteboard",
            _soundBody,     // Array of Strings - Classnames for _actionSounds - see comment above
            10,     //duration in seconds
            "Whiteboard: Map",
            _intel_str_whiteboard_map
        ]
    ],
    [
        "intel_whitebaord-science",
        [
            true,
            "Take the Data from the Whiteboard",
            _soundBody,     // Array of Strings - Classnames for _actionSounds - see comment above
            20,     //duration in seconds
            "Whiteboard: Science Data",
            _intel_str_whiteboard_science
        ]
    ]
];

{
    [{ 

        private _object = missionNamespace getVariable [_this#0, objNull];
        _this#1 params ["_deleteOnPickup", "_actionText", "_actionSounds", "_duration", "_title", "_text"];

        private _jipID = ["zen_modules_addIntelAction", [_object, 0, _deleteOnPickup, 0, _actionText, _actionSounds, _duration, _title, _text]] call CBA_fnc_globalEventJIP;
        [_jipID, _object] call CBA_fnc_removeGlobalEventJIP;
        
    } , [_x,_y], _forEachIndex] call CBA_fnc_waitAndExecute;
} forEach _intelParameters;

/*
// Example


[, false, 0, "smol ima123ge", [], 1, "Shmol i123mmge", ]] call CBA_fnc_globalEventJIP;
*/