/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of 9303WSMI_dsdt.asl, Thu Aug  2 22:37:22 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00005E13 (24083)
 *     Revision         0x01
 *     OEM ID           "NVIDIA"
 *     OEM Table ID     "MCP51M"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x0100000E (16777230)
 */
DefinitionBlock ("9303WSMI_dsdt.aml", "DSDT", 1, "NVIDIA", "MCP51M", 0x06040000)
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

    Name (B2ED, Buffer (0x14)
    {
        /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0010 */    0x00, 0x00, 0x00, 0x00
    })
    Method (WH15, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        CreateDWordField (Arg1, 0x00, DEAX)
        CreateDWordField (Arg1, 0x04, DEBX)
        CreateDWordField (Arg1, 0x08, DECX)
        CreateDWordField (Arg1, 0x0C, DEDX)
        If (\_SB.AMW0.FIRE)
        {
            If (LEqual (DEAX, 0x9610))
            {
                If (LOr (LEqual (DEBX, 0x34), LEqual (DEBX, 0x0134)))
                {
                    Store (\_SB.AMW0.BSTS, Local5)
                }
            }

            If (LEqual (DEAX, 0x9610))
            {
                If (LOr (LEqual (DEBX, 0x35), LEqual (DEBX, 0x0135)))
                {
                    Store (\_SB.AMW0.WSTS, Local6)
                }
            }
        }

        Store (DEAX, \_SB.PCI0.LPC0.WNVA)
        Store (DEBX, \_SB.PCI0.LPC0.WNVB)
        Store (DECX, \_SB.PCI0.LPC0.WNVC)
        Store (DEDX, \_SB.PCI0.LPC0.WNVD)
        Store (0x23, \_SB.PCI0.LPC0.BCMD)
        Store (0x80, \_SB.PCI0.LPC0.SMIC)
        Concatenate (\_SB.PCI0.LPC0.WNVA, \_SB.PCI0.LPC0.WNVB, Local0)
        Concatenate (\_SB.PCI0.LPC0.WNVC, \_SB.PCI0.LPC0.WNVD, Local1)
        Concatenate (Local0, Local1, B2ED)
        Store (\_SB.PCI0.LPC0.WFLG, Index (B2ED, 0x10))
        If (\_SB.AMW0.FIRE)
        {
            If (LEqual (DEAX, 0x9610))
            {
                If (LOr (LEqual (DEBX, 0x34), LEqual (DEBX, 0x0134)))
                {
                    If (LNotEqual (Local5, \_SB.AMW0.BSTS))
                    {
                        \_SB.AMW0.ACRN (0x02)
                    }
                }
            }

            If (LEqual (DEAX, 0x9610))
            {
                If (LOr (LEqual (DEBX, 0x35), LEqual (DEBX, 0x0135)))
                {
                    If (LNotEqual (Local6, \_SB.AMW0.WSTS))
                    {
                        \_SB.AMW0.ACRN (0x01)
                    }
                }
            }
        }

        Release (MSMI)
        Return (B2ED)
    }

    Method (I15H, 5, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg0, Local1)
        Store (Arg1, \_SB.PCI0.LPC0.WNVA)
        Store (Arg2, \_SB.PCI0.LPC0.WNVB)
        Store (Arg3, \_SB.PCI0.LPC0.WNVC)
        Store (Arg4, \_SB.PCI0.LPC0.WNVD)
        Store (0x23, \_SB.PCI0.LPC0.BCMD)
        Store (0x80, \_SB.PCI0.LPC0.SMIC)
        If (LEqual (Local1, 0x01))
        {
            Store (\_SB.PCI0.LPC0.WNVA, Local0)
        }

        If (LEqual (Local1, 0x02))
        {
            Store (\_SB.PCI0.LPC0.WNVB, Local0)
        }

        If (LEqual (Local1, 0x03))
        {
            Store (\_SB.PCI0.LPC0.WNVC, Local0)
        }

        If (LEqual (Local1, 0x04))
        {
            Store (\_SB.PCI0.LPC0.WNVD, Local0)
        }

        Release (MSMI)
        Return (Local0)
    }

    Name (B3ED, Buffer (0x28)
    {
        /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    })
    Method (AWMI, 5, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, \_SB.PCI0.LPC0.WNVA)
        Store (Arg2, \_SB.PCI0.LPC0.WNVB)
        Store (Arg3, \_SB.PCI0.LPC0.WNVC)
        Store (Arg4, \_SB.PCI0.LPC0.WNVD)
        Store (Arg0, \_SB.PCI0.LPC0.WFLG)
        Store (0x24, \_SB.PCI0.LPC0.BCMD)
        Store (0x80, \_SB.PCI0.LPC0.SMIC)
        If (LEqual (Arg0, 0x00))
        {
            Concatenate (\_SB.PCI0.LPC0.WNVA, 0x00, Local0)
            Concatenate (\_SB.PCI0.LPC0.WNVB, 0x00, Local1)
            Concatenate (\_SB.PCI0.LPC0.WNVC, 0x00, Local2)
            Concatenate (\_SB.PCI0.LPC0.WNVD, 0x00, Local3)
            Concatenate (Local3, Local2, Local4)
            Concatenate (Local1, Local0, Local5)
            Concatenate (Local4, Local5, B3ED)
            Store (0x00, Index (B3ED, 0x20))
        }

        If (LOr (LEqual (Arg0, 0x01), LEqual (Arg0, 0x02)))
        {
            Concatenate (\_SB.PCI0.LPC0.WNVA, 0x00, Local0)
            Concatenate (\_SB.PCI0.LPC0.WNVB, 0x00, Local1)
            Concatenate (Local0, Local1, B3ED)
            Store (0x00, Index (B3ED, 0x10))
        }

        If (LEqual (Arg0, 0x03))
        {
            Concatenate (\_SB.PCI0.LPC0.WNVA, 0x00, B3ED)
            Store (0x00, Index (B3ED, 0x08))
        }

        Release (MSMI)
        Return (B3ED)
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
    Name (\EEPM, 0x00)
    Method (\_PTS, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        Store (Arg0, \_SB.PCI0.EC0.SYSC)
        Store (0x01, \_SB.PCI0.EC0.MUTE)
        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, \_SB.PCI0.EC0.BLNK)
            Store (\_SB.PCI0.EC0.WEPM, EEPM)
        }

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

        PHSR (0x3C, 0x00)
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
        }

        If (LEqual (Arg0, 0x04))
        {
            PHSR (0x3B, 0xE8)
            PHSR (0x3A, 0x00)
        }

        PHSR (0x3D, 0x00)
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
            Notify (\_SB.PCI0.XVR1, 0x00)
            Notify (\_SB.PCI0.XVR2, 0x00)
        }
    }

    Scope (\_SB)
    {
        Device (AMW0)
        {
            Name (_HID, "*pnp0c14")
            Name (_UID, 0x00)
            Name (WLMP, 0x00)
            Name (B0ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (B0ED, 0x00, WLID)
            Name (B1ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            Name (B2ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (B2ED, 0x00, BUID)
            Name (_WDG, Buffer (0x0104)
            {
                /* 0000 */    0x81, 0x17, 0xF4, 0xD9, 0x33, 0xF6, 0x00, 0x44, 
                /* 0008 */    0x93, 0x55, 0x60, 0x17, 0x70, 0xBE, 0xC5, 0x10, 
                /* 0010 */    0x41, 0x41, 0x01, 0x00, 0x1D, 0x37, 0xC3, 0x67, 
                /* 0018 */    0xA3, 0x95, 0x37, 0x4C, 0xBB, 0x61, 0xDD, 0x47, 
                /* 0020 */    0xB4, 0x91, 0xDA, 0xAB, 0x41, 0x42, 0x01, 0x02, 
                /* 0028 */    0x71, 0xBF, 0xD1, 0x40, 0x2D, 0xA8, 0x59, 0x4E, 
                /* 0030 */    0xA1, 0x68, 0x39, 0x85, 0xE0, 0x3B, 0x2E, 0x87, 
                /* 0038 */    0xB0, 0x00, 0x01, 0x08, 0x21, 0x12, 0x90, 0x05, 
                /* 0040 */    0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0, 
                /* 0048 */    0xC9, 0x06, 0x29, 0x10, 0x44, 0x44, 0x01, 0x00, 
                /* 0050 */    0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E, 
                /* 0058 */    0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A, 
                /* 0060 */    0x43, 0x38, 0x01, 0x01, 0x58, 0xF2, 0xF4, 0x6A, 
                /* 0068 */    0x01, 0xB4, 0xFD, 0x42, 0xBE, 0x91, 0x3D, 0x4A, 
                /* 0070 */    0xC2, 0xD7, 0xC0, 0xD3, 0x43, 0x41, 0x01, 0x02, 
                /* 0078 */    0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41, 
                /* 0080 */    0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5, 
                /* 0088 */    0xB2, 0x00, 0x01, 0x08, 0x53, 0x44, 0x8C, 0xE7, 
                /* 0090 */    0x27, 0x02, 0x61, 0x48, 0x9E, 0xDE, 0xF5, 0x60, 
                /* 0098 */    0x0B, 0x4A, 0x3D, 0x39, 0x43, 0x42, 0x01, 0x02, 
                /* 00A0 */    0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48, 
                /* 00A8 */    0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B, 
                /* 00B0 */    0x43, 0x43, 0x01, 0x02, 0x79, 0x4C, 0xF9, 0xCF, 
                /* 00B8 */    0x77, 0x6C, 0xF7, 0x4A, 0xAC, 0x56, 0x7D, 0xD0, 
                /* 00C0 */    0xCE, 0x01, 0xC9, 0x97, 0x43, 0x44, 0x01, 0x02, 
                /* 00C8 */    0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B, 
                /* 00D0 */    0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9, 
                /* 00D8 */    0x43, 0x45, 0x01, 0x02, 0x4F, 0x06, 0x3A, 0x65, 
                /* 00E0 */    0x3A, 0xA2, 0x5F, 0x48, 0xB3, 0xD9, 0x13, 0xF6, 
                /* 00E8 */    0x53, 0x2A, 0x01, 0x82, 0x43, 0x46, 0x01, 0x02, 
                /* 00F0 */    0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45, 
                /* 00F8 */    0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D, 
                /* 0100 */    0xB4, 0x00, 0x01, 0x08
            })
            Method (_WED, 1, NotSerialized)
            {
                Store (Arg0, P80H)
                If (LEqual (Arg0, 0xB0))
                {
                    Return (B0ED)
                }

                If (LEqual (Arg0, 0xB2))
                {
                    GACR ()
                    Return (B2ED)
                }

                If (LEqual (Arg0, 0xB4))
                {
                    Return (B4ED)
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
                Return (WH15 (Arg1, Arg2))
            }

            Name (WQDD, Buffer (0x0460)
            {
                /* 0000 */    0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00, 
                /* 0008 */    0x4C, 0x04, 0x00, 0x00, 0x20, 0x19, 0x00, 0x00, 
                /* 0010 */    0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54, 
                /* 0018 */    0x28, 0xC8, 0x8C, 0x00, 0x01, 0x06, 0x18, 0x42, 
                /* 0020 */    0x10, 0x09, 0x10, 0x4A, 0xE2, 0x80, 0x42, 0x04, 
                /* 0028 */    0xCA, 0x0B, 0x21, 0xED, 0x30, 0x28, 0x38, 0x2B, 
                /* 0030 */    0x82, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x08, 0x84, 
                /* 0038 */    0x24, 0x0A, 0x30, 0x2F, 0x40, 0xB7, 0x00, 0xC3, 
                /* 0040 */    0x02, 0x6C, 0x0B, 0x30, 0x2D, 0xC0, 0x31, 0x90, 
                /* 0048 */    0xFA, 0xF7, 0x57, 0x86, 0x21, 0x11, 0x88, 0x54, 
                /* 0050 */    0x09, 0x84, 0x84, 0x0A, 0x50, 0x2E, 0xC0, 0xF7, 
                /* 0058 */    0x10, 0x02, 0x4A, 0xB2, 0x00, 0xCB, 0x30, 0x22, 
                /* 0060 */    0xE8, 0x15, 0x97, 0x80, 0x71, 0x82, 0x6A, 0x46, 
                /* 0068 */    0x81, 0x42, 0x37, 0x60, 0x9B, 0x02, 0x4C, 0x8E, 
                /* 0070 */    0x81, 0x88, 0x1E, 0x03, 0x4A, 0x05, 0x84, 0x3C, 
                /* 0078 */    0x0A, 0xB0, 0x8A, 0xA6, 0xD1, 0x24, 0xE8, 0x5E, 
                /* 0080 */    0x80, 0x34, 0x01, 0xC2, 0x50, 0x64, 0x4C, 0x80, 
                /* 0088 */    0x42, 0x01, 0x1A, 0x05, 0x78, 0x03, 0x91, 0x2D, 
                /* 0090 */    0x01, 0x06, 0x05, 0x88, 0x13, 0x30, 0x9F, 0x50, 
                /* 0098 */    0x51, 0xC2, 0x9D, 0x4A, 0x6B, 0x02, 0xCC, 0x41, 
                /* 00A0 */    0x11, 0xB4, 0xDA, 0xC0, 0x84, 0xD2, 0x19, 0x90, 
                /* 00A8 */    0x40, 0x62, 0xB5, 0x08, 0x2E, 0x98, 0xD8, 0x51, 
                /* 00B0 */    0xA3, 0x04, 0x8A, 0xDE, 0xFE, 0x1C, 0x14, 0x46, 
                /* 00B8 */    0x01, 0x44, 0x0D, 0x20, 0x4A, 0x33, 0x18, 0xD4, 
                /* 00C0 */    0x7C, 0x12, 0x9C, 0x96, 0x07, 0x73, 0xA0, 0x9D, 
                /* 00C8 */    0x0B, 0x90, 0x3E, 0x52, 0x81, 0x9C, 0xE8, 0x61, 
                /* 00D0 */    0xD4, 0x39, 0x57, 0x02, 0x92, 0xA0, 0x6C, 0x08, 
                /* 00D8 */    0xED, 0xDB, 0x03, 0xC4, 0xBB, 0xC6, 0xD3, 0xAC, 
                /* 00E0 */    0x4F, 0xC0, 0x72, 0xD0, 0x50, 0x03, 0xF4, 0x64, 
                /* 00E8 */    0xA3, 0xC5, 0x3F, 0xE4, 0x70, 0xD6, 0x35, 0x16, 
                /* 00F0 */    0xD4, 0x15, 0xC0, 0x0E, 0xA7, 0xA2, 0xE1, 0x96, 
                /* 00F8 */    0x2A, 0xC0, 0xEC, 0xB4, 0x35, 0xAD, 0x04, 0x47, 
                /* 0100 */    0x63, 0xE0, 0x43, 0x3F, 0x9B, 0x9E, 0x8F, 0x04, 
                /* 0108 */    0x9E, 0x02, 0x6A, 0x5A, 0xD6, 0x01, 0xA2, 0x71, 
                /* 0110 */    0x1E, 0x54, 0xC8, 0x88, 0xE1, 0xCE, 0xC9, 0xE8, 
                /* 0118 */    0x09, 0xEE, 0x50, 0x02, 0x46, 0x03, 0x77, 0xBA, 
                /* 0120 */    0x47, 0x83, 0xFF, 0xFF, 0x8F, 0x06, 0xAB, 0xF8, 
                /* 0128 */    0x52, 0x20, 0x84, 0xC3, 0x8C, 0xEC, 0xE1, 0x24, 
                /* 0130 */    0x18, 0x0E, 0x42, 0x4E, 0x66, 0x83, 0x92, 0x71, 
                /* 0138 */    0x48, 0x20, 0x70, 0x47, 0x71, 0xC4, 0x1E, 0xBE, 
                /* 0140 */    0x6E, 0x0D, 0x54, 0xD4, 0x94, 0x29, 0x81, 0xA5, 
                /* 0148 */    0x5C, 0x14, 0x10, 0x57, 0x82, 0x98, 0x87, 0xEF, 
                /* 0150 */    0x91, 0x9C, 0x8F, 0xEF, 0x11, 0x1E, 0x17, 0x5C, 
                /* 0158 */    0x3D, 0x70, 0xA8, 0xA1, 0xD8, 0xFB, 0x7C, 0xC9, 
                /* 0160 */    0x00, 0x8E, 0xD3, 0x73, 0x07, 0x83, 0xF5, 0xA9, 
                /* 0168 */    0x13, 0xDC, 0xD7, 0x84, 0x07, 0x0A, 0xDF, 0x13, 
                /* 0170 */    0xE2, 0x62, 0xC7, 0x67, 0xBF, 0x02, 0x10, 0x62, 
                /* 0178 */    0x97, 0x39, 0x7B, 0x39, 0x45, 0xD0, 0xC8, 0x8C, 
                /* 0180 */    0xFC, 0x24, 0x10, 0x35, 0x7A, 0xEC, 0x08, 0x67, 
                /* 0188 */    0x1B, 0xFF, 0x10, 0x5E, 0x01, 0x3C, 0x03, 0x13, 
                /* 0190 */    0x3C, 0x45, 0x9C, 0x00, 0x46, 0xCC, 0x04, 0x50, 
                /* 0198 */    0xF7, 0x85, 0x03, 0x38, 0x9C, 0xA8, 0x27, 0x70, 
                /* 01A0 */    0x38, 0x51, 0x0E, 0xE2, 0x78, 0x7C, 0xC4, 0x30, 
                /* 01A8 */    0x42, 0xEC, 0x72, 0x2F, 0x1A, 0x44, 0xF3, 0x24, 
                /* 01B0 */    0x35, 0x8A, 0x27, 0x80, 0x33, 0xB0, 0xC0, 0x19, 
                /* 01B8 */    0xA0, 0x6E, 0x0E, 0x9E, 0x01, 0xC7, 0x7F, 0xC4, 
                /* 01C0 */    0x38, 0x3C, 0x2B, 0x9D, 0x14, 0xFA, 0xB8, 0xE1, 
                /* 01C8 */    0x19, 0xE1, 0xE0, 0xB9, 0xD0, 0x1B, 0x09, 0x4A, 
                /* 01D0 */    0xDA, 0xA5, 0x04, 0xC8, 0xFC, 0xFF, 0x2F, 0x25, 
                /* 01D8 */    0xC0, 0x05, 0xE3, 0x45, 0xE4, 0xF0, 0x9F, 0x47, 
                /* 01E0 */    0x5E, 0x46, 0xDE, 0x42, 0x5E, 0x43, 0x5E, 0x4A, 
                /* 01E8 */    0x8C, 0xF3, 0x3C, 0xF2, 0x52, 0x10, 0xE1, 0xA5, 
                /* 01F0 */    0xC4, 0x87, 0x13, 0x23, 0x44, 0x09, 0x19, 0xE8, 
                /* 01F8 */    0x8D, 0x24, 0x42, 0x94, 0x70, 0x81, 0xC2, 0x1A, 
                /* 0200 */    0x21, 0xC8, 0x23, 0xC1, 0xE1, 0x1E, 0x73, 0xAC, 
                /* 0208 */    0x40, 0x61, 0x5E, 0x4A, 0xAC, 0xF5, 0x8B, 0x21, 
                /* 0210 */    0x0B, 0x97, 0x12, 0x80, 0x62, 0xFF, 0xFF, 0x4B, 
                /* 0218 */    0x09, 0xF0, 0xBC, 0x72, 0xE0, 0x2E, 0x25, 0x60, 
                /* 0220 */    0x1A, 0x1C, 0x3F, 0x94, 0x00, 0x8F, 0x09, 0xF0, 
                /* 0228 */    0xA0, 0x24, 0xF4, 0x04, 0xE2, 0x08, 0x1F, 0x03, 
                /* 0230 */    0x1F, 0x42, 0x00, 0x29, 0x07, 0x8F, 0xD7, 0x8E, 
                /* 0238 */    0x93, 0x7C, 0x00, 0xF1, 0x41, 0xCB, 0xC7, 0x2C, 
                /* 0240 */    0x9F, 0x3F, 0x5E, 0x3C, 0xCE, 0xF4, 0x21, 0x84, 
                /* 0248 */    0x8D, 0x29, 0x98, 0x51, 0x0E, 0x3E, 0x42, 0xD4, 
                /* 0250 */    0x77, 0x11, 0x23, 0x46, 0x08, 0x16, 0x2A, 0x50, 
                /* 0258 */    0x8C, 0xA8, 0x91, 0x0D, 0x1B, 0x21, 0xCE, 0x43, 
                /* 0260 */    0x88, 0x33, 0xBD, 0x15, 0x34, 0x4F, 0x1F, 0x42, 
                /* 0268 */    0xF0, 0xFF, 0xFF, 0x43, 0x08, 0xE0, 0x5F, 0xE4, 
                /* 0270 */    0xB1, 0x02, 0xA4, 0x93, 0x38, 0x80, 0x28, 0xCF, 
                /* 0278 */    0x07, 0x61, 0xCE, 0xE6, 0x4D, 0x20, 0xE0, 0x83, 
                /* 0280 */    0x05, 0xF0, 0x10, 0xF7, 0xA2, 0xD3, 0xAD, 0xC4, 
                /* 0288 */    0xC2, 0x40, 0x64, 0x43, 0xD0, 0xAC, 0x30, 0xF9, 
                /* 0290 */    0xBE, 0x3C, 0x42, 0x2F, 0x1E, 0x57, 0x83, 0x3E, 
                /* 0298 */    0xC8, 0xA3, 0x38, 0x65, 0xE7, 0x82, 0x12, 0xAC, 
                /* 02A0 */    0x27, 0xED, 0x44, 0x30, 0x4A, 0x40, 0xA2, 0xD9, 
                /* 02A8 */    0x18, 0xDA, 0x9A, 0x61, 0x04, 0x67, 0x10, 0xDF, 
                /* 02B0 */    0x80, 0x1C, 0xE2, 0xF6, 0x02, 0xE5, 0xB6, 0xE0, 
                /* 02B8 */    0x51, 0xFC, 0xFF, 0x8F, 0xAA, 0x58, 0x18, 0xDD, 
                /* 02C0 */    0x28, 0x7C, 0x54, 0xF0, 0xF4, 0x7C, 0x0D, 0xE0, 
                /* 02C8 */    0x87, 0x3E, 0x9F, 0x0B, 0x8C, 0xEC, 0x03, 0x83, 
                /* 02D0 */    0xEF, 0x30, 0x1C, 0xCC, 0x17, 0x0B, 0x46, 0xE0, 
                /* 02D8 */    0x1B, 0x0B, 0xD8, 0x86, 0x04, 0xF3, 0x1E, 0x70, 
                /* 02E0 */    0x48, 0x60, 0x9E, 0xAA, 0x87, 0x04, 0x3C, 0xC0, 
                /* 02E8 */    0x0F, 0x09, 0xCC, 0x57, 0x02, 0x0F, 0x09, 0x78, 
                /* 02F0 */    0x0C, 0xE2, 0x90, 0xC0, 0x8C, 0xE4, 0x21, 0x81, 
                /* 02F8 */    0xE7, 0xFF, 0x3F, 0x24, 0xA6, 0xEF, 0xC6, 0x01, 
                /* 0300 */    0x0A, 0x20, 0x9F, 0x30, 0x7C, 0xBA, 0x7B, 0xC9, 
                /* 0308 */    0x60, 0x63, 0x78, 0xC0, 0x33, 0x9A, 0xD1, 0xB9, 
                /* 0310 */    0x9C, 0xE5, 0xE8, 0x42, 0xC1, 0x57, 0xE4, 0x63, 
                /* 0318 */    0x81, 0x41, 0x3C, 0x2D, 0xC7, 0x98, 0x2A, 0xFA, 
                /* 0320 */    0x9E, 0x62, 0x9F, 0x97, 0x10, 0x72, 0xA2, 0xE0, 
                /* 0328 */    0xAA, 0xCF, 0x32, 0xD0, 0xAE, 0x1E, 0x31, 0x3D, 
                /* 0330 */    0x57, 0x98, 0xB7, 0x1C, 0xCF, 0x15, 0x6C, 0x63, 
                /* 0338 */    0x82, 0x7B, 0xA4, 0x60, 0x63, 0x02, 0xEF, 0x59, 
                /* 0340 */    0xC4, 0x63, 0x02, 0x26, 0x67, 0x0A, 0x36, 0x26, 
                /* 0348 */    0xF0, 0xA2, 0x78, 0x4C, 0x60, 0xF8, 0xFF, 0x8F, 
                /* 0350 */    0x09, 0x3C, 0x87, 0x0A, 0x36, 0x26, 0xF0, 0x7A, 
                /* 0358 */    0x18, 0x13, 0x08, 0x53, 0x5C, 0x3B, 0xA0, 0x20, 
                /* 0360 */    0xBF, 0x09, 0x3D, 0xFA, 0xBC, 0xFB, 0xBC, 0x3B, 
                /* 0368 */    0x79, 0x4A, 0xE0, 0x85, 0xF4, 0xB9, 0x03, 0x38, 
                /* 0370 */    0xEB, 0x3D, 0xB8, 0x50, 0x59, 0xB3, 0x42, 0xDD, 
                /* 0378 */    0x52, 0x7C, 0x75, 0x63, 0x87, 0x28, 0xDC, 0xB9, 
                /* 0380 */    0x10, 0xA3, 0x6A, 0x9C, 0x28, 0x58, 0xA3, 0x85, 
                /* 0388 */    0x2D, 0xFC, 0x7C, 0x45, 0xEE, 0x65, 0x9E, 0x98, 
                /* 0390 */    0x31, 0xDE, 0xB6, 0x98, 0x5A, 0x13, 0x27, 0x3C, 
                /* 0398 */    0x4C, 0x8C, 0x43, 0x1E, 0xC8, 0xFE, 0xFF, 0x87, 
                /* 03A0 */    0x3C, 0xE0, 0x3A, 0x94, 0x17, 0x73, 0x4F, 0xFB, 
                /* 03A8 */    0xDD, 0x2E, 0xC8, 0xA3, 0x9D, 0x2F, 0xE7, 0x0C, 
                /* 03B0 */    0x22, 0xD2, 0x43, 0x9E, 0x2F, 0x77, 0xAF, 0x5C, 
                /* 03B8 */    0x6F, 0x78, 0xBE, 0xBE, 0xFA, 0x58, 0xEE, 0x6B, 
                /* 03C0 */    0x9E, 0x51, 0x63, 0x05, 0xF6, 0xBD, 0xD5, 0x60, 
                /* 03C8 */    0x86, 0x35, 0xC8, 0x43, 0x9E, 0x73, 0x1D, 0xF2, 
                /* 03D0 */    0x00, 0x5A, 0x60, 0x3D, 0xE4, 0x81, 0xED, 0xFF, 
                /* 03D8 */    0x7F, 0xC8, 0x83, 0x81, 0x78, 0x86, 0xB8, 0x63, 
                /* 03E0 */    0x1E, 0xB0, 0x48, 0x77, 0xCC, 0xA3, 0xC9, 0x8E, 
                /* 03E8 */    0x79, 0x68, 0xD5, 0x40, 0x3A, 0xE6, 0xE1, 0xD5, 
                /* 03F0 */    0xC2, 0xD2, 0x69, 0x5B, 0x27, 0x8C, 0x8E, 0x79, 
                /* 03F8 */    0x00, 0xBB, 0xFE, 0xFF, 0xC7, 0x3C, 0x80, 0x23, 
                /* 0400 */    0x21, 0x8F, 0x79, 0xA8, 0x58, 0xC7, 0x3C, 0x0A, 
                /* 0408 */    0xE2, 0x5B, 0x96, 0x8F, 0x79, 0x80, 0xBF, 0xFF, 
                /* 0410 */    0xFF, 0x31, 0x0F, 0xE0, 0x5B, 0x2C, 0x08, 0x19, 
                /* 0418 */    0xB9, 0xF0, 0xD0, 0x31, 0x59, 0xCA, 0x98, 0x10, 
                /* 0420 */    0x87, 0x22, 0x9F, 0x7E, 0x22, 0xBC, 0x8C, 0xB1, 
                /* 0428 */    0x08, 0x17, 0x06, 0x3A, 0x29, 0x98, 0xB7, 0x27, 
                /* 0430 */    0x4F, 0x8A, 0xA3, 0x79, 0x34, 0x0F, 0x13, 0x4C, 
                /* 0438 */    0x20, 0x36, 0x3D, 0xEF, 0xC1, 0x3A, 0xD0, 0x79, 
                /* 0440 */    0x6E, 0xB8, 0xFF, 0xFF, 0xDC, 0xE0, 0xDD, 0xC4, 
                /* 0448 */    0x9E, 0x08, 0x81, 0xD9, 0xDB, 0xCE, 0x47, 0x14, 
                /* 0450 */    0xE0, 0x7C, 0x92, 0x7B, 0x3E, 0x61, 0x27, 0x42, 
                /* 0458 */    0x70, 0xFD, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00
            })
            Name (FIRE, 0x00)
            Name (CBE0, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (CBE0, 0x00, BER4)
            CreateWordField (CBE0, 0x00, BUF0)
            CreateWordField (CBE0, 0x02, BER2)
            OperationRegion (RAM, EmbeddedControl, 0x00, 0xFF)
            Field (RAM, ByteAcc, Lock, Preserve)
            {
                CMD0,   8, 
                        Offset (0x02), 
                NBID,   8, 
                        Offset (0x08), 
                DAT0,   8, 
                DAT1,   8, 
                    ,   2, 
                WLED,   2, 
                BLED,   2, 
                        Offset (0x52), 
                WDEV,   1, 
                BDEV,   1, 
                WEPM,   1, 
                        Offset (0x70), 
                CRTS,   1, 
                KLID,   1, 
                    ,   3, 
                KACS,   1, 
                        Offset (0x71), 
                WSTS,   1, 
                BSTS,   1, 
                        Offset (0x82), 
                MSTP,   8, 
                CSTP,   7, 
                        Offset (0x88), 
                NB0A,   1, 
                        Offset (0x89), 
                NB1A,   1, 
                        Offset (0x95), 
                FAN1,   8, 
                        Offset (0xA8), 
                THS0,   8, 
                THS1,   8
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                        Offset (0xE0), 
                BSRC,   16, 
                BSFC,   16, 
                        Offset (0xE8), 
                BSVO,   16, 
                    ,   15, 
                BSCM,   1, 
                BSCU,   16, 
                BSBT,   16
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                        Offset (0xE0), 
                BSDC,   16, 
                BSDV,   16, 
                BSSN,   16, 
                        Offset (0xEE), 
                BSCY,   16
            }

            Field (RAM, ByteAcc, NoLock, Preserve)
            {
                        Offset (0xE2), 
                BSTF,   16, 
                BSTE,   16, 
                        Offset (0xEA), 
                BSMD,   16, 
                BSCC,   16, 
                BSME,   16
            }

            OperationRegion (PCNT, SystemIO, 0x1010, 0x04)
            Field (PCNT, ByteAcc, NoLock, Preserve)
            {
                    ,   1, 
                TDTY,   3, 
                T_EN,   1, 
                    ,   12, 
                T_ST,   1
            }

            Method (WQC8, 1, NotSerialized)
            {
                Store (0xC8, P80H)
                Store (0x00, Local0)
                If (WDEV)
                {
                    Store (WTYP (), Local0)
                }

                Store (BDEV, Local1)
                ShiftLeft (Local1, 0x04, Local1)
                Or (Local0, Local1, Local0)
                If (LGreaterEqual (MSTP, 0x0F))
                {
                    ShiftLeft (0x01, 0x05, Local1)
                    Or (Local0, Local1, Local0)
                }

                Store (0x00, BER2)
                Store (Local0, BUF0)
                Return (CBE0)
            }

            Method (WMCA, 3, NotSerialized)
            {
                Store (0xCA, P80H)
                CreateDWordField (Arg2, 0x00, CB04)
                CreateByteField (Arg2, 0x00, CB01)
                Store (0x00, BER2)
                If (LEqual (Arg1, 0x01))
                {
                    Store (WSTS, Local0)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (BSTS, Local0)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (CSTP, Local0)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x04))
                {
                    If (WDEV)
                    {
                        If (CB04)
                        {
                            Store (0x01, Local0)
                        }
                        Else
                        {
                            Store (0x00, Local0)
                        }

                        Store (Local0, WSTS)
                    }

                    Store (0x00, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x05))
                {
                    If (BDEV)
                    {
                        If (CB04)
                        {
                            Store (0x01, Local0)
                        }
                        Else
                        {
                            Store (0x00, Local0)
                        }

                        Store (Local0, BSTS)
                        Store (Local0, BLED)
                    }

                    Store (0x00, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x06))
                {
                    Store (CB01, Local0)
                    If (LLessEqual (Local0, MSTP))
                    {
                        Store (Local0, CSTP)
                    }

                    Store (0x00, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x07))
                {
                    If (CB04)
                    {
                        Store (0x01, Local0)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                    }

                    Store (Local0, FIRE)
                    Store (Local0, WEPM)
                    Store (0x00, BER4)
                    Return (CBE0)
                }
            }

            Method (WMCB, 3, NotSerialized)
            {
                Store (0xCB, P80H)
                CreateDWordField (Arg2, 0x00, CD04)
                CreateByteField (Arg2, 0x00, CD01)
                Store (0x00, BER2)
                If (LEqual (Arg1, 0x01))
                {
                    Store (0x00, Local0)
                    If (T_EN)
                    {
                        Store (TDTY, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Store (0x04, Local0)
                        }
                    }

                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    If (CD04)
                    {
                        Store (CD01, TDTY)
                        Store (0x01, T_EN)
                    }
                    Else
                    {
                        Store (0x00, T_EN)
                    }

                    Store (0x00, BER4)
                    Return (CBE0)
                }
            }

            Method (WMCC, 3, NotSerialized)
            {
                Store (0xCC, P80H)
            }

            Method (WMCD, 3, NotSerialized)
            {
                Store (0xCD, P80H)
                CreateDWordField (Arg2, 0x00, CD04)
                CreateByteField (Arg2, 0x00, CD01)
                Store (0x00, BER2)
                If (LEqual (Arg1, 0x01))
                {
                    Return (AWMI (0x00, CD04, 0x00, 0x00, 0x00))
                }

                If (LEqual (Arg1, 0x02))
                {
                    Return (AWMI (0x01, 0x00, 0x00, CD04, 0x00))
                }

                If (LEqual (Arg1, 0x03))
                {
                    CreateDWordField (Arg2, 0x08, CD08)
                    CreateDWordField (Arg2, 0x10, CD16)
                    Return (AWMI (0x02, CD08, 0x00, CD04, CD16))
                }

                If (LEqual (Arg1, 0x06))
                {
                    Store (FAN1, Local0)
                    If (LEqual (Local0, 0xFF))
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        Store (0x00078000, Local1)
                        Divide (Local1, Local0, Local2, Local0)
                    }

                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x07))
                {
                    Store (THS1, Local0)
                    Add (Local0, 0x0111, Local0)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x08))
                {
                    CreateByteField (Arg2, 0x00, PD00)
                    CreateDWordField (Arg2, 0x01, PD01)
                    Return (AWMI (0x03, PD00, PD01, 0x00, 0x00))
                }

                If (LEqual (Arg1, 0x09))
                {
                    CreateByteField (Arg2, 0x08, PD08)
                    CreateDWordField (Arg2, 0x09, PD09)
                    AWMI (0x04, PD08, PD09, CD04, 0x00)
                    Store (0x01, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0A)) {}
            }

            Method (WMCE, 3, NotSerialized)
            {
                Store (0xCE, P80H)
                CreateDWordField (Arg2, 0x00, CD04)
                CreateByteField (Arg2, 0x00, CD01)
                If (LEqual (Arg1, 0x01))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSCM, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSBT, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSVO, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x04))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSCU, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x05))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSRC, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x06))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSFC, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x07))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSCY, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x08))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSDC, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x09))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSDV, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0A))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x05, NBID)
                    Store (BSMD, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0B))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSSN, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0C))
                {
                    Or (NB0A, NB1A, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        Store (0x03, BER2)
                        Return (CBE0)
                    }

                    If (CD04)
                    {
                        Store (0xEA, CMD0)
                    }
                    Else
                    {
                        Store (0xE9, CMD0)
                    }

                    Store (0x00, BER2)
                    Store (0x01, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0D)) {}
                If (LEqual (Arg1, 0x0E)) {}
                If (LEqual (Arg1, 0x0F))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x05, NBID)
                    Store (BSTF, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x10))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x05, NBID)
                    Store (BSME, Local0)
                    Release (\_SB.PCI0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }
            }

            Method (GBID, 1, NotSerialized)
            {
                Store (0x00, Local1)
                If (LEqual (Arg0, 0x01))
                {
                    If (NB0A)
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        Store (0x02, Local1)
                    }
                }
                Else
                {
                    If (LEqual (Arg0, 0x02))
                    {
                        If (NB1A)
                        {
                            Store (0x10, Local0)
                        }
                        Else
                        {
                            Store (0x02, Local1)
                        }
                    }
                    Else
                    {
                        Store (0x02, Local1)
                    }
                }

                Store (0x00, BUF0)
                Store (Local1, BER2)
                Return (Local0)
            }

            Method (ACRN, 1, NotSerialized)
            {
                Store (0x00, Local0)
                If (FIRE)
                {
                    If (LEqual (Arg0, 0x01))
                    {
                        Store (0x0100, Local0)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (0x0200, Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (0x0300, Local0)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (0x0500, Local0)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (0x0501, Local0)
                    }

                    Store (Local0, BUID)
                    Notify (AMW0, 0xB2)
                }
            }

            Method (GACR, 0, NotSerialized)
            {
                Store (0x00, Local0)
                If (FIRE)
                {
                    And (BUID, 0xFF00, Local1)
                    If (LEqual (Local1, 0x0100))
                    {
                        Or (Local1, WSTS, Local0)
                    }

                    If (LEqual (Local1, 0x0200))
                    {
                        Or (Local1, BSTS, Local0)
                    }

                    If (LEqual (Local1, 0x0300))
                    {
                        Or (Local1, CSTP, Local0)
                    }
                }

                Store (Local0, BUID)
            }

            Method (WTYP, 0, NotSerialized)
            {
                Store (0x00, Local1)
                Store (\I15H (0x01, 0x9610, 0x0235, 0x00, 0x00), Local0)
                If (And (Local0, 0x01))
                {
                    Store (0x02, Local1)
                }

                If (And (Local0, 0x02))
                {
                    Store (0x06, Local1)
                }

                If (And (Local0, 0x04))
                {
                    Store (0x05, Local1)
                }

                If (And (Local0, 0x08))
                {
                    Store (0x04, Local1)
                }

                If (And (Local0, 0x10))
                {
                    Store (0x03, Local1)
                }

                If (And (Local0, 0x20))
                {
                    Store (0x07, Local1)
                }

                Return (Local1)
            }

            Name (FDSP, 0x00)
            Name (FKDN, 0x00)
            Name (B4ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (B4ED, 0x00, DSID)
            Method (WMCF, 3, NotSerialized)
            {
                Store (0xCF, P80H)
                CreateDWordField (Arg2, 0x00, CF04)
                Store (0x00, BER2)
                If (LEqual (Arg1, 0x01))
                {
                    Store (0x00, FKDN)
                    If (CF04)
                    {
                        Store (0x01, Local0)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                    }

                    Store (Local0, FDSP)
                    Store (0x00, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (FDSP, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x03))
                {
                    If (LEqual (FKDN, 0x01))
                    {
                        Store (0x01, Local0)
                    }
                    Else
                    {
                        Store (0x02, Local0)
                    }

                    Store (Local0, BUF0)
                    Return (CBE0)
                }
            }

            Method (ADSN, 1, NotSerialized)
            {
                Store (0x00, Local0)
                If (FDSP)
                {
                    If (LEqual (Arg0, 0x01))
                    {
                        If (CRTS)
                        {
                            Store (0x0601, Local0)
                        }
                        Else
                        {
                            Store (0x0600, Local0)
                        }
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (0x01, FKDN)
                        Store (0x00015001, Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        If (LEqual (FKDN, 0x01))
                        {
                            Store (0x02, FKDN)
                            Store (0x00010002, Local0)
                        }
                    }

                    Store (Local0, DSID)
                    If (Local0)
                    {
                        Notify (AMW0, 0xB4)
                    }
                }
            }
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

        Device (MEM0)
        {
            Name (_HID, EisaId ("PNP0C01"))
            Method (_CRS, 0, Serialized)
            {
                Name (MEMR, ResourceTemplate ()
                {
                    Memory32Fixed (ReadOnly,
                        0xFFC00000,         // Address Base
                        0x00400000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEC00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEE00000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y00)
                })
                CreateDWordField (MEMR, \_SB.MEM0._CRS._Y00._BAS, MBAS)
                CreateDWordField (MEMR, \_SB.MEM0._CRS._Y00._LEN, MBLE)
                If (\_SB.PCI0.LPC0.MTBA)
                {
                    Store (\_SB.PCI0.LPC0.MTBA, MBAS)
                    Store (0x1000, MBLE)
                }

                Return (MEMR)
            }
        }

        Device (PCI0)
        {
            Method (_INI, 0, NotSerialized)
            {
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
                OperationRegion (ASLD, SystemMemory, 0x3FF1BDBC, 0x00000100)
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
                        ,, _Y01, AddressRangeMemory, TypeStatic)
                })
                CreateDWordField (CBUF, \_SB.PCI0._CRS._Y01._MIN, PMMN)
                CreateDWordField (CBUF, \_SB.PCI0._CRS._Y01._LEN, PMLN)
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
                Name (CRTA, 0x01)
                Name (LCDA, 0x01)
                Name (TVAF, 0x01)
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
                        If (CRTA)
                        {
                            Return (0x1F)
                        }
                        Else
                        {
                            Return (0x1D)
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (CRTA)
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                    }
                }

                Device (LCD)
                {
                    Name (_ADR, 0x0118)
                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LCDA)
                        {
                            Return (0x1F)
                        }
                        Else
                        {
                            Return (0x1D)
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (LCDA)
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                    }
                }

                Device (TVO)
                {
                    Name (_ADR, 0x0200)
                    Method (_DCS, 0, NotSerialized)
                    {
                        If (TVAF)
                        {
                            Return (0x1F)
                        }
                        Else
                        {
                            Return (0x1D)
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (TVAF)
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
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
            }

            Device (LPC0)
            {
                Name (_ADR, 0x000A0000)
                OperationRegion (P44, PCI_Config, 0x44, 0x04)
                Field (P44, AnyAcc, NoLock, Preserve)
                {
                    MTBA,   32
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
                                0x80,               // Length
                                _Y07)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x40,               // Length
                                _Y08)
                        })
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y02._MIN, I1MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y02._MAX, I1MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y03._MIN, I2MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y03._MAX, I2MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y04._MIN, I3MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y04._MAX, I3MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y05._MIN, I4MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y05._MAX, I4MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y06._MIN, I5MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y06._MAX, I5MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y07._MIN, I6MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y07._MAX, I6MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y08._MIN, I9MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y08._MAX, I9MX)
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
                Name (_CRS, ResourceTemplate ()
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
                Name (_CRS, ResourceTemplate ()
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

            OperationRegion (N393, SystemIO, 0x2E, 0x02)
            Field (N393, ByteAcc, NoLock, Preserve)
            {
                INDX,   8, 
                DATA,   8
            }

            Mutex (MTIO, 0x00)
            Method (SETD, 1, Serialized)
            {
                Acquire (MTIO, 0xFFFF)
                Store (0x07, INDX)
                Store (Arg0, DATA)
                Release (MTIO)
            }

            Method (READ, 1, Serialized)
            {
                Acquire (MTIO, 0xFFFF)
                Store (Arg0, INDX)
                Store (DATA, Local0)
                Return (Local0)
                Release (MTIO)
            }

            Method (WRIT, 2, Serialized)
            {
                Acquire (MTIO, 0xFFFF)
                Store (Arg0, INDX)
                Store (Arg1, DATA)
                Release (MTIO)
            }

            Method (STAT, 1, NotSerialized)
            {
                Acquire (MTIO, 0xFFFF)
                Store (0x26, INDX)
                And (DATA, Arg0, Local0)
                Release (MTIO)
                Return (XOr (Local0, Arg0))
            }

            Device (COMB)
            {
                Name (_UID, 0x02)
                Name (FLAG, 0xFF)
                Name (ISNO, 0x00)
                Name (ISIR, 0x01)
                Name (ISCB, 0x02)
                Method (MODE, 0, NotSerialized)
                {
                    If (LEqual (FLAG, 0xFF))
                    {
                        If (STAT (0x04))
                        {
                            SETD (0x02)
                            If (LEqual (READ (0x74), 0x04))
                            {
                                Store (ISCB, FLAG)
                            }
                            Else
                            {
                                Store (ISIR, FLAG)
                            }
                        }
                        Else
                        {
                            Store (ISNO, FLAG)
                        }
                    }

                    Return (FLAG)
                }

                Method (_HID, 0, NotSerialized)
                {
                    If (LEqual (MODE (), ISIR))
                    {
                        Return (0x0160633A)
                    }
                    Else
                    {
                        Return (0x0105D041)
                    }
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (MODE (), ISNO))
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        SETD (0x02)
                        If (READ (0x30))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x0D)
                        }
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    SETD (0x02)
                    WRIT (0x30, 0x00)
                }

                Name (CRSA, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y09)
                    IRQNoFlags (_Y0A)
                        {}
                })
                Name (CRSB, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0B)
                    IRQNoFlags (_Y0C)
                        {}
                    DMA (Compatibility, NotBusMaster, Transfer8, _Y0D)
                        {}
                })
                Method (_CRS, 0, NotSerialized)
                {
                    CreateWordField (CRSA, \_SB.PCI0.COMB._Y09._MIN, MINA)
                    CreateWordField (CRSA, \_SB.PCI0.COMB._Y09._MAX, MAXA)
                    CreateWordField (CRSA, \_SB.PCI0.COMB._Y0A._INT, LKAA)
                    Store (Zero, MINA)
                    Store (Zero, MAXA)
                    Store (Zero, LKAA)
                    CreateWordField (CRSB, \_SB.PCI0.COMB._Y0B._MIN, MINB)
                    CreateWordField (CRSB, \_SB.PCI0.COMB._Y0B._MAX, MAXB)
                    CreateWordField (CRSB, \_SB.PCI0.COMB._Y0C._INT, LKBB)
                    CreateByteField (CRSB, \_SB.PCI0.COMB._Y0D._DMA, DMAB)
                    Store (Zero, MINB)
                    Store (Zero, MAXB)
                    Store (Zero, LKBB)
                    Store (Zero, DMAB)
                    SETD (0x02)
                    If (READ (0x30))
                    {
                        ShiftLeft (READ (0x60), 0x08, Local0)
                        Add (Local0, READ (0x61), Local0)
                        Store (Local0, MINA)
                        Store (Local0, MAXA)
                        Store (Local0, MINB)
                        Store (Local0, MAXB)
                        And (READ (0x70), 0x0F, Local0)
                        If (Local0)
                        {
                            ShiftLeft (One, Local0, Local0)
                        }

                        Store (Local0, LKAA)
                        Store (Local0, LKBB)
                        Store (READ (0x74), Local0)
                        If (LNotEqual (Local0, 0x04))
                        {
                            ShiftLeft (One, Local0, DMAB)
                        }
                    }

                    If (LEqual (MODE (), ISIR))
                    {
                        Return (CRSB)
                    }
                    Else
                    {
                        Return (CRSA)
                    }
                }

                Name (PRSA, ResourceTemplate ()
                {
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x02F8,             // Range Minimum
                            0x02F8,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {3,4}
                    }
                    EndDependentFn ()
                })
                Name (PRSB, ResourceTemplate ()
                {
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x02F8,             // Range Minimum
                            0x02F8,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {3,4}
                        DMA (Compatibility, NotBusMaster, Transfer8, )
                            {0,1,2,3}
                    }
                    EndDependentFn ()
                })
                Method (_PRS, 0, NotSerialized)
                {
                    If (LEqual (MODE (), ISIR))
                    {
                        Return (PRSB)
                    }
                    Else
                    {
                        Return (PRSA)
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LEqual (MODE (), ISIR))
                    {
                        Store (Arg0, CRSB)
                        CreateWordField (CRSB, \_SB.PCI0.COMB._Y0B._MIN, MINB)
                        CreateWordField (CRSB, \_SB.PCI0.COMB._Y0C._INT, LKBB)
                        CreateByteField (CRSB, \_SB.PCI0.COMB._Y0D._DMA, DMAB)
                        FindSetRightBit (DMAB, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }
                        Else
                        {
                            Store (0x04, Local0)
                        }

                        Store (MINB, Local1)
                        Store (LKBB, Local2)
                    }
                    Else
                    {
                        Store (Arg0, CRSA)
                        CreateWordField (CRSA, \_SB.PCI0.COMB._Y09._MIN, MINA)
                        CreateWordField (CRSA, \_SB.PCI0.COMB._Y0A._INT, LKAA)
                        Store (0x04, Local0)
                        Store (MINA, Local1)
                        Store (LKAA, Local2)
                    }

                    SETD (0x02)
                    WRIT (0x74, Local0)
                    ShiftRight (Local1, 0x08, Local0)
                    WRIT (0x60, Local0)
                    And (Local1, 0xFF, Local0)
                    WRIT (0x61, Local0)
                    FindSetRightBit (Local2, Local0)
                    If (Local0)
                    {
                        Decrement (Local0)
                    }

                    WRIT (0x70, Local0)
                    WRIT (0x30, 0x01)
                    If (LEqual (MODE (), ISIR))
                    {
                        Or (READ (0xF0), 0x80, Local0)
                        WRIT (0xF0, Local0)
                    }
                }

                Method (_PS0, 0, NotSerialized)
                {
                    SETD (0x02)
                    If (LEqual (MODE (), ISIR))
                    {
                        Or (READ (0xF0), 0x80, Local1)
                        WRIT (0xF0, Local1)
                    }

                    WRIT (0x60, 0x02)
                    WRIT (0x61, 0xF8)
                    WRIT (0x30, 0x01)
                }

                Method (_PS3, 0, NotSerialized)
                {
                    SETD (0x02)
                    WRIT (0x30, 0x00)
                }
            }

            Scope (\_SB.PCI0.LPC0)
            {
                OperationRegion (SMI0, SystemIO, 0x142E, 0x01)
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x3FF1BEBD, 0x00000090)
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
                    INF2,   8
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
                Name (_HID, EisaId ("SYN0302"))
                Name (_CID, Package (0x03)
                {
                    0x00032E4F, 
                    0x02002E4F, 
                    0x130FD041
                })
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
                            Offset (0x50), 
                        ,   1, 
                    CAME,   1, 
                            Offset (0x52), 
                        ,   1, 
                        ,   1, 
                    WEPM,   1, 
                            Offset (0x5E), 
                    SYSC,   4, 
                    SYSO,   4, 
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
                    KLMA,   1
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

                        If (LEqual (Z003, 0x40))
                        {
                            Notify (\_SB.PCI0.VGA, 0x80)
                        }

                        If (LEqual (Z003, 0x60))
                        {
                            Notify (\_SB.PCI0.XVR0.VGA, 0x80)
                        }
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
                    If (\_SB.AMW0.FIRE)
                    {
                        \_SB.AMW0.ACRN (0x01)
                    }
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
                    If (\_SB.AMW0.FIRE)
                    {
                        \_SB.AMW0.ACRN (0x03)
                    }
                    Else
                    {
                        LAMN (0x73)
                    }
                }

                Method (_Q1D, 0, NotSerialized)
                {
                    Store (0x1D, P80H)
                    If (\_SB.AMW0.FIRE)
                    {
                        \_SB.AMW0.ACRN (0x03)
                    }
                    Else
                    {
                        LAMN (0x74)
                    }
                }

                Method (_Q23, 0, NotSerialized)
                {
                    Store (0x23, P80H)
                    LAMN (0x44)
                    If (\_SB.AMW0.FIRE)
                    {
                        \_SB.AMW0.ACRN (0x02)
                    }
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
                    If (\_SB.AMW0.FIRE)
                    {
                        If (\_SB.PCI0.EC0.NB0N)
                        {
                            \_SB.AMW0.ACRN (0x04)
                        }
                    }
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

                Method (_Q4D, 0, NotSerialized)
                {
                    Store (0x4D, P80H)
                    \_SB.AMW0.ADSN (0x01)
                }

                Method (_Q4E, 0, NotSerialized)
                {
                    Store (0x4E, P80H)
                    \_SB.AMW0.ADSN (0x03)
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
                    Store (Arg0, PPCS)
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
                            _Y0E)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            _Y0F)
                    })
                    CreateWordField (IORB, \_SB.PCI0.SMB0._CRS._Y0E._MIN, I7MN)
                    CreateWordField (IORB, \_SB.PCI0.SMB0._CRS._Y0E._MAX, I7MX)
                    CreateWordField (IORB, \_SB.PCI0.SMB0._CRS._Y0F._MIN, I8MN)
                    CreateWordField (IORB, \_SB.PCI0.SMB0._CRS._Y0F._MAX, I8MX)
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
                OperationRegion (SMUB, SystemMemory, 0xB0004044, 0x02)
                Field (SMUB, AnyAcc, NoLock, Preserve)
                {
                    MUB1,   16
                }

                Method (_PS0, 0, NotSerialized)
                {
                    Store (0x0700, \_SB.PCI0.USB0.MUB1)
                }

                Method (_PS3, 0, NotSerialized)
                {
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
                    0x03
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

                Name (_PRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x01, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x02, 
                        \_SB.PCI0.LNK3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }
                })
                Name (_PRW, Package (0x02)
                {
                    0x00, 
                    0x05
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
                Device (VGA)
                {
                    Name (_ADR, 0x00)
                    Name (CRTA, 0x01)
                    Name (LCDA, 0x01)
                    Name (TVAF, 0x01)
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
                            If (CRTA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0118)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (LCDA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (LCDA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (TVO)
                    {
                        Name (_ADR, 0x0200)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (TVAF)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (TVAF)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
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
                }
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
                Device (X1S0)
                {
                    Name (_ADR, 0x00)
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
                Device (X2S0)
                {
                    Name (_ADR, 0x00)
                }
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
                IRQ (Level, ActiveLow, Shared, _Y10)
                    {}
            })
            CreateWordField (BUFB, \_SB.PCI0._Y10._INT, IRQV)
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
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, _Y11)
                    {
                        0x00000007,
                    }
                })
                CreateWordField (IRZ5, \_SB.PCI0.CRSI._Y11._INT, INZ5)
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
                        Return (BUFI)
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
                    Return (BUFA)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTZ))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTZ)
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
                        Return (BUFI)
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
                        Return (BUFI)
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
                        Return (BUFI)
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
        Z003,   8, 
        Z000,   8, 
        Z001,   8, 
        Z002,   8, 
        Z006,   8, 
        Z007,   8
    }

    Name (FWSO, "FWSO")
}

