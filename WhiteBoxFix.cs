﻿using BepInEx;

namespace WhiteBoxFix
{
    [BepInPlugin("com.MarsyApp.WhiteBoxFix", "MarsyApp-WhiteBoxFix", "1.1.0")]
    public class WhiteBoxFix : BaseUnityPlugin
    {
        private void Awake()
        {
            Patcher.PatchAll();
        }
    }
}