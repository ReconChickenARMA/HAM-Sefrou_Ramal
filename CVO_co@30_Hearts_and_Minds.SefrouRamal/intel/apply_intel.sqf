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

private _intel_str_sfia_regionalCommand = format [
"
<font size='12' face='EtelkaMonospacePro'>
From:    SFIA Intelligence Unit, Sefrou-Ramal
To:      SFIA Regional Command, Sefrou-Ramal
Subject: Interrogation Report - Urgent %1</font>
%1
Commander, we have gotten some interesting intel from a civilian we captured.%
The civilian was in possession of a phone when he ran into the patrol that detained him, and was running from something out in the desert.%1
Kept raving about black figures, shadows come to life.%1
He showed us the picture, after some prodding, and it looks as though our neighbors to the north have been less than environmentally friendly in their waste disposal practices. %1
we are holding him for now, he may still have more to tell us.%
%1
%1
%1
<font size='12' face='EtelkaMonospacePro'>
From:     SFIA Central Command
To:      SFIA Regional Command, Sefrou-Ramal
Subject: A Statement of Intent from Central Command %1</font>
%1
The Sefrawi Freedom and Independence Army has always sought national sovereignty, and this policy extends to the natural resources of our beautiful nation.%1
Unfortunately, roosting atop our national treasure is a den of desert rats, rats that must be driven back into the sands.%1
We do not seek to kill these rats, but to prove to them that they are not welcome here.%1
There will be casualties in this process, but we seek a humane solution to this issue, hoping to prevent as many unnecessary deaths as possible%1
To that end, we will be distributing repurposed aid packages, optimized by our best scientists to drive the rats from their dens, without killing the lot of them.%1
%1
%1
%1
<font size='12' face='EtelkaMonospacePro'>
From:     SFIA Central Command
To:      SFIA Regional Command, Sefrou-Ramal
Subject: Special Diet %1</font>
%1
Our scientific division has further refined our new “special diet” and it should work as planned now.%1
I don’t care how you do it, but get this food to the locals.%1
It killed the subjects within hours of ingestion, we need to work to extend the onset, and decrease the presenting symptoms.%1
More puzzles, every day…%1
",
"<br />"
];

private _intel_str_sfia_science = format [
"
<font size='12' face='EtelkaMonospacePro'>
From:  Dr. Ferhat, SFIA Science Division%1
To:  Dr. Oulad, SFIA Science Division%1
Subject: Samples From Scouts %1</font>
%1
Dr. Farhan is requesting that we retrieve samples of the hazardous materials our scouts have been investigating for the past few days.%1
He wants to try mixing some of it into some rations and feeding it to the locals, apparently he’s working on that new initiative that Central Command announced.%1
%1
%1
%1
<font size='12' face='EtelkaMonospacePro'>
From: Dr. Oulad, SFIA Science Division%1
To:  Dr. Ferhat, SFIA Science Division%1
Subject: Bad Batch %1</font>
Last batch was too potent, according to those that observed the last field test.%1
We need to reduce the dose by at least half, and make sure someone gets photos, this time.%1
Make sure you are not seen by those blue clowns, we are trying to work discreetly.%1
",
"<br />"
];

private _intel_str_office_cellphone_toilet = format [
"
<font size='14' face='EtelkaMonospacePro'>
Messenger App History with 'Dad' - 1 year ago:%1</font>%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>Dad? Am I adopted?</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Fuck no! Why the fuck whould I pick you?</font>%1%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>... :(</font>%1%1
",
"<br />"
];

private _intel_str_sfia_cellphone = format [
"
<img width='350' image='%2'/>%1%1
<font size='14' face='EtelkaMonospacePro'>
Messenger App history with 'Unknown' - 1 year ago:%1</font>%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>This you?</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>How did you get this number? How did you get that picture?</font>%1%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>Neither of those things matter, at least not right now.%1What matters is that I have evidence of your crimes.%1Conveniently, I am a reasonable man, and I am willing to deal.</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Deal? Why would I deal with a dead man?</font>%1%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>Show this to your boss, or I will publish the photos now.%1I want to negotiate, but you seem unwilling.</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Sure, whatever you say.%1But when a metric ton of whoopass lands on your head, don’t blame me.</font>%1%1
",
"<br />",
getMissionPath "intel\IONdumpevidence.paa"
];

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

private _intel_str_daltgreen_cell_unknown = format [
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
it's been such a long time since the company party here in Morrocco! You should come by again soon, we all miss you!%1 But I know, I know...%1%1%1

Oh well, I have a new Inquiry that came in today. Daltgreen Mining Limited. It sounds as boring as usual but their offer is extraordinary - let me know what you think!
%1
%1
Best, Andrea
%1
%1
## FORWARDED MESSAGE ##%1
%1
Subject: Inquiery of Service - North Africa%1
%1
Our company has maintained a mine in the Sefrou-Ramal region for several years now, but the current security situation requires a more robust security presence than our company can provide.%1%1
We are interested in hiring a team of security personnel from ION, and are able to pay generously.%1%1
The site will require approximately 30 security personnel, as well as vehicles and equipment for them.%1%1
We have housing on-site, but ION will need to supply perishables, such as food and clean water.%1%1
We hope that you are open to accepting this contract, and look forward to a fruitful partnership.%1%1
%1
S. Hereford, Daltgreen North Africa Director%1
%1
%1
%1
<font size='12' face='EtelkaMonospacePro'>
From:    manager@daltgreen.sefrouramal.site%1
To:      g.avrakotos@ion.581.sierraromeo.security%1
Subject: A Sensitive Matter %1</font>
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
Messenger App history with 'Dave' - 7 days ago:%1</font>%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>Did you hear about the goat herders?</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>No, what stupid shit did they do now?</font>%1%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>Some of them are sick, and apparently the local elder has been chewing the gate guards ear off about it.%1Something about it being our fault?</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Bullshit, our fault.%1I bet they were scrapping in that old military area again, and got more than they bargained for.</font>%1%1%1%1
<font size='14' face='EtelkaMonospacePro'>
Messenger App history with 'Steve' - 30 minutes ago:%1</font>%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>Man.. the footballgame was dogshit last night...%1 at least the boss egave us the evening off so we could watch it with a couple of beers. - how was your shift?</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>Dude, i hope your hangover is fucking you up - i had to work since 3 in the morning over here at the pumphouse - my back hurts!</font>%1%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>Gotta go, there is some shit going on at the gate....%1 someone said something about UNA?</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>What? Shit... maybe they are onto us from the shit we pulled in the village?</font>%1%1
<font size='12' color='#2dc492' face='EtelkaMonospacePro'>BRO!!!!!1111 YOU GOTTA BAIL! They are here to arrest us!</font>%1%1
<font size='12' color='#2d97fa' face='EtelkaMonospacePro'>FUCK</font>%1%1
",
"<br />"
];



private _intel_str_prisoner_cell = format [
"
<img width='350' image='%1'/>
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
<font size='24' face='shaffilastri'>Take these barrels over to the old military base, the other lads found a way through the minefield there - finally!%1
Theres some old busted domes and an old dozer - we will be stowing barrels there until we can find a better solution.</font>%1
",
"<br />"
];

private _intel_str_ion_note_weapons = format [
"
You found a handwritten memo in the Daltgreen Office building near someones smoking spot:%1
<font size='24' face='shaffilastri'>
Theres a warehouse in M Semrir, south of the ore piles.%1
Take a few cases of guns, and have a chat with the officer there.%1
See what kinds of things they want in the future, and what we can get from them. </font>%1
",
"<br />"
];

private _intel_str_sfia_map = format [
"
<img width='350' image='%1'/>
",
getMissionPath "intel\handdrawnmapws.paa"
];

private _intel_str_ion_photo_boys = format [
"
<img width='350' image='%1'/>
",
getMissionPath "intel\IONlostfriends.paa"
];

private _intel_str_whiteboard_map = format [
"
<img width='350' image='%1'/>
",
getMissionPath "intel\whiteboard\whiteboard-overlay-map.paa"
];
private _intel_str_photo_a10 = format [
"
<img width='350' image='%1'/>
",
getMissionPath "intel\a10.paa"
];

private _intel_str_whiteboard_science = format [
"
<img width='350' image='%2'/>%1
<img width='350' image='%3'/>%1
<img width='350' image='%4'/>%1
<img width='350' image='%5'/>%1
<img width='350' image='%6'/>%1
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
        "intel_photo_ion_a10",
        [
            true,                               // boolean for "_deleteOnPickup",
            "Investigate the Photograph",      // title/text that will show with the intel-action
            _soundBody,                           // Array of Strings - Classnames for _actionSounds - see comment above
            10,                                 //duration in seconds
            "Photograph: A10",
            _intel_str_photo_a10
        ]
    ],
    [    
        "intel_laptop_daltgreen_manager",
        [
            true,                               // boolean for "_deleteOnPickup",
            "Search the Laptop for Intel",      // title/text that will show with the intel-action
            _soundPC,                           // Array of Strings - Classnames for _actionSounds - see comment above
            15,                                 //duration in seconds
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
            15,     //duration in seconds
            "Daltgreen Laptop: Finance",
            _intel_str_daltgreen_finance
        ]
    ],
    [
        "intel_cellphone_daltgreen_unknown",
        [
            true,
            "Search the Cellphone for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "Daltgreen Cellphone: Unkown",
            _intel_str_daltgreen_cell_unknown
        ]
    ],
    [
        "intel_cellphone_daltgreen_shiftCaptain",
        [
            true,
            "Search the Cellphone for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
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
            15,     //duration in seconds
            "ION Laptop: Manager",
            _intel_str_ion_laptop_manager
        ]
    ],
    [
        "intel_cellphone_ion_survivor",
        [
            true,
            "Search the Cellphone for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "ION Cellphone: Manager",
            _intel_str_ion_cellphone
        ]
    ],
    [
        "intel_cellphone_prisoner",
        [
            true,
            "Search the Phone for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "Cellphone: Prisoner",
            _intel_str_prisoner_cell
        ]
    ],
    [
        "intel_note_elder",
        [
            true,
            "Investigate the Paper",
            _soundBody,     // Array of Strings - Classnames for _actionSounds - see comment above
            3,     //duration in seconds
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
            3,     //duration in seconds
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
            3,     //duration in seconds
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
            3,     //duration in seconds
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
            3,     //duration in seconds
            "Photograph",
            _intel_str_ion_photo_boys
        ]
    ],
    [
        "intel_laptop_sfia_regionalCommand",
        [
            true,
            "Search the Laptop for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "SFIA Laptop: Regional Commander",
            _intel_str_sfia_regionalCommand
        ]
    ],

    [
        "intel_laptop_sfia_science",
        [
            true,
            "Search the Laptop for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "SFIA Laptop: Science Division",
            _intel_str_sfia_science
        ]
    ],
    [
        "intel_cellphone_sfia",
        [
            true,
            "Search the Cellphone for Intel",
            _soundPC,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "SFIA Cellphone: Unknown",
            _intel_str_sfia_cellphone
        ]
    ],
    [
        "intel_whiteboard_map",
        [
            true,
            "Take the Map from the Whiteboard",
            _soundBody,     // Array of Strings - Classnames for _actionSounds - see comment above
            7,     //duration in seconds
            "Whiteboard: Map",
            _intel_str_whiteboard_map,
            1
        ]
    ],
    [
        "intel_whiteboard_science",
        [
            true,
            "Take the Data from the Whiteboard",
            _soundBody,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "Whiteboard: Science Data",
            _intel_str_whiteboard_science,
            1
        ]
    ],
    [
        "intel_cellphone_daltgreen_toilet",
        [
            true,
            "Check the Phone from the Toilet",
            _soundBody,     // Array of Strings - Classnames for _actionSounds - see comment above
            15,     //duration in seconds
            "Cellphone: Dad?",
            _intel_str_office_cellphone_toilet,
            1
        ]
    ]
];

{
    [{ 
        private _object = missionNamespace getVariable [_this#0, objNull];
        if ( is3DENPreview ) then { _str = format ["intel action added to: %1 - %2", _this#0, _object]; diag_log _str; systemChat _str; };

        _this#1 params ["_deleteOnPickup", "_actionText", "_actionSounds", "_duration", "_title", "_text", ["_actionType", 1, [0]]];
        if ( is3DENPreview ) then { _duration = 1; };
        private _jipID = ["zen_modules_addIntelAction", [_object, 0, _deleteOnPickup, _actionType, _actionText, _actionSounds, _duration, _title, _text]] call CBA_fnc_globalEventJIP;
        [_jipID, _object] call CBA_fnc_removeGlobalEventJIP;
        
    } , [_x,_y], _forEachIndex + 1] call CBA_fnc_waitAndExecute;
} forEach _intelParameters;

intel_whiteboard_map attachTo [intel_whiteboard, [-0.28,-0.005,0]];
intel_whiteboard_science attachTo [intel_whiteboard, [0.2,-0.01,0]];
