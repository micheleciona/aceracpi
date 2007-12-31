/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of dsdtdump.txt, Mon Dec 31 19:04:07 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00004DF9 (19961)
 *     Revision         0x01
 *     OEM ID           "NVIDIA"
 *     OEM Table ID     "MCP51M"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x0100000E (16777230)
 */
DefinitionBlock ("dsdtdump.aml", "DSDT", 1, "NVIDIA", "MCP51M", 0x06040000)
{
    Mutex (MSMI, 0x07)
    Method (PHSR, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, \_SB.PCI0.LPC0.INF)
        Store (Arg0, \_SB.PCI0.LPC0.BCMD)
        Store (0x80, \_SB.PCI0.LPC0.SMIC)
        Store (\_SB.PCI0.LPC0.INF, Local0)
        Release (MSMI)
        Return (Local0)
    }

    Method (HKEY, 1, NotSerialized)
    {
        PHSR (0x1E, Arg0)
    }

    Method (LAMN, 1, NotSerialized)
    {
        If (\_SB.AMW0.WLMP)
        {
            Store (Arg0, \_SB.AMW0.WLID)
            Notify (\_SB.AMW0, 0xB0)
        }
        Else
        {
            PHSR (0x1F, Arg0)
        }
    }

    Method (RBEC, 1, NotSerialized)
    {
        Return (PHSR (0x20, Arg0))
    }

    Method (WBEC, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, \_SB.PCI0.LPC0.INF1)
        Store (Arg0, \_SB.PCI0.LPC0.INF)
        Store (0x21, \_SB.PCI0.LPC0.BCMD)
        Store (0x80, \_SB.PCI0.LPC0.SMIC)
        Release (MSMI)
    }

    Method (MBEC, 3, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg2, \_SB.PCI0.LPC0.INF2)
        Store (Arg1, \_SB.PCI0.LPC0.INF1)
        Store (Arg0, \_SB.PCI0.LPC0.INF)
        Store (0x22, \_SB.PCI0.LPC0.BCMD)
        Store (0x80, \_SB.PCI0.LPC0.SMIC)
        Release (MSMI)
    }

    Name (B2ED, Buffer (0x1C)
    {
        /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0018 */    0x00, 0x00, 0x00, 0x00
    })
    Method (WH15, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        CreateDWordField (Arg1, 0x00, DEAX)
        CreateDWordField (Arg1, 0x04, DEBX)
        CreateDWordField (Arg1, 0x08, DECX)
        CreateDWordField (Arg1, 0x0C, DEDX)
        If (LEqual (\_SB.AMW0.WMID, 0x01))
        {
            CreateDWordField (Arg1, 0x10, DESI)
            CreateDWordField (Arg1, 0x14, DEDI)
            CreateDWordField (B2ED, 0x14, OESI)
            CreateDWordField (B2ED, 0x18, OEDI)
        }

        Store (DEAX, \_SB.PCI0.LPC0.WNVA)
        Store (DEBX, \_SB.PCI0.LPC0.WNVB)
        Store (DECX, \_SB.PCI0.LPC0.WNVC)
        Store (DEDX, \_SB.PCI0.LPC0.WNVD)
        If (LEqual (\_SB.AMW0.WMID, 0x01))
        {
            Store (DESI, \_SB.PCI0.LPC0.WNVS)
            Store (DEDI, \_SB.PCI0.LPC0.WNVI)
        }

        Store (0x23, \_SB.PCI0.LPC0.BCMD)
        Store (0x80, \_SB.PCI0.LPC0.SMIC)
        Concatenate (\_SB.PCI0.LPC0.WNVA, \_SB.PCI0.LPC0.WNVB, Local0)
        Concatenate (\_SB.PCI0.LPC0.WNVC, \_SB.PCI0.LPC0.WNVD, Local1)
        Concatenate (Local0, Local1, B2ED)
        Store (\_SB.PCI0.LPC0.WFLG, Index (B2ED, 0x10))
        If (LEqual (\_SB.AMW0.WMID, 0x01))
        {
            Store (\_SB.PCI0.LPC0.WNVS, OESI)
            Store (\_SB.PCI0.LPC0.WNVI, OEDI)
        }

        Release (MSMI)
        Return (B2ED)
    }

    Scope (\_TZ)
    {
        Name (TBSE, 0x0AAC)
        Name (CRT0, 0x00)
        Name (PSV0, 0x00)
        Name (PSVA, 0x00)
        ThermalZone (TZS0)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.EC0.THS0, Local0)
                    Store (\_SB.PCI0.EC0.KCSS, Local1)
                    Store (\_SB.PCI0.EC0.KOSD, Local2)
                }
                Else
                {
                    Store (RBEC (0x92), Local0)
                    And (Local0, 0x01, Local1)
                    And (Local0, 0x08, Local2)
                    Store (RBEC (0xA8), Local0)
                }

                If (LOr (Local1, PSVA))
                {
                    If (LGreaterEqual (PSVA, 0x01))
                    {
                        Subtract (CRT0, 0x02, Local0)
                    }
                    Else
                    {
                        If (LLessEqual (Local0, PSV0))
                        {
                            Add (PSV0, 0x02, Local0)
                        }
                    }
                }

                If (Local2)
                {
                    If (LLessEqual (Local0, CRT0))
                    {
                        Add (CRT0, 0x02, Local0)
                    }
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x20, \_SB.PCI0.EC0.TIID)
                    Store (\_SB.PCI0.EC0.TSC0, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x20)
                    Store (RBEC (0xD1), Local0)
                }

                If (LOr (LGreaterEqual (Local0, 0x80), LLess (Local0, 0x1E)))
                {
                    Store (0x78, Local0)
                }

                Store (Local0, CRT0)
                Return (C2K (Local0))
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Method (_PSV, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x20, \_SB.PCI0.EC0.TIID)
                    Store (\_SB.PCI0.EC0.TSP0, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x20)
                    Store (RBEC (0xD0), Local0)
                }

                If (LOr (LGreaterEqual (Local0, 0x80), LLess (Local0, 0x1E)))
                {
                    Store (0x5A, Local0)
                }

                Store (Local0, PSV0)
                Return (C2K (Local0))
            }

            Name (_TC1, 0x04)
            Name (_TC2, 0x03)
            Name (_TSP, 0x96)
        }

        ThermalZone (TZS1)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.EC0.THS1, Local0)
                }
                Else
                {
                    Store (RBEC (0xA9), Local0)
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x20, \_SB.PCI0.EC0.TIID)
                    Store (\_SB.PCI0.EC0.TSC1, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x20)
                    Store (RBEC (0xD3), Local0)
                }

                If (LOr (LGreaterEqual (Local0, 0x80), LLess (Local0, 0x1E)))
                {
                    Store (0x78, Local0)
                }

                Return (C2K (Local0))
            }
        }

        Method (C2K, 1, NotSerialized)
        {
            Store (Arg0, Local0)
            If (LLessEqual (Local0, 0x10))
            {
                Store (0x1E, Local0)
            }

            If (LGreaterEqual (Local0, 0x7F))
            {
                Store (0x1E, Local0)
            }

            Add (Multiply (Local0, 0x0A), TBSE, Local0)
            Return (Local0)
        }

        Method (SPSV, 2, NotSerialized)
        {
            ShiftLeft (0x01, Arg0, Local0)
            If (Arg1)
            {
                Or (PSVA, Local0, PSVA)
            }
            Else
            {
                And (PSVA, Not (Local0), PSVA)
            }
        }
    }

    Name (\_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S3, Package (0x04)
    {
        0x05, 
        0x05, 
        0x00, 
        0x00
    })
    Name (\_S4, Package (0x04)
    {
        0x06, 
        0x06, 
        0x00, 
        0x00
    })
    Name (\_S5, Package (0x04)
    {
        0x07, 
        0x07, 
        0x00, 
        0x00
    })
    Mutex (WLMX, 0x07)
    OperationRegion (EXCO, SystemIO, 0x72, 0x02)
    Field (EXCO, ByteAcc, NoLock, Preserve)
    {
        INDX,   8, 
        DATA,   8
    }

    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
    {
                Offset (0xEA), 
        WLIN,   1, 
        BTIN,   1, 
        BTLS,   1, 
        WLWI,   1, 
        BTWI,   1
    }

    Name (\DSEN, 0x01)
    Name (\CSTE, 0x00)
    Name (\NSTE, 0x00)
    Name (\SSTE, 0x00)
    Name (\ECON, 0x00)
    Name (SX, 0x00)
    Name (\WLAS, 0x00)
    Name (\PPCS, 0x00)
    Name (\PXFG, 0x00)
    Name (\OSYS, 0x00)
    Name (\LINX, 0x00)
    Name (\PPCM, 0x00)
    Method (\_PTS, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        Store (Arg0, \_SB.PCI0.EC0.SYSC)
        Store (0x01, \_SB.PCI0.EC0.MUTE)
        If (LEqual (Arg0, 0x04)) {}
        If (LEqual (Arg0, 0x05))
        {
            PHSR (0x3B, 0xE3)
            PHSR (0x2A, 0x00)
        }

        If (LEqual (Arg0, 0x03))
        {
            PHSR (0x3B, 0xE1)
        }

        If (LEqual (Arg0, 0x04))
        {
            PHSR (0x3B, 0xE2)
        }

        If (LGreater (Arg0, 0x01))
        {
            Store (Zero, LDTC)
            Store (0x04, Z000)
            Store (0x04, Z001)
            Store (0x04, Z002)
        }
    }

    Method (\_WAK, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        Store (Arg0, \_SB.PCI0.EC0.SYSO)
        Store (0x00, \_SB.PCI0.EC0.MUTE)
        Store (0x00, \_SB.PCI0.EC0.KTAF)
        Store (0x01, \_SB.PCI0.EC0.KTEE)
        Notify (\_SB.PCI0.EC0.BAT0, 0x81)
        If (LEqual (Arg0, 0x03))
        {
            PHSR (0x3B, 0xE7)
            \_SB.PCI0.EC0.MCEB.NOTI ()
        }

        If (LEqual (Arg0, 0x04))
        {
            PHSR (0x3B, 0xE8)
            PHSR (0x3A, 0x00)
            \_SB.PCI0.EC0.MCEB.NOTI ()
        }

        PHSR (0x3D, 0x00)
        Notify (\_SB.PCI0, 0x00)
        Return (Package (0x02)
        {
            0x00, 
            0x00
        })
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00001010, 0x06) {}
        Processor (CPU1, 0x01, 0x00001010, 0x06) {}
    }

    Scope (\_SI)
    {
        Method (_SST, 1, NotSerialized)
        {
            Store ("==== SST Working ====", Debug)
        }

        Method (_MSG, 1, NotSerialized)
        {
        }
    }

    Scope (\_GPE)
    {
        Method (_L00, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P2P0, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MAC0, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB0, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L10, 0, NotSerialized)
        {
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L14, 0, NotSerialized)
        {
            Sleep (0x96)
            Notify (\_SB.PCI0.XVR1, 0x00)
        }
    }

    Scope (\_SB)
    {
        Method (_INI, 0, NotSerialized)
        {
            Store (0x07D0, OSYS)
            If (CondRefOf (\_OSI, Local0))
            {
                If (\_OSI ("Linux"))
                {
                    Store (0x01, LINX)
                }

                If (\_OSI ("Windows 2001"))
                {
                    Store (0x07D1, OSYS)
                }

                If (\_OSI ("Windows 2001 SP1"))
                {
                    Store (0x07D1, OSYS)
                }

                If (\_OSI ("Windows 2001 SP2"))
                {
                    Store (0x07D2, OSYS)
                }

                If (\_OSI ("Windows 2006"))
                {
                    Store (0x07D6, OSYS)
                }
            }
        }

        Device (AMW0)
        {
            Name (_HID, "*pnp0c14")
            Name (_UID, 0x00)
            Name (WLMP, 0x00)
            Name (WMID, 0x00)
            Name (B0ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (B0ED, 0x00, WLID)
            Name (B1ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            Name (_WDG, Buffer (0x64)
            {
                /* 0000 */    0x81, 0x17, 0xF4, 0xD9, 0x33, 0xF6, 0x00, 0x44, 
                /* 0008 */    0x93, 0x55, 0x60, 0x17, 0x70, 0xBE, 0xC5, 0x10, 
                /* 0010 */    0x41, 0x41, 0x01, 0x00, 0x1D, 0x37, 0xC3, 0x67, 
                /* 0018 */    0xA3, 0x95, 0x37, 0x4C, 0xBB, 0x61, 0xDD, 0x47, 
                /* 0020 */    0xB4, 0x91, 0xDA, 0xAB, 0x41, 0x42, 0x01, 0x02, 
                /* 0028 */    0xED, 0x16, 0x1F, 0x43, 0x2B, 0x0C, 0x4C, 0x44, 
                /* 0030 */    0xB2, 0x67, 0x27, 0xDE, 0xB1, 0x40, 0xCF, 0x9C, 
                /* 0038 */    0x41, 0x43, 0x01, 0x02, 0x71, 0xBF, 0xD1, 0x40, 
                /* 0040 */    0x2D, 0xA8, 0x59, 0x4E, 0xA1, 0x68, 0x39, 0x85, 
                /* 0048 */    0xE0, 0x3B, 0x2E, 0x87, 0xB0, 0x00, 0x01, 0x08, 
                /* 0050 */    0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11, 
                /* 0058 */    0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 
                /* 0060 */    0x44, 0x44, 0x01, 0x00
            })
            Method (_WED, 1, NotSerialized)
            {
                Store (Arg0, P80H)
                If (LEqual (Arg0, 0xB0))
                {
                    Return (B0ED)
                }
            }

            Method (WQAA, 1, NotSerialized)
            {
                Store (0xAA, P80H)
                Return (B1ED)
            }

            Method (WSAA, 2, NotSerialized)
            {
                Store (0xA1, P80H)
                CreateDWordField (Arg1, 0x00, DDD0)
                If (LEqual (DDD0, 0x01))
                {
                    Add (DDD0, 0x02, DDD0)
                    Store (DDD0, Index (B1ED, 0x00))
                }
            }

            Method (WMAB, 3, NotSerialized)
            {
                Store (0xAB, P80H)
                Store (0x01, WLMP)
                Store (0x00, WMID)
                Return (WH15 (Arg1, Arg2))
            }

            Method (WMAC, 3, NotSerialized)
            {
                Store (0xAC, P80H)
                Store (0x01, WLMP)
                Store (0x01, WMID)
                Return (WH15 (Arg1, Arg2))
            }

            Name (WQDD, Buffer (0x0560)
            {
                /* 0000 */    0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00, 
                /* 0008 */    0x50, 0x05, 0x00, 0x00, 0x70, 0x1D, 0x00, 0x00, 
                /* 0010 */    0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54, 
                /* 0018 */    0x18, 0xCB, 0x8D, 0x00, 0x01, 0x06, 0x18, 0x42, 
                /* 0020 */    0x10, 0x09, 0x10, 0x8A, 0xE7, 0x80, 0x42, 0x04, 
                /* 0028 */    0x0A, 0x0D, 0xA1, 0x40, 0x30, 0x28, 0x38, 0x4B, 
                /* 0030 */    0x82, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x08, 0x84, 
                /* 0038 */    0x24, 0x0A, 0x30, 0x2F, 0x40, 0xB7, 0x00, 0xC3, 
                /* 0040 */    0x02, 0x6C, 0x0B, 0x30, 0x2D, 0xC0, 0x31, 0x90, 
                /* 0048 */    0xFA, 0xF7, 0x87, 0x28, 0x0D, 0x44, 0x22, 0x20, 
                /* 0050 */    0xA9, 0x14, 0x08, 0x09, 0x15, 0xA0, 0x5C, 0x80, 
                /* 0058 */    0x6F, 0x01, 0xDA, 0x11, 0x25, 0x59, 0x80, 0x65, 
                /* 0060 */    0x18, 0x11, 0xD8, 0x2B, 0x32, 0x41, 0xE3, 0x04, 
                /* 0068 */    0xE5, 0x0C, 0x03, 0x05, 0x6F, 0xC0, 0x36, 0x05, 
                /* 0070 */    0x98, 0x1C, 0x04, 0x95, 0x3D, 0x08, 0x94, 0x0C, 
                /* 0078 */    0x08, 0x79, 0x14, 0x60, 0x15, 0x4E, 0xD3, 0x49, 
                /* 0080 */    0x60, 0xF7, 0x73, 0x91, 0x30, 0x18, 0x19, 0x13, 
                /* 0088 */    0xA0, 0x50, 0x80, 0x46, 0x01, 0xDE, 0x40, 0x64, 
                /* 0090 */    0x4B, 0x80, 0x41, 0x01, 0xE2, 0x04, 0x28, 0x83, 
                /* 0098 */    0x12, 0x4A, 0xB8, 0x83, 0x69, 0x4D, 0x80, 0x39, 
                /* 00A0 */    0x28, 0x82, 0x56, 0x1B, 0x98, 0x50, 0x3A, 0x03, 
                /* 00A8 */    0x12, 0x48, 0xAC, 0x16, 0xC1, 0x05, 0x13, 0x3B, 
                /* 00B0 */    0x6A, 0x94, 0x40, 0xD1, 0xDB, 0x1F, 0x04, 0x09, 
                /* 00B8 */    0xA7, 0x00, 0xA2, 0x06, 0x10, 0x45, 0x1A, 0x0D, 
                /* 00C0 */    0x6A, 0x44, 0x09, 0x0E, 0xCC, 0xA3, 0x39, 0xD5, 
                /* 00C8 */    0xCE, 0x05, 0x48, 0x9F, 0xAB, 0x40, 0x8E, 0xF5, 
                /* 00D0 */    0x34, 0xEA, 0x1C, 0x2E, 0x01, 0x49, 0x60, 0xAC, 
                /* 00D8 */    0x04, 0xB7, 0xEE, 0x21, 0xE2, 0x5D, 0x03, 0x6A, 
                /* 00E0 */    0xE2, 0x87, 0xC8, 0x04, 0xC1, 0xA1, 0x86, 0xE8, 
                /* 00E8 */    0xF1, 0x86, 0x3B, 0x81, 0xA3, 0x3E, 0x12, 0x06, 
                /* 00F0 */    0x71, 0x50, 0x47, 0x83, 0x39, 0x07, 0xD8, 0xE1, 
                /* 00F8 */    0x64, 0x34, 0xE3, 0x52, 0x05, 0x98, 0x1D, 0xBA, 
                /* 0100 */    0x46, 0x96, 0xE0, 0x78, 0x0C, 0x7D, 0xF6, 0xE7, 
                /* 0108 */    0xD3, 0x33, 0x24, 0x91, 0x3F, 0x08, 0xD4, 0xC8, 
                /* 0110 */    0x0C, 0xED, 0xA1, 0x9E, 0x56, 0xCC, 0x90, 0x4F, 
                /* 0118 */    0x01, 0x87, 0xC5, 0xC4, 0x42, 0x68, 0x93, 0x1A, 
                /* 0120 */    0x0F, 0xC4, 0xFF, 0xFF, 0x78, 0xC0, 0xA3, 0xF8, 
                /* 0128 */    0x68, 0x20, 0x84, 0x57, 0x82, 0xD8, 0x1E, 0x50, 
                /* 0130 */    0x82, 0x01, 0x21, 0xE4, 0x64, 0x3C, 0xA8, 0x51, 
                /* 0138 */    0x18, 0x35, 0xDC, 0x61, 0x1C, 0xB5, 0x8F, 0x0F, 
                /* 0140 */    0x3A, 0x3C, 0x50, 0x51, 0xC3, 0xA6, 0x67, 0x06, 
                /* 0148 */    0x7E, 0x5C, 0x60, 0xE7, 0x82, 0x98, 0x8F, 0x00, 
                /* 0150 */    0x1E, 0xC9, 0x09, 0xF9, 0x38, 0xE1, 0x81, 0xC1, 
                /* 0158 */    0x07, 0xC4, 0x7B, 0x9F, 0x32, 0x19, 0xC1, 0x99, 
                /* 0160 */    0x7A, 0x80, 0xE0, 0xB0, 0x3E, 0x7C, 0x02, 0xFC, 
                /* 0168 */    0xB2, 0xF0, 0xB0, 0x90, 0xC0, 0xF7, 0x07, 0x03, 
                /* 0170 */    0xE3, 0x46, 0x68, 0xBF, 0x02, 0x10, 0x82, 0x97, 
                /* 0178 */    0x79, 0x02, 0x90, 0x53, 0x04, 0x8D, 0xCD, 0xD0, 
                /* 0180 */    0x4F, 0x03, 0x2F, 0x0E, 0xE1, 0x83, 0x47, 0x38, 
                /* 0188 */    0xDF, 0x03, 0x38, 0x85, 0xC7, 0x00, 0x0F, 0xC1, 
                /* 0190 */    0x04, 0x16, 0x39, 0x02, 0x94, 0x98, 0x11, 0xA0, 
                /* 0198 */    0x8E, 0x0D, 0x27, 0x70, 0x3C, 0x61, 0x8F, 0xE0, 
                /* 01A0 */    0x78, 0xA2, 0x9C, 0xC4, 0x01, 0xF9, 0xA8, 0x61, 
                /* 01A8 */    0x84, 0xE0, 0xE5, 0x9E, 0x38, 0x88, 0xE6, 0x71, 
                /* 01B0 */    0x6A, 0x16, 0xEF, 0x00, 0x87, 0xC0, 0xC6, 0x84, 
                /* 01B8 */    0x3B, 0x40, 0x78, 0x08, 0x7C, 0x00, 0x8F, 0x1A, 
                /* 01C0 */    0xE7, 0x67, 0xA5, 0xB3, 0x42, 0x9E, 0x3B, 0xF8, 
                /* 01C8 */    0x98, 0xB0, 0x03, 0xE0, 0xD2, 0x0F, 0x27, 0x28, 
                /* 01D0 */    0xB1, 0xE7, 0x13, 0x50, 0xFC, 0xFF, 0xCF, 0x27, 
                /* 01D8 */    0xC0, 0x1E, 0xE4, 0x99, 0xE4, 0xED, 0xE4, 0x68, 
                /* 01E0 */    0x9E, 0x4B, 0x1E, 0x48, 0x9E, 0x48, 0x9E, 0x4F, 
                /* 01E8 */    0x8C, 0xF3, 0x66, 0xF2, 0x64, 0x10, 0xE1, 0xF9, 
                /* 01F0 */    0xC4, 0xD7, 0x14, 0x23, 0x44, 0x09, 0x19, 0xE8, 
                /* 01F8 */    0xE1, 0x24, 0x42, 0x94, 0x70, 0x81, 0xC2, 0x1A, 
                /* 0200 */    0x21, 0xC8, 0x63, 0xC1, 0x09, 0x1F, 0x76, 0xAC, 
                /* 0208 */    0x40, 0x61, 0x9E, 0x4F, 0x98, 0xF0, 0xA7, 0x86, 
                /* 0210 */    0x2C, 0x9C, 0x4F, 0x00, 0xBA, 0xFC, 0xFF, 0xCF, 
                /* 0218 */    0x27, 0x80, 0x33, 0x81, 0xE7, 0x13, 0x90, 0x0E, 
                /* 0220 */    0x8F, 0x1F, 0x4F, 0x80, 0xC9, 0x08, 0xB8, 0x16, 
                /* 0228 */    0x13, 0x87, 0x2F, 0xD4, 0xE3, 0xC0, 0xA7, 0x11, 
                /* 0230 */    0x40, 0xCE, 0x09, 0xE4, 0xFD, 0xE3, 0x38, 0x9F, 
                /* 0238 */    0x44, 0x7C, 0xF7, 0xF2, 0xFF, 0xFF, 0xE6, 0xE5, 
                /* 0240 */    0x83, 0xC8, 0x1B, 0xC8, 0xC1, 0x3E, 0x8D, 0xB0, 
                /* 0248 */    0x51, 0x05, 0x33, 0xCA, 0xE9, 0x47, 0x88, 0xFA, 
                /* 0250 */    0x52, 0x62, 0xC4, 0x08, 0xC1, 0x42, 0x05, 0x8A, 
                /* 0258 */    0x11, 0x35, 0xB2, 0x61, 0x23, 0xC4, 0x79, 0xF8, 
                /* 0260 */    0xA2, 0x0F, 0x06, 0x0D, 0xD5, 0xA7, 0x11, 0x80, 
                /* 0268 */    0x1F, 0xA7, 0x09, 0xDC, 0xE9, 0x02, 0x4C, 0x93, 
                /* 0270 */    0x38, 0x80, 0x28, 0x45, 0xC3, 0x68, 0x3A, 0x8F, 
                /* 0278 */    0x03, 0x01, 0x9F, 0x2F, 0x80, 0x89, 0xE2, 0x97, 
                /* 0280 */    0x9E, 0xCE, 0x27, 0xFE, 0xFF, 0xAB, 0x05, 0x91, 
                /* 0288 */    0x8D, 0xB5, 0x7A, 0x58, 0x34, 0xF3, 0x03, 0x48, 
                /* 0290 */    0xF0, 0xC5, 0x03, 0x6B, 0xD8, 0x27, 0x79, 0x16, 
                /* 0298 */    0x27, 0x99, 0x60, 0x56, 0x28, 0xC1, 0x7A, 0xD8, 
                /* 02A0 */    0x4E, 0x09, 0xA3, 0x04, 0x24, 0x1A, 0x8E, 0xA1, 
                /* 02A8 */    0xAD, 0x19, 0x46, 0x70, 0x06, 0xF1, 0x79, 0xC8, 
                /* 02B0 */    0x21, 0xCE, 0x31, 0x50, 0x8E, 0x0C, 0x1E, 0xC5, 
                /* 02B8 */    0x59, 0x3D, 0x07, 0x78, 0x8C, 0x8F, 0x0B, 0x6C, 
                /* 02C0 */    0x7C, 0x3E, 0x08, 0xF0, 0xC3, 0xA0, 0x6F, 0x06, 
                /* 02C8 */    0x46, 0xB6, 0x9A, 0xD3, 0x0C, 0x0A, 0xCC, 0xC7, 
                /* 02D0 */    0x0B, 0x4E, 0x50, 0xD7, 0xCD, 0x05, 0x64, 0x43, 
                /* 02D8 */    0x82, 0x79, 0x10, 0x38, 0x24, 0x30, 0x4F, 0xD5, 
                /* 02E0 */    0x43, 0x02, 0x1E, 0xE0, 0x87, 0x04, 0xE6, 0x2B, 
                /* 02E8 */    0x81, 0x87, 0x04, 0x2C, 0xFE, 0xFF, 0xA8, 0x07, 
                /* 02F0 */    0x71, 0x48, 0x60, 0x46, 0xF2, 0x90, 0xC0, 0xA6, 
                /* 02F8 */    0xEF, 0xC8, 0x01, 0x0A, 0x20, 0xDF, 0x30, 0x7C, 
                /* 0300 */    0xDC, 0x7B, 0xCA, 0x60, 0x63, 0x78, 0xE2, 0x33, 
                /* 0308 */    0x9A, 0xD1, 0xB9, 0xC4, 0xE5, 0xE8, 0x42, 0xC1, 
                /* 0310 */    0x45, 0xC1, 0xE8, 0x58, 0x60, 0x10, 0x4F, 0xCB, 
                /* 0318 */    0x51, 0xA6, 0x8A, 0x9E, 0x89, 0x7D, 0x9E, 0x42, 
                /* 0320 */    0xC8, 0x89, 0x82, 0x5F, 0xDD, 0x74, 0x9F, 0x81, 
                /* 0328 */    0x76, 0xF7, 0x08, 0xEA, 0x8B, 0x0A, 0x83, 0xF3, 
                /* 0330 */    0x64, 0x39, 0x9C, 0xAF, 0x14, 0xFC, 0xAE, 0xE3, 
                /* 0338 */    0xCB, 0x15, 0xF8, 0x46, 0x05, 0xF7, 0x50, 0xC1, 
                /* 0340 */    0x46, 0x05, 0xF6, 0xEB, 0x88, 0x47, 0x05, 0xD6, 
                /* 0348 */    0xFF, 0xFF, 0xA8, 0x60, 0x9D, 0x2B, 0xD8, 0xA8, 
                /* 0350 */    0xC0, 0x7E, 0x26, 0xF0, 0xA8, 0x80, 0xCB, 0xD1, 
                /* 0358 */    0x82, 0x8D, 0x0A, 0xEC, 0x1E, 0x46, 0x05, 0xCA, 
                /* 0360 */    0x20, 0xD7, 0x0F, 0x28, 0xD0, 0x8F, 0x96, 0xAF, 
                /* 0368 */    0x40, 0x0F, 0x41, 0x8F, 0x51, 0x1E, 0x14, 0xB8, 
                /* 0370 */    0x61, 0x7C, 0xDF, 0x03, 0x4E, 0x17, 0x10, 0x98, 
                /* 0378 */    0xF0, 0x18, 0xC1, 0x47, 0x18, 0xF2, 0xFF, 0x27, 
                /* 0380 */    0x28, 0x6B, 0x5C, 0xA8, 0xFB, 0x8A, 0xAF, 0x72, 
                /* 0388 */    0xEC, 0x3A, 0x85, 0xBB, 0x2A, 0x62, 0x60, 0x3D, 
                /* 0390 */    0x52, 0x0E, 0x6B, 0xB4, 0xB0, 0x07, 0xFC, 0xA6, 
                /* 0398 */    0xE5, 0x63, 0x9A, 0x67, 0x66, 0x8C, 0xB0, 0x1E, 
                /* 03A0 */    0xAD, 0x95, 0x92, 0xD2, 0x2B, 0x9F, 0x23, 0xDD, 
                /* 03A8 */    0xFA, 0x00, 0x41, 0x73, 0x79, 0x10, 0x78, 0xCE, 
                /* 03B0 */    0x7B, 0x4B, 0x78, 0x73, 0xF7, 0x59, 0xC2, 0xC7, 
                /* 03B8 */    0xBD, 0xC7, 0x82, 0x97, 0x80, 0x97, 0x81, 0xF7, 
                /* 03C0 */    0x92, 0x57, 0x5A, 0x76, 0xED, 0xF3, 0xAD, 0xCF, 
                /* 03C8 */    0x48, 0x0F, 0x80, 0x46, 0x09, 0x12, 0x23, 0xE6, 
                /* 03D0 */    0xFB, 0x89, 0x91, 0x1F, 0x6D, 0x7D, 0x69, 0xF0, 
                /* 03D8 */    0xBD, 0x2F, 0xC6, 0x5B, 0x1F, 0x8B, 0x77, 0xEB, 
                /* 03E0 */    0x03, 0x44, 0xFD, 0xFF, 0x6F, 0x7D, 0xC0, 0xFE, 
                /* 03E8 */    0x72, 0xF1, 0xD6, 0x07, 0x1C, 0x30, 0x23, 0xBE, 
                /* 03F0 */    0xF6, 0x01, 0x93, 0x34, 0x2B, 0xD0, 0x59, 0xC3, 
                /* 03F8 */    0x49, 0x40, 0x74, 0xED, 0xC3, 0xE9, 0x01, 0xD2, 
                /* 0400 */    0xB5, 0x0F, 0xAF, 0x03, 0x96, 0x8E, 0xDB, 0x0A, 
                /* 0408 */    0x60, 0x94, 0xE4, 0x58, 0x85, 0xD2, 0x7E, 0xAC, 
                /* 0410 */    0xA2, 0x20, 0x3E, 0xCE, 0xF8, 0xDA, 0x07, 0x58, 
                /* 0418 */    0xF9, 0xFF, 0x5F, 0xFB, 0x00, 0x26, 0x0E, 0x09, 
                /* 0420 */    0xE6, 0xF5, 0xE2, 0x09, 0xC7, 0x43, 0x02, 0xEB, 
                /* 0428 */    0x8D, 0xC6, 0x43, 0x82, 0xFB, 0xFF, 0x1F, 0x34, 
                /* 0430 */    0xD8, 0x86, 0x04, 0xE6, 0x8B, 0x9D, 0xAF, 0x8E, 
                /* 0438 */    0xC0, 0x59, 0xF6, 0x82, 0x75, 0x29, 0xE1, 0x42, 
                /* 0440 */    0x61, 0x74, 0xB4, 0x30, 0x88, 0x01, 0x7D, 0x75, 
                /* 0448 */    0x04, 0x7E, 0x17, 0x3E, 0xE0, 0x73, 0x75, 0x04, 
                /* 0450 */    0x0E, 0x17, 0x3E, 0xFC, 0xFF, 0xFF, 0xEA, 0x08, 
                /* 0458 */    0x38, 0xB8, 0xF1, 0x81, 0xF3, 0xEA, 0x08, 0xFC, 
                /* 0460 */    0x4C, 0x5C, 0x1D, 0x01, 0x1D, 0x2A, 0x46, 0x0E, 
                /* 0468 */    0x74, 0x4E, 0x31, 0x8C, 0xE0, 0xFF, 0x7F, 0x54, 
                /* 0470 */    0xE0, 0x06, 0xF6, 0xF1, 0x00, 0xD8, 0x8C, 0x0A, 
                /* 0478 */    0x18, 0x9C, 0x06, 0x7C, 0x09, 0x05, 0xBC, 0x2A, 
                /* 0480 */    0xB4, 0xE9, 0x53, 0xA3, 0x51, 0xAB, 0x06, 0x65, 
                /* 0488 */    0x6A, 0x94, 0x69, 0x50, 0xAB, 0x4F, 0xA5, 0xC6, 
                /* 0490 */    0x8C, 0x5D, 0x29, 0x13, 0x8C, 0xB1, 0x02, 0x8D, 
                /* 0498 */    0xC5, 0x22, 0x96, 0x23, 0x10, 0x87, 0x04, 0xA1, 
                /* 04A0 */    0x22, 0x1F, 0x43, 0x02, 0x71, 0x44, 0x10, 0x1A, 
                /* 04A8 */    0xE1, 0x4D, 0x23, 0x10, 0xC7, 0x5B, 0x9B, 0x40, 
                /* 04B0 */    0x2C, 0xEE, 0xA1, 0x21, 0x10, 0xFF, 0xFF, 0x83, 
                /* 04B8 */    0x3C, 0x23, 0x64, 0x04, 0x44, 0xA9, 0x40, 0x74, 
                /* 04C0 */    0x4B, 0x22, 0x6B, 0x12, 0x90, 0x95, 0x81, 0x08, 
                /* 04C8 */    0xC8, 0x81, 0x80, 0x68, 0x3A, 0x20, 0x2A, 0xEA, 
                /* 04D0 */    0x21, 0x20, 0x20, 0x2B, 0x04, 0x11, 0x90, 0xD5, 
                /* 04D8 */    0xD8, 0x00, 0x62, 0xDA, 0x40, 0x04, 0xE4, 0x5C, 
                /* 04E0 */    0x40, 0x34, 0x25, 0x10, 0x55, 0xA8, 0x03, 0x88, 
                /* 04E8 */    0xE9, 0x05, 0x11, 0x90, 0xB3, 0x02, 0xD1, 0xE4, 
                /* 04F0 */    0x40, 0x54, 0xB3, 0x0F, 0x20, 0x96, 0x00, 0x44, 
                /* 04F8 */    0x40, 0x4E, 0x4A, 0x23, 0x10, 0xEB, 0x54, 0x02, 
                /* 0500 */    0xC2, 0x52, 0xBD, 0x1D, 0x04, 0xE8, 0x88, 0x20, 
                /* 0508 */    0x02, 0xB2, 0xB2, 0x2F, 0xAB, 0x80, 0x2C, 0x13, 
                /* 0510 */    0x44, 0x40, 0x4E, 0x07, 0x44, 0xA3, 0x02, 0x51, 
                /* 0518 */    0x85, 0x56, 0x80, 0x98, 0x5C, 0x10, 0x01, 0x39, 
                /* 0520 */    0x25, 0x10, 0x8D, 0x0C, 0x44, 0x95, 0x6A, 0x01, 
                /* 0528 */    0x62, 0xB2, 0x41, 0x04, 0x64, 0x89, 0x5E, 0x80, 
                /* 0530 */    0x98, 0x60, 0x10, 0x01, 0x39, 0x2C, 0x10, 0x8D, 
                /* 0538 */    0x0E, 0x44, 0x65, 0xBF, 0x0A, 0x04, 0xE4, 0x10, 
                /* 0540 */    0x20, 0x3A, 0x25, 0x10, 0x33, 0x40, 0x4C, 0x0E, 
                /* 0548 */    0x88, 0x0E, 0x00, 0x04, 0x88, 0xC6, 0x02, 0xA2, 
                /* 0550 */    0x92, 0xFE, 0x5B, 0x02, 0xB2, 0x40, 0x10, 0x01, 
                /* 0558 */    0x39, 0x1C, 0x10, 0x8D, 0x0A, 0x44, 0xFF, 0xFF
            })
        }

        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.EC0.KLID, Local0)
                }
                Else
                {
                    And (\RBEC (0x70), 0x02, Local0)
                }

                If (Local0)
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_PSW, 1, NotSerialized)
            {
                If (\ECON)
                {
                    Store (Arg0, \_SB.PCI0.EC0.LIDW)
                }
                Else
                {
                    If (Arg0)
                    {
                        \MBEC (0x72, 0xEF, 0x10)
                    }
                    Else
                    {
                        \MBEC (0x72, 0xEF, 0x00)
                    }
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x10, 
                0x03
            })
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            Name (_PRW, Package (0x02)
            {
                0x10, 
                0x03
            })
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (PCI0)
        {
            Method (_INI, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPC0.PSTA, PPCM)
            }

            Name (_ADR, 0x00)
            Name (_HID, EisaId ("PNP0A03"))
            Name (_UID, 0x01)
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Scope (\_SB)
            {
                OperationRegion (ASLD, SystemMemory, 0x77F18EBC, 0x00000100)
                Field (ASLD, AnyAcc, NoLock, Preserve)
                {
                    TOM,    32, 
                    R_ST,   1, 
                        ,   3, 
                    R_P0,   4, 
                    R_S0,   4, 
                    R_S1,   4, 
                    RSS0,   4, 
                    RSS1,   4
                }
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (CBUF, ResourceTemplate ()
                {
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x00FF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0100,             // Length
                        ,, )
                    IO (Decode16,
                        0x0CF8,             // Range Minimum
                        0x0CF8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0CF7,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0CF8,             // Length
                        ,, , TypeStatic)
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0D00,             // Range Minimum
                        0xFFFF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0xF300,             // Length
                        ,, , TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000A0000,         // Range Minimum
                        0x000BFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00020000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000C0000,         // Range Minimum
                        0x000C3FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000C4000,         // Range Minimum
                        0x000C7FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000C8000,         // Range Minimum
                        0x000CBFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000CC000,         // Range Minimum
                        0x000CFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000D0000,         // Range Minimum
                        0x000D3FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000D4000,         // Range Minimum
                        0x000D7FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000D8000,         // Range Minimum
                        0x000DBFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000DC000,         // Range Minimum
                        0x000DFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000E0000,         // Range Minimum
                        0x000E3FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000E4000,         // Range Minimum
                        0x000E7FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000E8000,         // Range Minimum
                        0x000EBFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000EC000,         // Range Minimum
                        0x000EFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000F0000,         // Range Minimum
                        0x000FFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00010000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x00100000,         // Range Minimum
                        0xFEBFFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0xFFF00000,         // Length
                        ,, _Y00, AddressRangeMemory, TypeStatic)
                })
                CreateDWordField (CBUF, \_SB.PCI0._CRS._Y00._MIN, PMMN)
                CreateDWordField (CBUF, \_SB.PCI0._CRS._Y00._LEN, PMLN)
                Multiply (\_SB.TOM, 0x00100000, PMMN)
                Subtract (0xFEC00000, PMMN, PMLN)
                Return (CBUF)
            }

            Name (_PRT, Package (0x0E)
            {
                Package (0x04)
                {
                    0x000AFFFF, 
                    0x00, 
                    \_SB.PCI0.LSMB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x01, 
                    \_SB.PCI0.LSMU, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x00, 
                    \_SB.PCI0.LUS0, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x01, 
                    \_SB.PCI0.LUS2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x00, 
                    \_SB.PCI0.LMAC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x01, 
                    \_SB.PCI0.LAZA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x02, 
                    \_SB.PCI0.LACI, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x03, 
                    \_SB.PCI0.LMCI, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    0x00, 
                    \_SB.PCI0.LPID, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    0x00, 
                    \_SB.PCI0.LTID, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x00, 
                    \_SB.PCI0.LK3E, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x01, 
                    \_SB.PCI0.LK4E, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x02, 
                    \_SB.PCI0.LK1E, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x03, 
                    \_SB.PCI0.LK2E, 
                    0x00
                }
            })
            Device (VGA)
            {
                Name (_ADR, 0x00050000)
                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x03), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Return (Package (0x03)
                    {
                        0x00010100, 
                        0x00010200, 
                        0x00010118
                    })
                }

                Device (CRT)
                {
                    Name (_ADR, 0x0100)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x25, 0x00)
                        If (And (CSTE, 0x0101))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0101))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (LCD)
                {
                    Name (_ADR, 0x0118)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x25, 0x00)
                        If (And (CSTE, 0x0808))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0808))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }

                    Name (BCLP, Package (0x12)
                    {
                        0x64, 
                        0x3C, 
                        0x19, 
                        0x1E, 
                        0x23, 
                        0x28, 
                        0x2D, 
                        0x32, 
                        0x37, 
                        0x3C, 
                        0x41, 
                        0x46, 
                        0x4B, 
                        0x50, 
                        0x55, 
                        0x5A, 
                        0x5F, 
                        0x64
                    })
                    Method (_BCL, 0, NotSerialized)
                    {
                        Return (BCLP)
                    }

                    Method (_BCM, 1, NotSerialized)
                    {
                        Store (0x01, Local0)
                        Store (0x02, Local1)
                        While (Local0)
                        {
                            If (LEqual (Arg0, DerefOf (Index (BCLP, Local1))))
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Increment (Local1)
                                If (LEqual (0x11, Local1))
                                {
                                    Store (0x00, Local0)
                                }
                            }
                        }

                        Decrement (Local1)
                        Decrement (Local1)
                        If (\_SB.PCI0.EC0.BNCM)
                        {
                            If (\_SB.PCI0.EC0.ACST)
                            {
                                Store (Local1, \_SB.PCI0.EC0.BNAC)
                            }
                            Else
                            {
                                Store (Local1, \_SB.PCI0.EC0.BNDC)
                            }
                        }
                        Else
                        {
                            Store (Local1, \_SB.PCI0.EC0.BNAC)
                        }

                        If (\_SB.PCI0.EC0.BNVE)
                        {
                            HKEY (0x1C)
                        }
                    }

                    Method (_BQC, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.EC0.BNCM)
                        {
                            If (\_SB.PCI0.EC0.ACST)
                            {
                                Store (\_SB.PCI0.EC0.BNAC, Local1)
                            }
                            Else
                            {
                                Store (\_SB.PCI0.EC0.BNDC, Local1)
                            }
                        }
                        Else
                        {
                            Store (\_SB.PCI0.EC0.BNAC, Local1)
                        }

                        Increment (Local1)
                        Increment (Local1)
                        Store (DerefOf (Index (BCLP, Local1)), Local0)
                        Return (Local0)
                    }

                    Method (_DDC, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Return (\_SB.PCI0.VGA.DDC4)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Concatenate (\_SB.PCI0.VGA.DDC4, \_SB.PCI0.VGA.DDC0, Local0)
                            Return (Local0)
                        }

                        Return (0x00)
                    }
                }

                Device (TV0)
                {
                    Name (_ADR, 0x0200)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x25, 0x00)
                        If (And (CSTE, 0x0202))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0202))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }

                    Method (_DDC, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Return (\_SB.PCI0.VGA.DDC3)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Concatenate (\_SB.PCI0.VGA.DDC3, \_SB.PCI0.VGA.DDC0, Local0)
                            Return (Local0)
                        }

                        Return (0x00)
                    }
                }

                Name (DDC0, Buffer (0x80)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0038 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0048 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0050 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0058 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0060 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0068 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DDC3, Buffer (0x80)
                {
                    /* 0000 */    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                    /* 0008 */    0x41, 0xD0, 0xFE, 0x09, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x21, 0x08, 0x00, 0x00, 0x00, 
                    /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0038 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0048 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0050 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0058 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0060 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0068 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD3
                })
                Name (DDC4, Buffer (0x80)
                {
                    /* 0000 */    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                    /* 0008 */    0x36, 0x7F, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x02, 0x00, 0x01, 0x28, 0x1E, 0x00, 
                    /* 0018 */    0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x21, 0x08, 0x00, 0x00, 0x00, 
                    /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0038 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0048 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0050 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0058 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0060 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0068 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEC
                })
            }

            Device (LPC0)
            {
                Name (_ADR, 0x000A0000)
                OperationRegion (P44, PCI_Config, 0x44, 0x04)
                Field (P44, AnyAcc, NoLock, Preserve)
                {
                    MTSE,   32
                }

                Device (MBRD)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x1F)
                    Name (RSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0xE0000000,         // Address Base
                            0x10000000,         // Address Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        Return (RSRC)
                    }
                }

                Device (PMIO)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x03)
                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (IODM, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x00,               // Alignment
                                0x00,               // Length
                                )
                        })
                        Name (IORT, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y01)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y02)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y03)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y04)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y05)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y06)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x40,               // Length
                                _Y07)
                        })
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y01._MIN, I1MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y01._MAX, I1MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y02._MIN, I2MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y02._MAX, I2MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y03._MIN, I3MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y03._MAX, I3MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y04._MIN, I4MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y04._MAX, I4MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y05._MIN, I5MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y05._MAX, I5MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y06._MIN, I6MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y06._MAX, I6MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y07._MIN, I9MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y07._MAX, I9MX)
                        And (\_SB.PCI0.SMB0.PMBR, 0xFFFC, I1MN)
                        Store (I1MN, I1MX)
                        Add (I1MN, 0x80, Local0)
                        Store (Local0, I2MN)
                        Store (Local0, I2MX)
                        And (\_SB.PCI0.SMB0.NVSB, 0xFFFC, I3MN)
                        Store (I3MN, I3MX)
                        Add (I3MN, 0x80, Local0)
                        Store (Local0, I4MN)
                        Store (Local0, I4MX)
                        And (\_SB.PCI0.SMB0.ANLG, 0xFFFC, I5MN)
                        Store (I5MN, I5MX)
                        Add (I5MN, 0x80, Local0)
                        Store (Local0, I6MN)
                        Store (Local0, I6MX)
                        And (\_SB.PCI0.SMB0.SB7C, 0xFFFC, I9MN)
                        Store (I9MN, I9MX)
                        If (I1MN)
                        {
                            Store (IORT, Local0)
                        }
                        Else
                        {
                            Store (IODM, Local0)
                        }

                        Return (Local0)
                    }
                }
            }

            Device (SYS0)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, 0x01)
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0010,             // Range Minimum
                        0x0010,             // Range Maximum
                        0x01,               // Alignment
                        0x10,               // Length
                        )
                    IO (Decode16,
                        0x0022,             // Range Minimum
                        0x0022,             // Range Maximum
                        0x01,               // Alignment
                        0x1E,               // Length
                        )
                    IO (Decode16,
                        0x0044,             // Range Minimum
                        0x0044,             // Range Maximum
                        0x01,               // Alignment
                        0x1C,               // Length
                        )
                    IO (Decode16,
                        0x0063,             // Range Minimum
                        0x0063,             // Range Maximum
                        0x01,               // Alignment
                        0x01,               // Length
                        )
                    IO (Decode16,
                        0x0065,             // Range Minimum
                        0x0065,             // Range Maximum
                        0x01,               // Alignment
                        0x01,               // Length
                        )
                    IO (Decode16,
                        0x0067,             // Range Minimum
                        0x0067,             // Range Maximum
                        0x01,               // Alignment
                        0x09,               // Length
                        )
                    IO (Decode16,
                        0x0072,             // Range Minimum
                        0x0072,             // Range Maximum
                        0x01,               // Alignment
                        0x02,               // Length
                        )
                    IO (Decode16,
                        0x0074,             // Range Minimum
                        0x0074,             // Range Maximum
                        0x01,               // Alignment
                        0x0C,               // Length
                        )
                    IO (Decode16,
                        0x0080,             // Range Minimum
                        0x0080,             // Range Maximum
                        0x00,               // Alignment
                        0x01,               // Length
                        )
                    IO (Decode16,
                        0x0091,             // Range Minimum
                        0x0091,             // Range Maximum
                        0x01,               // Alignment
                        0x03,               // Length
                        )
                    IO (Decode16,
                        0x0097,             // Range Minimum
                        0x0097,             // Range Maximum
                        0x01,               // Alignment
                        0x09,               // Length
                        )
                    IO (Decode16,
                        0x00A2,             // Range Minimum
                        0x00A2,             // Range Maximum
                        0x01,               // Alignment
                        0x1E,               // Length
                        )
                    IO (Decode16,
                        0x00E0,             // Range Minimum
                        0x00E0,             // Range Maximum
                        0x01,               // Alignment
                        0x10,               // Length
                        )
                    IO (Decode16,
                        0x0360,             // Range Minimum
                        0x0360,             // Range Maximum
                        0x01,               // Alignment
                        0x02,               // Length
                        )
                    IO (Decode16,
                        0x04D0,             // Range Minimum
                        0x04D0,             // Range Maximum
                        0x01,               // Alignment
                        0x02,               // Length
                        )
                })
            }

            Device (PIC0)
            {
                Name (_HID, EisaId ("PNP0000"))
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0020,             // Range Minimum
                        0x0020,             // Range Maximum
                        0x04,               // Alignment
                        0x02,               // Length
                        )
                    IO (Decode16,
                        0x00A0,             // Range Minimum
                        0x00A0,             // Range Maximum
                        0x04,               // Alignment
                        0x02,               // Length
                        )
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {2}
                })
            }

            Device (PIT0)
            {
                Name (_HID, EisaId ("PNP0100"))
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0040,             // Range Minimum
                        0x0040,             // Range Maximum
                        0x10,               // Alignment
                        0x04,               // Length
                        )
                })
                Name (BUF1, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0040,             // Range Minimum
                        0x0040,             // Range Maximum
                        0x10,               // Alignment
                        0x04,               // Length
                        )
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {0}
                })
                Method (_CRS, 0, Serialized)
                {
                    If (\_SB.PCI0.LPC0.MTSE)
                    {
                        Return (BUF0)
                    }

                    Return (BUF1)
                }
            }

            Device (DMA0)
            {
                Name (_HID, EisaId ("PNP0200"))
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x09,               // Length
                        )
                    IO (Decode16,
                        0x000A,             // Range Minimum
                        0x000A,             // Range Maximum
                        0x01,               // Alignment
                        0x06,               // Length
                        )
                    IO (Decode16,
                        0x0081,             // Range Minimum
                        0x0081,             // Range Maximum
                        0x01,               // Alignment
                        0x03,               // Length
                        )
                    IO (Decode16,
                        0x0087,             // Range Minimum
                        0x0087,             // Range Maximum
                        0x01,               // Alignment
                        0x01,               // Length
                        )
                    IO (Decode16,
                        0x0089,             // Range Minimum
                        0x0089,             // Range Maximum
                        0x01,               // Alignment
                        0x03,               // Length
                        )
                    IO (Decode16,
                        0x008F,             // Range Minimum
                        0x008F,             // Range Maximum
                        0x01,               // Alignment
                        0x01,               // Length
                        )
                    IO (Decode16,
                        0x00C0,             // Range Minimum
                        0x00C0,             // Range Maximum
                        0x01,               // Alignment
                        0x12,               // Length
                        )
                    IO (Decode16,
                        0x00D4,             // Range Minimum
                        0x00D4,             // Range Maximum
                        0x01,               // Alignment
                        0x0C,               // Length
                        )
                    DMA (Compatibility, BusMaster, Transfer8, )
                        {4}
                })
            }

            Device (SPK0)
            {
                Name (_HID, EisaId ("PNP0800"))
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0061,             // Range Minimum
                        0x0061,             // Range Maximum
                        0x01,               // Alignment
                        0x01,               // Length
                        )
                })
            }

            Device (RTC0)
            {
                Name (_HID, EisaId ("PNP0B00"))
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0070,             // Range Minimum
                        0x0070,             // Range Maximum
                        0x01,               // Alignment
                        0x02,               // Length
                        )
                })
                Name (BUF1, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0070,             // Range Minimum
                        0x0070,             // Range Maximum
                        0x01,               // Alignment
                        0x02,               // Length
                        )
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {8}
                })
                Method (_CRS, 0, Serialized)
                {
                    If (\_SB.PCI0.LPC0.MTSE)
                    {
                        Return (BUF0)
                    }

                    Return (BUF1)
                }
            }

            Device (MTH0)
            {
                Name (_HID, EisaId ("PNP0C04"))
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x00F0,             // Range Minimum
                        0x00F0,             // Range Maximum
                        0x01,               // Alignment
                        0x02,               // Length
                        )
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {13}
                })
            }

            Scope (\_SB.PCI0.LPC0)
            {
                OperationRegion (SMI0, SystemIO, 0x142E, 0x01)
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x77F18DBC, 0x00000090)
                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    BCMD,   8, 
                    DID,    32, 
                    INFO,   1024
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                            AccessAs (ByteAcc, 0x00), 
                            Offset (0x05), 
                    INF,    8, 
                    INF1,   8, 
                    INF2,   8, 
                    PSTA,   8
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                            AccessAs (ByteAcc, 0x00), 
                            Offset (0x05), 
                    WNVA,   32, 
                    WNVB,   32, 
                    WNVC,   32, 
                    WNVD,   32, 
                    WFLG,   32, 
                    WNVS,   32, 
                    WNVI,   32
                }
            }

            Device (MMTM)
            {
                Name (_HID, EisaId ("PNP0103"))
                Name (BUF0, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {0}
                    IRQNoFlags ()
                        {8}
                    Memory32Fixed (ReadOnly,
                        0xFED00000,         // Address Base
                        0x00000400,         // Address Length
                        _Y08)
                })
                Method (_STA, 0, NotSerialized)
                {
                    If (\_SB.PCI0.LPC0.MTSE)
                    {
                        Return (0x0F)
                    }

                    Return (0x00)
                }

                Method (_CRS, 0, Serialized)
                {
                    If (\_SB.PCI0.LPC0.MTSE)
                    {
                        CreateDWordField (BUF0, \_SB.PCI0.MMTM._Y08._BAS, TBAS)
                        CreateDWordField (BUF0, \_SB.PCI0.MMTM._Y08._LEN, TLEN)
                        Store (\_SB.PCI0.LPC0.MTSE, TBAS)
                        Store (0x0400, TLEN)
                    }

                    Return (BUF0)
                }
            }

            Device (KBD0)
            {
                Name (_HID, EisaId ("PNP0303"))
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0060,             // Range Minimum
                        0x0060,             // Range Maximum
                        0x01,               // Alignment
                        0x01,               // Length
                        )
                    IO (Decode16,
                        0x0064,             // Range Minimum
                        0x0064,             // Range Maximum
                        0x01,               // Alignment
                        0x01,               // Length
                        )
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {1}
                })
            }

            Device (PS2M)
            {
                Method (_HID, 0, NotSerialized)
                {
                    And (\RBEC (0x12), 0x07, Local0)
                    If (LEqual (Local0, 0x01))
                    {
                        Return (0x0C032E4F)
                    }

                    If (LEqual (Local0, 0x06))
                    {
                        Return (0x0B032E4F)
                    }

                    If (LEqual (Local0, 0x04))
                    {
                        Return (0x04032E4F)
                    }
                }

                Method (_CID, 0, NotSerialized)
                {
                    And (\RBEC (0x12), 0x07, Local0)
                    If (LEqual (Local0, 0x06))
                    {
                        Return (Package (0x03)
                        {
                            0x00032E4F, 
                            0x0B032E4F, 
                            0x130FD041
                        })
                    }
                    Else
                    {
                        Return (Package (0x03)
                        {
                            0x00032E4F, 
                            0x02002E4F, 
                            0x130FD041
                        })
                    }
                }

                Name (_CRS, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {12}
                })
            }

            Device (EC0)
            {
                Name (_HID, EisaId ("PNP0C09"))
                Name (_GPE, 0x01)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0062,             // Range Minimum
                        0x0062,             // Range Maximum
                        0x00,               // Alignment
                        0x01,               // Length
                        )
                    IO (Decode16,
                        0x0066,             // Range Minimum
                        0x0066,             // Range Maximum
                        0x00,               // Alignment
                        0x01,               // Length
                        )
                })
                OperationRegion (ECO1, SystemIO, 0x62, 0x01)
                Field (ECO1, ByteAcc, Lock, Preserve)
                {
                    PX62,   8
                }

                OperationRegion (ECO2, SystemIO, 0x66, 0x01)
                Field (ECO2, ByteAcc, Lock, Preserve)
                {
                    PX66,   8
                }

                OperationRegion (RAM, EmbeddedControl, 0x00, 0xFF)
                Field (RAM, ByteAcc, Lock, Preserve)
                {
                            Offset (0x0A), 
                        ,   1, 
                    BLNK,   1, 
                    WLLD,   2, 
                    BTLD,   2, 
                            Offset (0x15), 
                        ,   1, 
                    ITBN,   6, 
                            Offset (0x4C), 
                        ,   1, 
                    ITON,   6, 
                            Offset (0x50), 
                        ,   1, 
                            Offset (0x70), 
                        ,   1, 
                    KLID,   1, 
                        ,   3, 
                    KACS,   1, 
                            Offset (0x71), 
                    WLEN,   1, 
                    BTEN,   1, 
                    DCKS,   1, 
                    MUTE,   1, 
                    KBID,   3, 
                            Offset (0x72), 
                        ,   2, 
                    KEYW,   1, 
                    RTCW,   1, 
                    LIDW,   1, 
                    BL2W,   1, 
                    TPDW,   1, 
                            Offset (0x75), 
                    SWBL,   1, 
                    KLMA,   1, 
                            Offset (0x76), 
                    SYSC,   4, 
                    SYSO,   4
                }

                Field (RAM, ByteAcc, Lock, Preserve)
                {
                            Offset (0x7F), 
                    BNEN,   1, 
                    BNCM,   1, 
                    BNDM,   1, 
                    BNVE,   1, 
                            Offset (0x83), 
                    BNAC,   4, 
                    BNDC,   4
                }

                Field (RAM, ByteAcc, Lock, Preserve)
                {
                            Offset (0x01), 
                    TIID,   8, 
                            Offset (0x10), 
                        ,   1, 
                    KTEE,   1, 
                            Offset (0x11), 
                    KPPS,   1, 
                            Offset (0x91), 
                    TTID,   8, 
                    KCSS,   1, 
                    KCTT,   1, 
                    KDTT,   1, 
                    KOSD,   1, 
                    KVTP,   1, 
                            Offset (0xA8), 
                    THS0,   8, 
                    THS1,   8, 
                    THS2,   8, 
                    THS3,   8, 
                    THS4,   8, 
                    THS5,   8, 
                    THS6,   8, 
                    THS7,   8
                }

                Field (RAM, ByteAcc, Lock, Preserve)
                {
                            Offset (0x92), 
                    KTAF,   8
                }

                Field (RAM, ByteAcc, Lock, Preserve)
                {
                            Offset (0x92), 
                    THSL,   4
                }

                Field (RAM, ByteAcc, Lock, Preserve)
                {
                            Offset (0xD0), 
                    TSP0,   8, 
                    TSC0,   8, 
                    TSP1,   8, 
                    TSC1,   8, 
                    TSP2,   8, 
                    TSC2,   8, 
                    TSP3,   8, 
                    TSC3,   8, 
                    TSP4,   8, 
                    TSC4,   8, 
                    TSP5,   8, 
                    TSC5,   8, 
                    TSP6,   8, 
                    TSC6,   8, 
                    TSP7,   8, 
                    TSC7,   8
                }

                Method (_REG, 2, NotSerialized)
                {
                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Arg1, ECON)
                        TINI ()
                        Store (0x05, SYSO)
                        If (LEqual (OSYS, 0x07D6))
                        {
                            Store (0x00, BNEN)
                        }
                    }
                }

                Method (TINI, 0, NotSerialized)
                {
                    If (\ECON)
                    {
                        Store (0x00, KTAF)
                        Store (0x01, KTEE)
                    }
                    Else
                    {
                        WBEC (0x92, 0x00)
                        MBEC (0x10, 0xFD, 0x02)
                    }
                }

                Device (MCEB)
                {
                    Name (_HID, EisaId ("PNP0C32"))
                    Name (_UID, 0x02)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (OSYS, 0x07D6))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Method (GHID, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.EC0.ITON, 0x01))
                        {
                            If (LEqual (\_SB.PCI0.EC0.ITBN, 0x01))
                            {
                                Notify (\_SB.PCI0.EC0.MCEB, 0x02)
                            }
                        }

                        Return (Buffer (0x01)
                        {
                            0x02
                        })
                    }

                    Method (NOTI, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.EC0.ITON, 0x01))
                        {
                            If (LEqual (\_SB.PCI0.EC0.ITBN, 0x01))
                            {
                                Notify (\_SB.PCI0.EC0.MCEB, 0x02)
                            }
                        }
                    }

                    Method (Z003, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.EC0.ITBN, 0x01))
                        {
                            Notify (\_SB.PCI0.EC0.MCEB, 0x80)
                        }
                    }
                }

                Method (_Q16, 0, NotSerialized)
                {
                    Store (0x16, P80H)
                    LAMN (0x01)
                }

                Method (_Q24, 0, NotSerialized)
                {
                    Store (0x24, P80H)
                    LAMN (0x6A)
                }

                Method (_Q25, 0, NotSerialized)
                {
                    Store (0x25, P80H)
                    LAMN (0x6D)
                }

                Method (_Q17, 0, NotSerialized)
                {
                    Store (0x17, P80H)
                    Notify (\_SB.SLPB, 0x80)
                }

                Method (HKDS, 1, NotSerialized)
                {
                    If (LEqual (0x00, DSEN))
                    {
                        If (LEqual (Arg0, 0x10))
                        {
                            Store (PHSR (0x27, 0x00), Local0)
                            Increment (Local0)
                            If (LGreaterEqual (Local0, 0x03))
                            {
                                Store (0x00, Local0)
                            }
                        }
                        Else
                        {
                            Store (Arg0, Local0)
                        }

                        If (LEqual (Local0, 0x00))
                        {
                            Store (0x0101, NSTE)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x0808, NSTE)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            Store (0x0909, NSTE)
                        }

                        If (LEqual (Local0, 0x03))
                        {
                            Store (0x0404, NSTE)
                        }

                        If (LEqual (Local0, 0x04))
                        {
                            Store (0x0202, NSTE)
                        }

                        If (LEqual (Local0, 0x05))
                        {
                            Store (0x0C0C, NSTE)
                        }

                        If (LEqual (Local0, 0x06))
                        {
                            Store (0x0A0A, NSTE)
                        }

                        Notify (\_SB.PCI0.VGA, 0x80)
                    }

                    If (LEqual (0x01, DSEN))
                    {
                        PHSR (0x2C, 0x00)
                    }
                }

                Method (_Q19, 0, NotSerialized)
                {
                    Store (0x19, P80H)
                    If (\_SB.PCI0.EC0.KLMA)
                    {
                        LAMN (0x05)
                    }
                    Else
                    {
                        HKDS (0x10)
                    }
                }

                Method (_Q80, 0, NotSerialized)
                {
                    Store (0x80, P80H)
                    HKDS (0x00)
                }

                Method (_Q81, 0, NotSerialized)
                {
                    Store (0x81, P80H)
                    HKDS (0x01)
                }

                Method (_Q82, 0, NotSerialized)
                {
                    Store (0x82, P80H)
                    HKDS (0x02)
                }

                Method (_Q83, 0, NotSerialized)
                {
                    Store (0x83, P80H)
                    HKDS (0x03)
                }

                Method (_Q84, 0, NotSerialized)
                {
                    Store (0x84, P80H)
                    HKDS (0x04)
                }

                Method (_Q85, 0, NotSerialized)
                {
                    Store (0x85, P80H)
                    HKDS (0x05)
                }

                Method (_Q86, 0, NotSerialized)
                {
                    Store (0x86, P80H)
                    HKDS (0x06)
                }

                Method (_Q1A, 0, NotSerialized)
                {
                    Store (0x1A, P80H)
                    LAMN (0x06)
                }

                Method (_Q5C, 0, NotSerialized)
                {
                    Store (0x5C, P80H)
                    HKEY (0x5C)
                }

                Method (_Q1E, 0, NotSerialized)
                {
                    Store (0x1E, P80H)
                    LAMN (0x20)
                }

                Method (_Q1F, 0, NotSerialized)
                {
                    Store (0x1F, P80H)
                    LAMN (0x21)
                }

                Method (_Q22, 0, NotSerialized)
                {
                    Store (0x22, P80H)
                    LAMN (0x07)
                }

                Method (_Q10, 0, NotSerialized)
                {
                    Store (0x10, P80H)
                    LAMN (0x30)
                }

                Method (_Q11, 0, NotSerialized)
                {
                    Store (0x11, P80H)
                    LAMN (0x36)
                }

                Method (_Q12, 0, NotSerialized)
                {
                    Store (0x12, P80H)
                    LAMN (0x31)
                }

                Method (_Q13, 0, NotSerialized)
                {
                    Store (0x13, P80H)
                    LAMN (0x11)
                }

                Method (_Q14, 0, NotSerialized)
                {
                    Store (0x14, P80H)
                    LAMN (0x12)
                }

                Method (_Q15, 0, NotSerialized)
                {
                    Store (0x15, P80H)
                    LAMN (0x13)
                }

                Method (_Q1B, 0, NotSerialized)
                {
                    Store (0x1B, P80H)
                    LAMN (0x08)
                }

                Method (_Q1C, 0, NotSerialized)
                {
                    Store (0x1C, P80H)
                    Notify (\_SB.PCI0.VGA.LCD, 0x86)
                }

                Method (_Q1D, 0, NotSerialized)
                {
                    Store (0x1D, P80H)
                    Notify (\_SB.PCI0.VGA.LCD, 0x87)
                }

                Method (_Q23, 0, NotSerialized)
                {
                    Store (0x23, P80H)
                    LAMN (0x44)
                }

                Method (_Q28, 0, NotSerialized)
                {
                    Store (0x28, P80H)
                    \_SB.PCI0.EC0.MCEB.Z003 ()
                }

                Method (_Q32, 0, NotSerialized)
                {
                    Store (0x32, P80H)
                    HKEY (0x32)
                    Store (0x00, KCTT)
                    SGV3 (0x00)
                }

                Method (_Q33, 0, NotSerialized)
                {
                    Store (0x33, P80H)
                    Store (0x00, KCSS)
                    SGV3 (0x00)
                }

                Method (_Q34, 0, NotSerialized)
                {
                    Store (0x34, P80H)
                    Store (0x01, KCSS)
                    SGV3 (0xFF)
                }

                Method (_Q35, 0, NotSerialized)
                {
                    Store (0x35, P80H)
                    HKEY (0x35)
                    Store (0x01, KCTT)
                    SGV3 (0xFF)
                }

                Method (_Q36, 0, NotSerialized)
                {
                    Store (0x36, P80H)
                    Store (0x01, KOSD)
                    Sleep (0x01F4)
                    NTMR ()
                }

                Method (_Q40, 0, NotSerialized)
                {
                    Store (0x40, P80H)
                    Notify (\_SB.PCI0.EC0.BAT0, 0x81)
                }

                Method (_Q41, 0, NotSerialized)
                {
                    Store (0x41, P80H)
                    Notify (\_SB.PCI0.EC0.BAT0, 0x81)
                }

                Method (_Q48, 0, NotSerialized)
                {
                    Store (0x48, P80H)
                    Notify (\_SB.PCI0.EC0.BAT0, 0x80)
                }

                Method (_Q4C, 0, NotSerialized)
                {
                    Store (0x4C, P80H)
                    If (B0ST)
                    {
                        Notify (\_SB.PCI0.EC0.BAT0, 0x80)
                    }
                }

                Method (_Q50, 0, NotSerialized)
                {
                    Store (0x50, P80H)
                    Notify (\_SB.PCI0.EC0.ADP1, 0x80)
                }

                Method (_Q51, 0, NotSerialized)
                {
                    Store (0x51, P80H)
                    Notify (\_SB.PCI0.EC0.ADP1, 0x80)
                }

                Method (_Q52, 0, NotSerialized)
                {
                    Store (0x52, P80H)
                    Notify (\_SB.LID0, 0x80)
                }

                Method (_Q53, 0, NotSerialized)
                {
                    Store (0x53, P80H)
                    Notify (\_SB.LID0, 0x80)
                }

                Method (NTMR, 0, NotSerialized)
                {
                    Notify (\_TZ.TZS0, 0x80)
                    Notify (\_TZ.TZS1, 0x80)
                }

                Method (SGV3, 1, NotSerialized)
                {
                    If (LGreater (Arg0, 0x64))
                    {
                        Store (PPCM, PPCS)
                    }
                    Else
                    {
                        Store (Arg0, PPCS)
                    }

                    Notify (\_PR.CPU0, 0x80)
                    Notify (\_PR.CPU1, 0x80)
                }

                Field (RAM, ByteAcc, Lock, Preserve)
                {
                            Offset (0x02), 
                    NBID,   8, 
                            Offset (0x17), 
                        ,   5, 
                    SM0F,   1, 
                        ,   1, 
                    SM1F,   1, 
                            Offset (0x88), 
                    NB0A,   1, 
                        ,   2, 
                    NB0R,   1, 
                    NB0L,   1, 
                    NB0F,   1, 
                    NB0N,   1, 
                            Offset (0x89), 
                    NB1A,   1, 
                        ,   2, 
                    NB1R,   1, 
                    NB1L,   1, 
                    NB1F,   1, 
                    NB1N,   1
                }

                Field (RAM, ByteAcc, Lock, Preserve)
                {
                            Offset (0x88), 
                    NB0S,   8, 
                    NB1S,   8
                }

                Field (RAM, ByteAcc, Lock, Preserve)
                {
                            Offset (0xE0), 
                    BSRC,   16, 
                    BSFC,   16, 
                    BSPE,   16, 
                    BSAC,   16, 
                    BSVO,   16, 
                        ,   15, 
                    BSCM,   1, 
                    BSCU,   16, 
                    BSTV,   16
                }

                Field (RAM, ByteAcc, Lock, Preserve)
                {
                            Offset (0xE0), 
                    BSDC,   16, 
                    BSDV,   16, 
                    BSSN,   16
                }

                Field (RAM, ByteAcc, NoLock, Preserve)
                {
                            Offset (0xE0), 
                    BSMN,   128
                }

                Field (RAM, ByteAcc, NoLock, Preserve)
                {
                            Offset (0xE0), 
                    BSDN,   128
                }

                Field (RAM, ByteAcc, NoLock, Preserve)
                {
                            Offset (0xE0), 
                    BSCH,   128
                }

                Mutex (BATM, 0x07)
                Method (GBIF, 3, NotSerialized)
                {
                    Acquire (BATM, 0xFFFF)
                    If (Arg2)
                    {
                        Store (0xFFFFFFFF, Index (Arg1, 0x01))
                        Store (0xFFFFFFFF, Index (Arg1, 0x02))
                        Store (0xFFFFFFFF, Index (Arg1, 0x04))
                        Store (0x00, Index (Arg1, 0x05))
                        Store (0x00, Index (Arg1, 0x06))
                    }
                    Else
                    {
                        And (Arg0, 0xF0, NBID)
                        Store (BSCM, Local0)
                        XOr (Local0, 0x01, Index (Arg1, 0x00))
                        Or (Arg0, 0x01, NBID)
                        If (Local0)
                        {
                            Multiply (BSDC, 0x0A, Local1)
                        }
                        Else
                        {
                            Store (BSDC, Local1)
                        }

                        Store (Local1, Index (Arg1, 0x01))
                        And (Arg0, 0xF0, NBID)
                        If (Local0)
                        {
                            Multiply (BSFC, 0x0A, Local2)
                        }
                        Else
                        {
                            Store (BSFC, Local2)
                        }

                        Store (Local2, Index (Arg1, 0x02))
                        Or (Arg0, 0x01, NBID)
                        Store (BSDV, Index (Arg1, 0x04))
                        Divide (Local2, 0x64, Local7, Local6)
                        Multiply (Local6, 0x05, Local3)
                        Store (Local3, Index (Arg1, 0x05))
                        Multiply (0x03, 0x02, Local4)
                        Add (Local4, 0x01, Local4)
                        Multiply (Local6, Local4, Local4)
                        Divide (Local4, 0x02, Local7, Local4)
                        Store (Local4, Index (Arg1, 0x06))
                        Subtract (Local3, Local4, Index (Arg1, 0x07))
                        Subtract (Local2, Local3, Index (Arg1, 0x08))
                        Store (BSSN, Local7)
                        Name (SERN, Buffer (0x06)
                        {
                            "     "
                        })
                        Store (0x04, Local6)
                        While (Local7)
                        {
                            Divide (Local7, 0x0A, Local5, Local7)
                            Add (Local5, 0x30, Index (SERN, Local6))
                            Decrement (Local6)
                        }

                        Store (SERN, Index (Arg1, 0x0A))
                        Or (Arg0, 0x03, NBID)
                        Store (BSDN, Index (Arg1, 0x09))
                        Or (Arg0, 0x04, NBID)
                        Store (BSCH, Index (Arg1, 0x0B))
                        Or (Arg0, 0x02, NBID)
                        Store (BSMN, Index (Arg1, 0x0C))
                    }

                    Release (BATM)
                    Return (Arg1)
                }

                Method (GBST, 4, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (SM1F, Local0)
                    }
                    Else
                    {
                        Store (SM0F, Local0)
                    }

                    If (Local0)
                    {
                        And (Arg1, ShiftLeft (0x01, 0x03), Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (Arg3)
                        }
                    }

                    Acquire (BATM, 0xFFFF)
                    If (LAnd (LEqual (Arg0, 0x00), LOr (LEqual (NB0R, 0x00), LEqual (
                        SM0F, 0x01)))) {}
                    Else
                    {
                        If (LAnd (LEqual (Arg0, 0x10), LOr (LEqual (NB1R, 0x00), LEqual (
                            SM1F, 0x01)))) {}
                        Else
                        {
                            If (And (Arg1, 0x02))
                            {
                                Store (0x02, Local0)
                                If (And (Arg1, 0x20))
                                {
                                    Store (0x00, Local0)
                                }
                            }
                            Else
                            {
                                If (And (Arg1, 0x04))
                                {
                                    Store (0x01, Local0)
                                }
                                Else
                                {
                                    Store (0x00, Local0)
                                }
                            }

                            If (And (Arg1, 0x10))
                            {
                                Or (Local0, 0x04, Local0)
                            }

                            If (And (Arg1, 0x01))
                            {
                                And (Arg0, 0xF0, NBID)
                                Store (BSAC, Local1)
                                Store (BSRC, Local2)
                                If (ACST)
                                {
                                    If (And (Arg1, 0x20))
                                    {
                                        Store (BSFC, Local2)
                                    }
                                }

                                If (Arg2)
                                {
                                    Multiply (Local2, 0x0A, Local2)
                                }

                                Store (BSVO, Local3)
                                If (LGreaterEqual (Local1, 0x8000))
                                {
                                    If (And (Local0, 0x01))
                                    {
                                        Subtract (0x00010000, Local1, Local1)
                                    }
                                    Else
                                    {
                                        Store (0x00, Local1)
                                    }
                                }
                                Else
                                {
                                    If (LEqual (And (Local0, 0x02), 0x00))
                                    {
                                        Store (0x00, Local1)
                                    }
                                }

                                If (Arg2)
                                {
                                    Multiply (Local3, Local1, Local1)
                                    Divide (Local1, 0x03E8, Local7, Local1)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local0)
                                Store (0xFFFFFFFF, Local1)
                                Store (0xFFFFFFFF, Local2)
                                Store (0xFFFFFFFF, Local3)
                            }

                            Store (Local0, Index (Arg3, 0x00))
                            Store (Local1, Index (Arg3, 0x01))
                            Store (Local2, Index (Arg3, 0x02))
                            Store (Local3, Index (Arg3, 0x03))
                        }
                    }

                    Release (BATM)
                    Return (Arg3)
                }

                Name (B0ST, 0x00)
                Device (BAT0)
                {
                    Name (_HID, EisaId ("PNP0C0A"))
                    Name (_UID, 0x01)
                    Method (_PCL, 0, NotSerialized)
                    {
                        Return (\_SB)
                    }

                    Name (B0IP, Package (0x0D)
                    {
                        0x01, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0x01, 
                        0xFFFFFFFF, 
                        0x00, 
                        0x00, 
                        0x5A, 
                        0x5A, 
                        "", 
                        "100", 
                        "Lion", 
                        0x00
                    })
                    Name (B0SP, Package (0x04)
                    {
                        0x00, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (\ECON)
                        {
                            Store (NB0A, Local1)
                            If (NB0N)
                            {
                                Store (0x00, Local1)
                            }
                        }
                        Else
                        {
                            Store (RBEC (0x88), Local0)
                            ShiftRight (Local0, 0x00, Local1)
                            And (Local1, 0x01, Local1)
                            If (And (Local0, 0x40))
                            {
                                Store (0x00, Local1)
                            }
                        }

                        Store (Local1, B0ST)
                        If (Local1)
                        {
                            Return (0x1F)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Method (_BIF, 0, NotSerialized)
                    {
                        Store (B0ST, Local6)
                        Store (0x14, Local7)
                        While (LAnd (Local6, Local7))
                        {
                            If (\ECON)
                            {
                                Store (NB0S, Local1)
                            }
                            Else
                            {
                                Store (RBEC (0x88), Local1)
                            }

                            If (And (Local1, 0x08))
                            {
                                Store (0x00, Local6)
                            }
                            Else
                            {
                                Sleep (0x01F4)
                                Decrement (Local7)
                            }
                        }

                        Return (GBIF (0x00, B0IP, Local6))
                    }

                    Method (_BST, 0, NotSerialized)
                    {
                        XOr (DerefOf (Index (B0IP, 0x00)), 0x01, Local0)
                        If (\ECON)
                        {
                            Store (NB0S, Local1)
                        }
                        Else
                        {
                            Store (RBEC (0x88), Local1)
                        }

                        Return (GBST (0x00, Local1, Local0, B0SP))
                    }
                }

                Name (ACST, 0x01)
                Device (ADP1)
                {
                    Name (_HID, "ACPI0003")
                    Method (_PSR, 0, NotSerialized)
                    {
                        If (ECON)
                        {
                            Store (KACS, Local1)
                        }
                        Else
                        {
                            Store (RBEC (0x70), Local0)
                            And (Local0, 0x20, Local1)
                        }

                        If (Local1)
                        {
                            Store (0x01, ACST)
                        }
                        Else
                        {
                            Store (0x00, ACST)
                        }

                        Return (ACST)
                    }

                    Method (_PCL, 0, NotSerialized)
                    {
                        Return (\_SB)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }
            }

            Device (SMB0)
            {
                Name (_ADR, 0x000A0001)
                OperationRegion (SMCF, PCI_Config, 0x48, 0x04)
                Field (SMCF, AnyAcc, NoLock, Preserve)
                {
                    SB48,   4
                }

                OperationRegion (SBA0, PCI_Config, 0x20, 0x04)
                Field (SBA0, AnyAcc, NoLock, Preserve)
                {
                    SB20,   16
                }

                OperationRegion (SBA1, PCI_Config, 0x24, 0x04)
                Field (SBA1, AnyAcc, NoLock, Preserve)
                {
                    SB24,   16
                }

                OperationRegion (SBA2, PCI_Config, 0x7C, 0x04)
                Field (SBA2, AnyAcc, NoLock, Preserve)
                {
                    SB7C,   16
                }

                OperationRegion (SM74, PCI_Config, 0x74, 0x04)
                Field (SM74, AnyAcc, NoLock, Preserve)
                {
                    SMUB,   32
                }

                OperationRegion (P60, PCI_Config, 0x60, 0x02)
                Field (P60, AnyAcc, NoLock, Preserve)
                {
                    PMBR,   16
                }

                OperationRegion (P64, PCI_Config, 0x64, 0x02)
                Field (P64, AnyAcc, NoLock, Preserve)
                {
                    NVSB,   16
                }

                OperationRegion (P68, PCI_Config, 0x68, 0x02)
                Field (P68, AnyAcc, NoLock, Preserve)
                {
                    ANLG,   16
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (IORB, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            _Y09)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            _Y0A)
                    })
                    CreateWordField (IORB, \_SB.PCI0.SMB0._CRS._Y09._MIN, I7MN)
                    CreateWordField (IORB, \_SB.PCI0.SMB0._CRS._Y09._MAX, I7MX)
                    CreateWordField (IORB, \_SB.PCI0.SMB0._CRS._Y0A._MIN, I8MN)
                    CreateWordField (IORB, \_SB.PCI0.SMB0._CRS._Y0A._MAX, I8MX)
                    And (\_SB.PCI0.SMB0.SB20, 0xFFFC, I7MN)
                    Store (I7MN, I7MX)
                    And (\_SB.PCI0.SMB0.SB24, 0xFFFC, I8MN)
                    Store (I8MN, I8MX)
                    Return (IORB)
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x000B0000)
                Device (UPT1)
                {
                    Name (_ADR, 0x06)
                    Name (_EJD, "\\_SB.PCI0.XVR1.NUCD")
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }
                }

                Method (_S1D, 0, NotSerialized)
                {
                    Return (0x01)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (USB2)
            {
                Name (_ADR, 0x000B0001)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (MAC0)
            {
                Name (_ADR, 0x00140000)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x05
                })
            }

            Device (AZA0)
            {
                Name (_ADR, 0x00100001)
                Name (HDWA, 0x00)
                Name (_PRW, Package (0x02)
                {
                    0x15, 
                    0x04
                })
                Method (_PS0, 0, Serialized)
                {
                    If (LEqual (HDWA, 0x00))
                    {
                        Store (0x01, HDWA)
                        HKEY (0x3E)
                    }
                }

                Method (_PS3, 0, Serialized)
                {
                    Store (0x00, HDWA)
                }
            }

            Device (ACI0)
            {
                Name (_ADR, 0x00100002)
            }

            Device (MCI0)
            {
                Name (_ADR, 0x00100003)
            }

            Device (P2P0)
            {
                Name (_ADR, 0x00100000)
                Name (_UID, 0x02)
                OperationRegion (A080, PCI_Config, 0x19, 0x01)
                Field (A080, ByteAcc, NoLock, Preserve)
                {
                    SECB,   8
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
                }

                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (_PRT, Package (0x05)
                {
                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x01, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x02, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x03, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x04, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }
                })
            }

            Name (NATA, Package (0x01)
            {
                0x000D0000
            })
            Scope (\_SB.PCI0)
            {
                Device (NVRB)
                {
                    Name (_HID, "NVRAIDBUS")
                    Name (FNVR, 0xFF)
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, FNVR)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.R_ST, 0x01))
                        {
                            If (LEqual (FNVR, 0xFF))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x0D)
                            }
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x04D2,             // Range Minimum
                            0x04D2,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }
            }

            Device (IDE0)
            {
                Name (SID4, 0x00)
                Name (SID5, 0x00)
                Name (SFLG, 0x00)
                Name (SID0, 0x00)
                Name (SID1, 0x00)
                Name (SID2, 0x00)
                Name (SID3, 0x00)
                Name (_ADR, 0x000D0000)
                OperationRegion (A090, PCI_Config, 0x50, 0x18)
                Field (A090, DWordAcc, NoLock, Preserve)
                {
                    ID20,   16, 
                            Offset (0x08), 
                    IDTS,   16, 
                    IDTP,   16, 
                    ID22,   32, 
                    UMSS,   16, 
                    UMSP,   16
                }

                Name (IDEP, Buffer (0x14) {})
                Name (IDES, Buffer (0x14) {})
                Method (GTM, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (IDTP, Local0)
                        Store (UMSP, Local1)
                        Store (IDEP, Local2)
                    }
                    Else
                    {
                        Store (IDTS, Local0)
                        Store (UMSS, Local1)
                        Store (IDES, Local2)
                    }

                    CreateDWordField (Local2, 0x00, PIO0)
                    CreateDWordField (Local2, 0x04, DMA0)
                    CreateDWordField (Local2, 0x08, PIO1)
                    CreateDWordField (Local2, 0x0C, DMA1)
                    CreateDWordField (Local2, 0x10, FLAG)
                    Store (0x10, FLAG)
                    And (Local0, 0x0F00, Local3)
                    And (Local0, 0xF000, Local4)
                    ShiftRight (Local3, 0x08, Local3)
                    ShiftRight (Local4, 0x0C, Local4)
                    Add (Local3, Local4, Local3)
                    Multiply (Add (Local3, 0x02), 0x1E, PIO0)
                    If (LLessEqual (PIO0, 0xB4))
                    {
                        Or (FLAG, 0x02, FLAG)
                    }

                    If (And (Local1, 0x4000))
                    {
                        Or (FLAG, 0x01, FLAG)
                        And (Local1, 0x0700, Local3)
                        ShiftRight (Local3, 0x08, Local3)
                        Store (U2T (Local3), DMA0)
                    }
                    Else
                    {
                        Store (PIO0, DMA0)
                    }

                    And (Local0, 0x0F, Local3)
                    And (Local0, 0xF0, Local4)
                    ShiftRight (Local4, 0x04, Local4)
                    Add (Local3, Local4, Local3)
                    Multiply (Add (Local3, 0x02), 0x1E, PIO1)
                    If (LLessEqual (PIO1, 0xB4))
                    {
                        Or (FLAG, 0x08, FLAG)
                    }

                    If (And (Local1, 0x40))
                    {
                        Or (FLAG, 0x04, FLAG)
                        And (Local1, 0x07, Local3)
                        Store (U2T (Local3), DMA1)
                    }
                    Else
                    {
                        Store (PIO1, DMA1)
                    }

                    If (LEqual (Arg0, 0x00))
                    {
                        Store (Local2, IDEP)
                        Return (IDEP)
                    }
                    Else
                    {
                        Store (Local2, IDES)
                        Return (IDES)
                    }
                }

                Method (U2T, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Return (0x3C)
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        Return (0x5A)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Return (0x78)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Return (0x96)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Return (0x2D)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Return (0x1E)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Return (0x14)
                    }

                    Return (0x0F)
                }

                Method (T2U, 1, NotSerialized)
                {
                    If (LGreater (Arg0, 0x78))
                    {
                        Return (0x03)
                    }

                    If (LGreater (Arg0, 0x5A))
                    {
                        Return (0x02)
                    }

                    If (LGreater (Arg0, 0x3C))
                    {
                        Return (0x01)
                    }

                    If (LGreater (Arg0, 0x2D))
                    {
                        Return (0x00)
                    }

                    If (LGreater (Arg0, 0x1E))
                    {
                        Return (0x04)
                    }

                    If (LGreater (Arg0, 0x14))
                    {
                        Return (0x05)
                    }

                    If (LGreater (Arg0, 0x0F))
                    {
                        Return (0x06)
                    }

                    Return (0x07)
                }

                Method (T2D, 1, NotSerialized)
                {
                    If (LGreater (Arg0, 0x01E0))
                    {
                        Return (0xA8)
                    }

                    If (LGreater (Arg0, 0x0186))
                    {
                        Return (0x77)
                    }

                    If (LGreater (Arg0, 0xF0))
                    {
                        Return (0x47)
                    }

                    If (LGreater (Arg0, 0xB4))
                    {
                        Return (0x33)
                    }

                    If (LGreater (Arg0, 0x96))
                    {
                        Return (0x22)
                    }

                    If (LGreater (Arg0, 0x78))
                    {
                        Return (0x21)
                    }

                    Return (0x20)
                }

                Method (STM, 4, NotSerialized)
                {
                    If (SX)
                    {
                        Store (SID0, ID20)
                        Store (SID1, IDTS)
                        Store (SID2, IDTP)
                        Store (SID3, ID22)
                        Store (SID4, UMSS)
                        Store (SID5, UMSP)
                    }
                    Else
                    {
                        Store (ID20, SID0)
                        Store (IDTS, SID1)
                        Store (IDTP, SID2)
                        Store (ID22, SID3)
                        Store (UMSS, SID4)
                        Store (UMSP, SID5)
                    }

                    Store (0x00, SX)
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    If (LEqual (Arg3, 0x00))
                    {
                        Store (SID2, Local0)
                        Store (SID5, Local1)
                    }
                    Else
                    {
                        Store (SID1, Local0)
                        Store (SID4, Local1)
                    }

                    If (LNotEqual (PIO0, 0xFFFFFFFF))
                    {
                        And (Local0, 0xFF, Local0)
                        ShiftLeft (T2D (PIO0), 0x08, Local2)
                        Or (Local0, Local2, Local0)
                    }

                    If (LNotEqual (PIO1, 0xFFFFFFFF))
                    {
                        And (Local0, 0xFF00, Local0)
                        Or (Local0, T2D (PIO1), Local0)
                    }

                    If (And (FLAG, 0x01))
                    {
                        And (Local1, 0xFF, Local1)
                        ShiftLeft (T2U (DMA0), 0x08, Local2)
                        Or (0xC000, Local2, Local2)
                        Or (Local2, Local1, Local1)
                    }
                    Else
                    {
                        If (LNotEqual (DMA0, 0xFFFFFFFF))
                        {
                            And (Local0, 0xFF, Local0)
                            ShiftLeft (T2D (DMA0), 0x08, Local2)
                            Or (Local0, Local2, Local0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        And (Local1, 0xFF00, Local1)
                        Or (0xC0, T2U (DMA1), Local2)
                        Or (Local2, Local1, Local1)
                    }
                    Else
                    {
                        If (LNotEqual (DMA1, 0xFFFFFFFF))
                        {
                            And (Local0, 0xFF00, Local0)
                            Or (Local0, T2D (DMA1), Local0)
                        }
                    }

                    If (LEqual (Arg3, 0x00))
                    {
                        Store (Local0, IDTP)
                        Store (Local1, UMSP)
                    }
                    Else
                    {
                        Store (Local0, IDTS)
                        Store (Local1, UMSS)
                    }
                }

                Method (GTF, 2, NotSerialized)
                {
                    Store (Buffer (0x07)
                        {
                            0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                        }, Local0)
                    CreateByteField (Local0, 0x01, MODE)
                    CreateByteField (Local0, 0x05, DRIV)
                    Store (Arg1, DRIV)
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (IDEP, Local1)
                    }
                    Else
                    {
                        Store (IDES, Local1)
                    }

                    CreateDWordField (Local1, 0x00, PIO0)
                    CreateDWordField (Local1, 0x04, DMA0)
                    CreateDWordField (Local1, 0x08, PIO1)
                    CreateDWordField (Local1, 0x0C, DMA1)
                    CreateDWordField (Local1, 0x10, FLGX)
                    If (LEqual (Arg1, 0xA0))
                    {
                        Store (PIO0, Local2)
                        Store (DMA0, Local3)
                        And (FLGX, 0x01, FLGX)
                    }
                    Else
                    {
                        Store (PIO1, Local2)
                        Store (DMA1, Local3)
                        And (FLGX, 0x04, FLGX)
                    }

                    Store (FLGX, Local1)
                    If (LGreater (Local2, 0x0186))
                    {
                        Store (0x00, Local2)
                    }
                    Else
                    {
                        If (LGreater (Local2, 0xF0))
                        {
                            Store (0x01, Local2)
                        }
                        Else
                        {
                            If (LGreater (Local2, 0xB4))
                            {
                                Store (0x02, Local2)
                            }
                            Else
                            {
                                If (LGreater (Local2, 0x78))
                                {
                                    Store (0x03, Local2)
                                }
                                Else
                                {
                                    Store (0x04, Local2)
                                }
                            }
                        }
                    }

                    Or (0x08, Local2, MODE)
                    Store (Local0, Local2)
                    If (FLGX)
                    {
                        If (LGreater (Local3, 0x5A))
                        {
                            Store (0x00, Local3)
                        }
                        Else
                        {
                            If (LGreater (Local3, 0x3C))
                            {
                                Store (0x01, Local3)
                            }
                            Else
                            {
                                If (LGreater (Local3, 0x2D))
                                {
                                    Store (0x02, Local3)
                                }
                                Else
                                {
                                    If (LGreater (Local3, 0x1E))
                                    {
                                        Store (0x03, Local3)
                                    }
                                    Else
                                    {
                                        If (LGreater (Local3, 0x14))
                                        {
                                            Store (0x04, Local3)
                                        }
                                        Else
                                        {
                                            If (LGreater (Local3, 0x0F))
                                            {
                                                Store (0x05, Local3)
                                            }
                                            Else
                                            {
                                                Store (0x06, Local3)
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Or (0x40, Local3, MODE)
                    }
                    Else
                    {
                        If (LEqual (Local3, 0xFFFFFFFF))
                        {
                            Return (Local0)
                        }
                        Else
                        {
                            If (LGreater (Local3, 0x96))
                            {
                                Store (0x00, Local3)
                            }
                            Else
                            {
                                If (LGreater (Local3, 0x78))
                                {
                                    Store (0x01, Local3)
                                }
                                Else
                                {
                                    Store (0x02, Local3)
                                }
                            }

                            Or (0x20, Local3, MODE)
                        }
                    }

                    Concatenate (Local0, Local2, Local1)
                    Return (Local1)
                }

                Device (PRI0)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (GTM (0x00))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        STM (Arg0, Arg1, Arg2, 0x00)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTF (0x00, 0xA0))
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTF (0x00, 0xB0))
                        }
                    }
                }

                Device (SEC0)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (GTM (0x01))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        STM (Arg0, Arg1, Arg2, 0x01)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTF (0x01, 0xA0))
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTF (0x01, 0xB0))
                        }
                    }
                }

                Method (DRMP, 0, NotSerialized)
                {
                    Return (\_SB.R_P0)
                }
            }

            Device (SAT0)
            {
                Name (_ADR, 0x000E0000)
                Device (PRI0)
                {
                    Name (_ADR, 0x00)
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0008 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0010 */    0x13, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SPTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SEC0)
                {
                    Name (_ADR, 0x01)
                    Name (SSTM, Buffer (0x14)
                    {
                        /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0008 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0010 */    0x13, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SSTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SSTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Method (DRMP, 0, NotSerialized)
                {
                    Return (\_SB.R_S0)
                }
            }

            Device (XVR0)
            {
                Name (_ADR, 0x00040000)
                Name (_UID, 0x03)
                OperationRegion (A1E0, PCI_Config, 0x19, 0x01)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    SECB,   8
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
                }

                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (_PRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK4E, 
                        0x00
                    }
                })
            }

            Device (XVR1)
            {
                Name (_ADR, 0x00030000)
                Name (_UID, 0x04)
                OperationRegion (A1E1, PCI_Config, 0x19, 0x01)
                Field (A1E1, ByteAcc, NoLock, Preserve)
                {
                    SECB,   8
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
                }

                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (_PRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK4E, 
                        0x00
                    }
                })
                Device (NUCD)
                {
                    Name (_ADR, 0x00)
                    Name (_EJD, "\\_SB.PCI0.USB0.UPT1")
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }
                }
            }

            Device (XVR2)
            {
                Name (_ADR, 0x00020000)
                Name (_UID, 0x05)
                OperationRegion (A1E2, PCI_Config, 0x19, 0x01)
                Field (A1E2, ByteAcc, NoLock, Preserve)
                {
                    SECB,   8
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
                }

                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (_PRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK4E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }
                })
            }
        }

        Scope (\)
        {
            Name (PICF, 0x00)
            Method (_PIC, 1, NotSerialized)
            {
                Store (Arg0, PICF)
            }

            OperationRegion (\_SB.PCI0.LPC0.PIRQ, PCI_Config, 0x7C, 0x0C)
            Field (\_SB.PCI0.LPC0.PIRQ, AnyAcc, NoLock, Preserve)
            {
                INTW,   4, 
                INTX,   4, 
                INTY,   4, 
                INTZ,   4, 
                INTA,   4, 
                INTB,   4, 
                INTC,   4, 
                INTD,   4, 
                ISCI,   4, 
                ITCO,   4, 
                ISMB,   4, 
                IUS2,   4, 
                INTU,   4, 
                INTS,   4, 
                PSI1,   4, 
                PSI0,   4, 
                IUS0,   4, 
                IUS1,   4, 
                IMAC,   4, 
                IAZA,   4, 
                IACI,   4, 
                IMCI,   4, 
                IPID,   4, 
                ISID,   4
            }
        }

        Scope (\_SB.PCI0)
        {
            Name (BUFA, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {5,7,9,10,11,14,15}
            })
            Name (BUFB, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y0B)
                    {}
            })
            CreateWordField (BUFB, \_SB.PCI0._Y0B._INT, IRQV)
            Method (CRS, 1, Serialized)
            {
                If (Arg0)
                {
                    ShiftLeft (0x01, Arg0, IRQV)
                }
                Else
                {
                    Store (Zero, IRQV)
                }

                Return (BUFB)
            }

            Method (SRS, 1, Serialized)
            {
                CreateWordField (Arg0, 0x01, IRQ0)
                FindSetRightBit (IRQ0, Local0)
                Decrement (Local0)
                Return (Local0)
            }

            Name (BUFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                {
                    0x00000010,
                    0x00000011,
                    0x00000012,
                    0x00000013,
                    0x00000014,
                    0x00000015,
                    0x00000016,
                    0x00000017,
                }
            })
            Name (BUFW, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                {
                    0x00000013,
                }
            })
            Name (BUFX, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                {
                    0x00000014,
                }
            })
            Name (BUFY, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                {
                    0x00000015,
                }
            })
            Name (BUFF, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                {
                    0x00000005,
                    0x00000007,
                    0x0000000A,
                    0x0000000B,
                    0x0000000E,
                    0x0000000F,
                }
            })
            Method (CRSI, 1, Serialized)
            {
                Name (IRZ5, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, _Y0C)
                    {
                        0x00000007,
                    }
                })
                CreateWordField (IRZ5, \_SB.PCI0.CRSI._Y0C._INT, INZ5)
                Store (Arg0, Local0)
                If (LEqual (Arg0, 0x03))
                {
                    Store (0x10, Local0)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Store (0x11, Local0)
                }

                If (LEqual (Arg0, 0x06))
                {
                    Store (0x12, Local0)
                }

                If (LEqual (Arg0, 0x0C))
                {
                    Store (0x13, Local0)
                }

                If (LEqual (Arg0, 0x08))
                {
                    Store (0x14, Local0)
                }

                If (LEqual (Arg0, 0x0D))
                {
                    Store (0x15, Local0)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Store (0x16, Local0)
                }

                If (LEqual (Arg0, 0x01))
                {
                    Store (0x17, Local0)
                }

                Store (Local0, INZ5)
                Return (IRZ5)
            }

            Method (SRSI, 1, Serialized)
            {
                CreateWordField (Arg0, 0x05, IRZ6)
                Store (IRZ6, Local0)
                If (LEqual (IRZ6, 0x10))
                {
                    Store (0x03, Local0)
                }

                If (LEqual (IRZ6, 0x11))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (IRZ6, 0x12))
                {
                    Store (0x06, Local0)
                }

                If (LEqual (IRZ6, 0x13))
                {
                    Store (0x0C, Local0)
                }

                If (LEqual (IRZ6, 0x14))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (IRZ6, 0x15))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (IRZ6, 0x16))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (IRZ6, 0x17))
                {
                    Store (0x01, Local0)
                }

                Return (Local0)
            }

            Device (LNK1)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x01)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTW)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTW)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTW))
                    }
                    Else
                    {
                        Return (CRSI (INTW))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTW)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), INTW)
                    }
                }
            }

            Device (LNK2)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x02)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTX)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTX)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTX))
                    }
                    Else
                    {
                        Return (CRSI (INTX))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTX)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), INTX)
                    }
                }
            }

            Device (LNK3)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x03)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTY)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTY)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFF)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTY))
                    }
                    Else
                    {
                        Return (CRSI (INTY))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTY)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), INTY)
                    }
                }
            }

            Device (LNK4)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x04)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTZ)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTZ)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFF)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTZ))
                    }
                    Else
                    {
                        Return (CRSI (INTZ))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTZ)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), INTZ)
                    }
                }
            }

            Device (LK1E)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x05)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTA)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTA)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFX)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTA))
                    }
                    Else
                    {
                        Return (CRSI (INTA))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTA)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), INTA)
                    }
                }
            }

            Device (LK2E)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x06)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTB)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTB)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFW)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTB))
                    }
                    Else
                    {
                        Return (CRSI (INTB))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTB)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), INTB)
                    }
                }
            }

            Device (LK3E)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x07)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTC)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTC)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFY)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTC))
                    }
                    Else
                    {
                        Return (CRSI (INTC))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTC)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), INTC)
                    }
                }
            }

            Device (LK4E)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x08)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTD)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTD)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTD))
                    }
                    Else
                    {
                        Return (CRSI (INTD))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTD)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), INTD)
                    }
                }
            }

            Device (LSMB)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x09)
                Method (_STA, 0, NotSerialized)
                {
                    If (ISMB)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, ISMB)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (ISMB))
                    }
                    Else
                    {
                        Return (CRSI (ISMB))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), ISMB)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), ISMB)
                    }
                }
            }

            Device (LSMU)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x14)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTS)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTS)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTS))
                    }
                    Else
                    {
                        Return (CRSI (INTS))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTS)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), INTS)
                    }
                }
            }

            Device (LUS0)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0A)
                Method (_STA, 0, NotSerialized)
                {
                    If (IUS0)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IUS0)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IUS0))
                    }
                    Else
                    {
                        Return (CRSI (IUS0))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IUS0)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IUS0)
                    }
                }
            }

            Device (LUS2)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0C)
                Method (_STA, 0, NotSerialized)
                {
                    If (IUS2)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IUS2)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IUS2))
                    }
                    Else
                    {
                        Return (CRSI (IUS2))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IUS2)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IUS2)
                    }
                }
            }

            Device (LMAC)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0D)
                Method (_STA, 0, NotSerialized)
                {
                    If (IMAC)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IMAC)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IMAC))
                    }
                    Else
                    {
                        Return (CRSI (IMAC))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IMAC)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IMAC)
                    }
                }
            }

            Device (LAZA)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0E)
                Method (_STA, 0, NotSerialized)
                {
                    If (IAZA)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IAZA)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IAZA))
                    }
                    Else
                    {
                        Return (CRSI (IAZA))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IAZA)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IAZA)
                    }
                }
            }

            Device (LACI)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0F)
                Method (_STA, 0, NotSerialized)
                {
                    If (IACI)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IACI)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IACI))
                    }
                    Else
                    {
                        Return (CRSI (IACI))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IACI)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IACI)
                    }
                }
            }

            Device (LMCI)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x10)
                Method (_STA, 0, NotSerialized)
                {
                    If (IMCI)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IMCI)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IMCI))
                    }
                    Else
                    {
                        Return (CRSI (IMCI))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IMCI)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IMCI)
                    }
                }
            }

            Device (LPID)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x11)
                Method (_STA, 0, NotSerialized)
                {
                    If (IPID)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IPID)
                    Store (0x00, ISID)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IPID))
                    }
                    Else
                    {
                        Return (CRSI (IPID))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IPID)
                        Store (SRS (Arg0), ISID)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IPID)
                        Store (SRSI (Arg0), ISID)
                    }
                }
            }

            Device (LTID)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x12)
                Method (_STA, 0, NotSerialized)
                {
                    If (PSI0)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, PSI0)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (PSI0))
                    }
                    Else
                    {
                        Return (CRSI (PSI0))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), PSI0)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), PSI0)
                    }
                }
            }

            Device (LSI1)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x13)
                Method (_STA, 0, NotSerialized)
                {
                    If (PSI0)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, PSI1)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (PSI1))
                    }
                    Else
                    {
                        Return (CRSI (PSI1))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), PSI1)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), PSI1)
                    }
                }
            }
        }
    }

    Scope (\_PR.CPU0)
    {
        Method (_PPC, 0, NotSerialized)
        {
            Return (PPCS)
        }
    }

    Scope (\_PR.CPU1)
    {
        Method (_PPC, 0, NotSerialized)
        {
            Return (PPCS)
        }
    }

    OperationRegion (DBGP, SystemIO, 0x80, 0x01)
    Field (DBGP, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
    }

    OperationRegion (SWSB, SystemIO, 0x1001, 0x01)
    Field (SWSB, ByteAcc, NoLock, Preserve)
    {
        XVGE,   8
    }

    OperationRegion (LDTR, SystemIO, 0x10A6, 0x01)
    Field (LDTR, ByteAcc, NoLock, Preserve)
    {
        LDTC,   1
    }

    OperationRegion (NVGP, SystemIO, 0x14C4, 0x08)
    Field (NVGP, ByteAcc, NoLock, Preserve)
    {
        Z004,   8, 
        Z005,   8, 
        Z006,   8, 
        Z000,   8, 
        Z001,   8, 
        Z002,   8, 
        Z007,   8, 
        Z008,   8
    }

    Name (FWSO, "FWSO")
}

