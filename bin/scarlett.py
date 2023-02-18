#!/usr/bin/python3

import argparse
import subprocess


my = {
    'card': 1,
    'mix': {
        'main': {
            'left': 'Mix A',
            'right': 'Mix B'
        },
        'atem': {
            'left': 'Mix C',
            'right': 'Mix D'
        }
    },
    'inputs': {
        'mic1': 'Analogue 1',
        'line2': 'Analogue 2',
        'aux': {
            'left': 'Analogue 3',
            'right': 'Analogue 4'
        },
        'atem': {
            'left': 'S/PDIF 1',
            'right': 'S/PDIF 2'
        },
        'computer': {
            'left': 'PCM 1',
            'right': 'PCM 2'
        }
    },
    'outputs': {
        'main': {
            'left': 'Analogue Output 01',
            'right': 'Analogue Output 02'
        },
        'atem': {
            'left': 'Analogue Output 03',
            'right': 'Analogue Output 04'
        }
    }
}

mixerRoutePresets = {
    'default': {
        'Mixer Input 01': my['inputs']['mic1'],
        'Mixer Input 02': my['inputs']['line2'],
        'Mixer Input 03': my['inputs']['aux']['left'],
        'Mixer Input 04': my['inputs']['aux']['right'],
        'Mixer Input 05': my['inputs']['atem']['left'],
        'Mixer Input 06': my['inputs']['atem']['right'],
        'Mixer Input 07': my['inputs']['computer']['left'],
        'Mixer Input 08': my['inputs']['computer']['right'],
        'PCM 01': my['inputs']['mic1'],
        'PCM 02': my['inputs']['line2'],
        'PCM 03': my['inputs']['aux']['left'],
        'PCM 04': my['inputs']['aux']['right'],
        'PCM 05': 'Analogue 5',
        'PCM 06': 'Analogue 6',
        'PCM 07': my['inputs']['atem']['left'],
        'PCM 08': my['inputs']['atem']['right'],
        my['outputs']['main']['left']: my['mix']['main']['left'],
        my['outputs']['main']['right']: my['mix']['main']['right'],
        my['outputs']['atem']['left']: my['mix']['atem']['left'],
        my['outputs']['atem']['right']: my['mix']['atem']['right']
    }
}

mixerLevelPresets = {
    'default': {
        # Mic (Mono)
        'Input 01': { 
            my['mix']['main']['left']: 85,
            my['mix']['main']['right']: 85,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        # Pocket Operator (Mono)
        'Input 02': {
            my['mix']['main']['left']: 100,
            my['mix']['main']['right']: 100,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        # Aux (Stereo)
        'Input 03': {
            my['mix']['main']['left']: 0,
            my['mix']['main']['right']: 0,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        'Input 04': {
            my['mix']['main']['left']: 0,
            my['mix']['main']['right']: 0,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        # Atem Program (Stereo)
        'Input 05': {
            my['mix']['main']['left']: 0,
            my['mix']['main']['right']: 0,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        'Input 06': {
            my['mix']['main']['left']: 0,
            my['mix']['main']['right']: 0,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        # Computer (Stereo)
        'Input 07': {
            my['mix']['main']['left']: 93,
            my['mix']['main']['right']: 0,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        'Input 08': {
            my['mix']['main']['left']: 0,
            my['mix']['main']['right']: 93,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        }
    },
    'atem': {
        # Mic (Mono)
        'Input 01': { 
            my['mix']['main']['left']: 0,
            my['mix']['main']['right']: 0,
            my['mix']['atem']['left']: 88,
            my['mix']['atem']['right']: 88
        },
        # Pocket Operator (Mono)
        'Input 02': {
            my['mix']['main']['left']: 100,
            my['mix']['main']['right']: 100,
            my['mix']['atem']['left']: 90,
            my['mix']['atem']['right']: 90
        },
        # Aux (Stereo)
        'Input 03': {
            my['mix']['main']['left']: 0,
            my['mix']['main']['right']: 0,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        'Input 04': {
            my['mix']['main']['left']: 0,
            my['mix']['main']['right']: 0,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        # Atem Program (Stereo)
        'Input 05': {
            my['mix']['main']['left']: 95,
            my['mix']['main']['right']: 0,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        'Input 06': {
            my['mix']['main']['left']: 0,
            my['mix']['main']['right']: 95,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        # Computer (Stereo)
        'Input 07': {
            my['mix']['main']['left']: 93,
            my['mix']['main']['right']: 0,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        },
        'Input 08': {
            my['mix']['main']['left']: 0,
            my['mix']['main']['right']: 93,
            my['mix']['atem']['left']: 0,
            my['mix']['atem']['right']: 0
        }
    }
}

########### Route Functions

def setRoute(destination, source, verbose):
    args = [
        "amixer",
        "-c",
        str(my['card']),
        "sset",
        destination,
        source
    ]
    try:
        result = subprocess.run(args, capture_output=True, text=True)
        if(verbose):
            print("Route: {} <-- {}".format(destination, source))
            print(result.stdout)
    except subprocess.CalledProcessError as exc:
        print(
            f"Returned {exc.returncode}\n{exc}"
        )

def setRoutes(preset, verbose):
    v = verbose
    complete = False

    for p in mixerRoutePresets:
        if(p == preset):
            print("Setting route preset to: {}".format(preset))
            for destination in mixerRoutePresets[p]:
                setRoute(destination, mixerRoutePresets[p][destination], v)
                complete = True

    if(complete == False):
        print("No matching route preset found")

########### Mix Functions

def setMixVolume(mix, mixInput, volume, verbose):
    args = [
        "amixer",
        "-c",
        str(my['card']),
        "sset",
        "{} {}".format(mix, mixInput),
        "{}%".format(volume)
    ]

    try:
        result = subprocess.run(args, capture_output=True, text=True)
        if(verbose):
            print("Mix Volume: {} <-- {} @ {}%".format(mix, mixInput, volume))
            print(result.stdout)
    except subprocess.CalledProcessError as exc:
        print(
            f"Returned {exc.returncode}\n{exc}"
        )

def setMix(preset, verbose):
    v = verbose
    complete = False

    for p in mixerLevelPresets:
        if(p == preset):
            print("Setting mixer levels preset to: {}".format(preset))
            for mixInput in mixerLevelPresets[p]:
                for mix in mixerLevelPresets[p][mixInput]:
                    setMixVolume(mix, mixInput, mixerLevelPresets[p][mixInput][mix], v)
                    complete = True

    if(complete == False):
        print("No matching mix preset found")

########### Main

parser = argparse.ArgumentParser(description='Scarlett routes and mixer control')
parser.add_argument("-p", "--profile", help="specify route & mix profile")
parser.add_argument("-v", "--verbose", action="count", help="verbose command output")
args = parser.parse_args()
verbose = False

if args.verbose:
    verbose = True 
if args.profile:
    if(args.profile == 'default'):
        setRoutes('default', verbose)
        setMix('default', verbose)
    elif(args.profile == 'atem'):
        setRoutes('default', verbose)
        setMix('atem', verbose)
else:
    setRoutes('default', verbose)
    setMix('default', verbose)

