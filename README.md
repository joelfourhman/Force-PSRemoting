# Force-PSRemoting

The purpose of this scriptlet is to force PS-Remoting to be enabled in environments where it is not natively enabled.
Some of the fix actions may fail, some may succeed, but that's alright. 
As long as one of the fix actions succeeds, then a PS-Remoting session should be established.
Upon closing the PS-Remoting session, Force-PS-Remoting.ps1 should clean up the effects of any of the attempted fix actions.

Force-PSRemoting is a work in progress and every effort will be made to insure that current system state is taken into account, and proper cleanup is conducted.


Contact me for more information:
joel.fourhman@gmail.com
