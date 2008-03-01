ACPI Warning (nsaccess-0731): NsLookup: Type mismatch on INFO (RegionField), searching for (Buffer) [20080123]
ACPI Warning (nsaccess-0731): NsLookup: Type mismatch on INFO (RegionField), searching for (Buffer) [20080123]
ACPI Warning (nsaccess-0731): NsLookup: Type mismatch on INFO (RegionField), searching for (Buffer) [20080123]
ACPI Warning (nsaccess-0731): NsLookup: Type mismatch on INFO (RegionField), searching for (Buffer) [20080123]
/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080123
 *
 * Disassembly of 7520, Sun Feb 17 18:12:09 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00009CC5 (40133)
 *     Revision         0x01
 *     Checksum         0xD6
 *     OEM ID           "ATI"
 *     OEM Table ID     "SB600"
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x0100000E (16777230)
 */
DefinitionBlock ("7520.aml", "DSDT", 1, "ATI", "SB600", 0x06040000)
{
    Name (Z000, 0x01)
    Name (Z001, 0x02)
    Name (Z002, 0x04)
    Name (Z003, 0x08)
    Name (Z004, 0x00)
    Name (Z005, 0x0F)
    Name (Z006, 0x0D)
    Name (Z007, 0x0B)
    Name (Z008, 0x09)
    Name (\LIDF, 0x00)
    Name (LIDS, 0x01)
    Name (\ECON, 0x00)
    Name (\VDSS, 0x00)
    Name (\DSEN, 0x01)
    Name (\WLPW, 0x00)
    Name (\WLLE, 0x00)
    Name (\BTPW, 0x00)
    Name (\BTLE, 0x00)
    Name (\EEPM, 0x00)
    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00008010, 0x06) {}
        Processor (CPU1, 0x01, 0x00000000, 0x00) {}
    }

    Name (_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x04)
    {
        0x03, 
        0x03, 
        0x00, 
        0x00
    })
    Name (_S4, Package (0x04)
    {
        0x04, 
        0x04, 
        0x00, 
        0x00
    })
    Name (_S5, Package (0x04)
    {
        0x05, 
        0x05, 
        0x00, 
        0x00
    })
    OperationRegion (\DEBG, SystemIO, 0x1080, 0x01)
    Field (\DEBG, 
    {
        0x01
        DBGP,   8
    }

    OperationRegion (GNVS, SystemMemory, 0x7FE939E4, 0x00000400)
    Field (GNVS, 
    {
        0x00
        FIRS,   8, 
        FIRN,   8
    }

    OperationRegion (\IRPO, SystemIO, 0x02FC, 0x01)
    Field (\IRPO, 
    {
        0x01
        IRTR,   8
    }

    OperationRegion (\PMIO, SystemIO, 0x0CD6, 0x02)
    Field (\PMIO, 
    {
        0x01
        PIDX,   8, 
        PDAT,   8
    }

    OperationRegion (\P01, SystemIO, 0x8001, 0x01)
    Field (\P01, 
    {
        0x01
        PST1,   8
    }

    Name (HTTX, 0x00)
    Method (_PTS, 1, NotSerialized)
    {
        If (FIRN)
        {
            Store (0x00, \_SB.PCI0.LPC0.EC0.FIRP)
        }

        Store (0x20, \_SB.PCI0.SMB.USBB)
        If (LLessEqual (\_SB.PCI0.SMB.RVID, 0x13))
        {
            Store (Zero, \_SB.PCI0.SMB.PWDE)
        }

        Store (Arg0, \_SB.PCI0.LPC0.EC0.SYSC)
        Store (\_SB.PCI0.LPC0.EC0.WEPM, \_SB.PCI0.LPC0.EC0.EPMS)
        Store (\_SB.PCI0.LPC0.EC0.WLLD, \_SB.PCI0.LPC0.EC0.WLLS)
        Store (\_SB.PCI0.LPC0.EC0.WLEN, \_SB.PCI0.LPC0.EC0.WLES)
        Store (\_SB.PCI0.LPC0.EC0.BTLD, \_SB.PCI0.LPC0.EC0.BTLS)
        Store (\_SB.PCI0.LPC0.EC0.BTEN, \_SB.PCI0.LPC0.EC0.BTES)
        Store (0x00, \_SB.PCI0.LPC0.EC0.WLEN)
        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, \_SB.PCI0.LPC0.EC0.BLNK)
        }

        If (LEqual (Arg0, 0x05))
        {
            PHSR (0x83, 0x00)
            Store (One, \_SB.PCI0.SMB.SLPS)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (Zero, \_SB.PCI0.SMB.RSTU)
            Store (One, \_SB.PCI0.SMB.SLPS)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Zero, \_SB.PCI0.SMB.RS3U)
            Store (One, \_SB.PCI0.SMB.SLPS)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (\_SB.PCI0.SMB.PEWS, \_SB.PCI0.SMB.PEWS)
        Store (One, \_SB.PCI0.SMB.HECO)
        PHSR (0x81, 0x00)
        Store (Arg0, \_SB.PCI0.LPC0.EC0.SYSO)
        \_SB.PCI0.LPC0.EC0.TINI ()
        Store (\_SB.PCI0.LPC0.EC0.EPMS, \_SB.PCI0.LPC0.EC0.WEPM)
        Store (\_SB.PCI0.LPC0.EC0.WLLS, \_SB.PCI0.LPC0.EC0.WLLD)
        Store (\_SB.PCI0.LPC0.EC0.WLES, \_SB.PCI0.LPC0.EC0.WLEN)
        Store (\_SB.PCI0.LPC0.EC0.BTLS, \_SB.PCI0.LPC0.EC0.BTLD)
        Store (\_SB.PCI0.LPC0.EC0.BTES, \_SB.PCI0.LPC0.EC0.BTEN)
        Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x81)
        If (LEqual (Arg0, 0x03))
        {
            Store (One, \_SB.PCI0.SMB.RS3U)
            Store (One, \_SB.PCI0.SMB.IR9S)
            Store (One, \_SB.PCI0.SMB.IR9E)
            Store (0x61, PIDX)
            Store (PDAT, Local0)
            And (Local0, 0x80, Local0)
            If (LEqual (Local0, 0x00))
            {
                Notify (\_SB.PWRB, 0x02)
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            If (GPIC)
            {
                \_SB.PCI0.LPC0.DSPI ()
            }

            Notify (\_SB.PWRB, 0x02)
        }

        If (LEqual (\_SB.PCI0.GFXI, 0x00))
        {
            Store (0x60, \_SB.PCI0.SMB.USBB)
        }

        If (FIRN)
        {
            Store (0x77, \_SB.PCI0.LPC0.EC0.FIRP)
        }

        Notify (\_SB.PCI0, 0x00)
    }

    Scope (\_SI)
    {
        Method (_SST, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x01))
            {
                Store ("===== SST Working =====", Debug)
            }

            If (LEqual (Arg0, 0x02))
            {
                Store ("===== SST Waking =====", Debug)
            }

            If (LEqual (Arg0, 0x03))
            {
                Store ("===== SST Sleeping =====", Debug)
            }

            If (LEqual (Arg0, 0x04))
            {
                Store ("===== SST Sleeping S4 =====", Debug)
            }
        }
    }

    Scope (\_SB)
    {
        Name (LINX, 0x00)
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0x7FE94DE4, 0x00000001)
        Field (OSTY, 
        {
            0x00
            TPOS,   8
        }

        Method (OSTP, 0, NotSerialized)
        {
            If (LEqual (^OSTB, Ones))
            {
                If (CondRefOf (\_OSI, Local0))
                {
                    Store (0x00, ^OSTB)
                    Store (0x00, ^TPOS)
                    If (\_OSI ("Windows 2001"))
                    {
                        Store (0x08, ^OSTB)
                        Store (0x08, ^TPOS)
                    }

                    If (\_OSI ("Windows 2001.1"))
                    {
                        Store (0x20, ^OSTB)
                        Store (0x20, ^TPOS)
                    }

                    If (\_OSI ("Windows 2001 SP1"))
                    {
                        Store (0x10, ^OSTB)
                        Store (0x10, ^TPOS)
                    }

                    If (\_OSI ("Windows 2001 SP2"))
                    {
                        Store (0x11, ^OSTB)
                        Store (0x11, ^TPOS)
                    }

                    If (\_OSI ("Windows 2001 SP3"))
                    {
                        Store (0x12, ^OSTB)
                        Store (0x12, ^TPOS)
                    }

                    If (\_OSI ("Windows 2006"))
                    {
                        Store (0x40, ^OSTB)
                        Store (0x40, ^TPOS)
                    }

                    If (\_OSI ("Linux"))
                    {
                        Store (0x01, LINX)
                        Store (0x80, ^OSTB)
                        Store (0x80, ^TPOS)
                    }
                }
                Else
                {
                    If (CondRefOf (\_OS, Local0))
                    {
                        If (^SEQL (\_OS, "Microsoft Windows"))
                        {
                            Store (0x01, ^OSTB)
                            Store (0x01, ^TPOS)
                        }
                        Else
                        {
                            If (^SEQL (\_OS, "Microsoft WindowsME: Millennium Edition"))
                            {
                                Store (0x02, ^OSTB)
                                Store (0x02, ^TPOS)
                            }
                            Else
                            {
                                If (^SEQL (\_OS, "Microsoft Windows NT"))
                                {
                                    Store (0x04, ^OSTB)
                                    Store (0x04, ^TPOS)
                                }
                                Else
                                {
                                    Store (0x00, ^OSTB)
                                    Store (0x00, ^TPOS)
                                }
                            }
                        }
                    }
                    Else
                    {
                        Store (0x00, ^OSTB)
                        Store (0x00, ^TPOS)
                    }
                }
            }

            Return (^OSTB)
        }

        Method (OSHT, 0, NotSerialized)
        {
            \_SB.OSTP ()
            Store (0x48, \_SB.PCI0.LPC0.BCMD)
            Store (Zero, \_SB.PCI0.LPC0.SMIC)
        }

        Method (SEQL, 2, Serialized)
        {
            Store (SizeOf (Arg0), Local0)
            Store (SizeOf (Arg1), Local1)
            If (LNotEqual (Local0, Local1))
            {
                Return (Zero)
            }

            Name (BUF0, Buffer (Local0) {})
            Store (Arg0, BUF0)
            Name (BUF1, Buffer (Local0) {})
            Store (Arg1, BUF1)
            Store (Zero, Local2)
            While (LLess (Local2, Local0))
            {
                Store (DerefOf (Index (BUF0, Local2)), Local3)
                Store (DerefOf (Index (BUF1, Local2)), Local4)
                If (LNotEqual (Local3, Local4))
                {
                    Return (Zero)
                }

                Increment (Local2)
            }

            Return (One)
        }
    }

    Mutex (MSMI, 0x07)
    Method (PHSR, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, \_SB.PCI0.LPC0.INF)
        Store (Arg0, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        Store (\_SB.PCI0.LPC0.INF, Local0)
        Release (MSMI)
        Return (Local0)
    }

    Method (HKEY, 1, NotSerialized)
    {
        PHSR (0x8A, Arg0)
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
            PHSR (0x8B, Arg0)
        }
    }

    Method (RBEC, 1, NotSerialized)
    {
        Return (PHSR (0x8C, Arg0))
    }

    Method (WBEC, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, \_SB.PCI0.LPC0.INF1)
        Store (Arg0, \_SB.PCI0.LPC0.INF)
        Store (0x8D, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        Release (MSMI)
    }

    Method (MBEC, 3, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg2, \_SB.PCI0.LPC0.INF2)
        Store (Arg1, \_SB.PCI0.LPC0.INF1)
        Store (Arg0, \_SB.PCI0.LPC0.INF)
        Store (0x8E, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
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
        CreateDWordField (B2ED, 0x00, OEAX)
        CreateDWordField (B2ED, 0x04, OEBX)
        CreateDWordField (B2ED, 0x08, OECX)
        CreateDWordField (B2ED, 0x0C, OEDX)
        CreateDWordField (B2ED, 0x10, OFLG)
        If (LEqual (\_SB.AMW0.WMID, 0x01))
        {
            CreateDWordField (Arg1, 0x10, DESI)
            CreateDWordField (Arg1, 0x14, DEDI)
            CreateDWordField (B2ED, 0x14, OESI)
            CreateDWordField (B2ED, 0x18, OEDI)
        }

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
        If (LEqual (\_SB.AMW0.WMID, 0x01))
        {
            Store (DESI, \_SB.PCI0.LPC0.WNVS)
            Store (DEDI, \_SB.PCI0.LPC0.WNVI)
        }

        Store (0x8F, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        Store (\_SB.PCI0.LPC0.WNVA, OEAX)
        Store (\_SB.PCI0.LPC0.WNVB, OEBX)
        Store (\_SB.PCI0.LPC0.WNVC, OECX)
        Store (\_SB.PCI0.LPC0.WNVD, OEDX)
        Store (\_SB.PCI0.LPC0.WFLG, OFLG)
        If (LEqual (\_SB.AMW0.WMID, 0x01))
        {
            Store (\_SB.PCI0.LPC0.WNVS, OESI)
            Store (\_SB.PCI0.LPC0.WNVI, OEDI)
        }

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
        Store (0x8F, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
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
        Store (0x89, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        CreateDWordField (B3ED, 0x00, B3R0)
        CreateDWordField (B3ED, 0x08, B3R1)
        CreateDWordField (B3ED, 0x10, B3R2)
        CreateDWordField (B3ED, 0x18, B3R3)
        If (LEqual (Arg0, 0x00))
        {
            Store (0x00, B3ED)
            Store (\_SB.PCI0.LPC0.WNVD, B3R0)
            Store (\_SB.PCI0.LPC0.WNVC, B3R1)
            Store (\_SB.PCI0.LPC0.WNVB, B3R2)
            Store (\_SB.PCI0.LPC0.WNVA, B3R3)
        }

        If (LOr (LEqual (Arg0, 0x01), LEqual (Arg0, 0x02)))
        {
            Store (0x00, B3ED)
            Store (\_SB.PCI0.LPC0.WNVA, B3R0)
            Store (\_SB.PCI0.LPC0.WNVD, B3R1)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x00, B3ED)
            Store (\_SB.PCI0.LPC0.WNVA, B3R0)
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
                    Store (\_SB.PCI0.LPC0.EC0.THS0, Local0)
                    Store (\_SB.PCI0.LPC0.EC0.KCSS, Local1)
                    Store (\_SB.PCI0.LPC0.EC0.KOSD, Local2)
                }
                Else
                {
                    Store (RBEC (0x92), Local0)
                    And (Local0, 0x01, Local1)
                    And (Local0, 0x08, Local2)
                    Store (RBEC (0xA8), Local0)
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
                    Store (0x20, \_SB.PCI0.LPC0.EC0.TIID)
                    Store (\_SB.PCI0.LPC0.EC0.TSC0, Local0)
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
        }

        ThermalZone (TZS1)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPC0.EC0.THS1, Local0)
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
                    Store (0x20, \_SB.PCI0.LPC0.EC0.TIID)
                    Store (\_SB.PCI0.LPC0.EC0.TSC1, Local0)
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

    Name (\GPIC, 0x00)
    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
        If (Arg0)
        {
            \_SB.PCI0.LPC0.DSPI ()
        }
    }

    Scope (\_SB)
    {
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
            Name (B2ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (B2ED, 0x00, BUID)
            Name (_WDG, Buffer (0x0118)
            {
                0x81, 0x17, 0xF4, 0xD9, 0x33, 0xF6, 0x00, 0x44, 
                0x93, 0x55, 0x60, 0x17, 0x70, 0xBE, 0xC5, 0x10, 
                0x41, 0x41,
                0x01, 0x00,

                0x1D, 0x37, 0xC3, 0x67, 0xA3, 0x95, 0x37, 0x4C,
                0xBB, 0x61, 0xDD, 0x47, 0xB4, 0x91, 0xDA, 0xAB,
                0x41, 0x42, 0x01, 0x02, 

                0xED, 0x16, 0x1F, 0x43, 0x2B, 0x0C, 0x4C, 0x44, 
                0xB2, 0x67, 0x27, 0xDE, 0xB1, 0x40, 0xCF, 0x9C, 
                0x41, 0x43, 0x01, 0x02,

                0x71, 0xBF, 0xD1, 0x40, 0x2D, 0xA8, 0x59, 0x4E,
                0xA1, 0x68, 0x39, 0x85, 0xE0, 0x3B, 0x2E, 0x87,
                0xB0, 0x00, 0x01, 0x08, 

                0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11, 
                0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 
                0x44, 0x44, 0x01, 0x00,

                0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E,
                0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A,
                0x43, 0x38, /* C8 */
                0x01,
                0x01, 

                0x58, 0xF2, 0xF4, 0x6A, 0x01, 0xB4, 0xFD, 0x42, 
                0xBE, 0x91, 0x3D, 0x4A, 0xC2, 0xD7, 0xC0, 0xD3, 
                0x43, 0x41, 0x01, 0x02,

                0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41,
                0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5,
                0xB2, 0x00, 0x01, 0x08,

                0x53, 0x44, 0x8C, 0xE7, 0x27, 0x02, 0x61, 0x48, 
                0x9E, 0xDE, 0xF5, 0x60, 0x0B, 0x4A, 0x3D, 0x39, 
                /* 00B0 */    0x43, 0x42, 0x01, 0x02, 0x7B, 0x4F, 0xE0, 0xAA, 
                /* 00B8 */    0xC5, 0xB3, 0x65, 0x48, 0x95, 0xD6, 0x9F, 0xAC, 
                /* 00C0 */    0x7F, 0xF3, 0xE9, 0x2B, 0x43, 0x43, 0x01, 0x02, 
                /* 00C8 */    0x79, 0x4C, 0xF9, 0xCF, 0x77, 0x6C, 0xF7, 0x4A, 
                /* 00D0 */    0xAC, 0x56, 0x7D, 0xD0, 0xCE, 0x01, 0xC9, 0x97, 
                /* 00D8 */    0x43, 0x44, 0x01, 0x02, 0xC5, 0x2E, 0x77, 0x79, 
                /* 00E0 */    0xB1, 0x04, 0xFD, 0x4B, 0x84, 0x3C, 0x61, 0xE7, 
                /* 00E8 */    0xF7, 0x7B, 0x6C, 0xC9, 0x43, 0x45, 0x01, 0x02, 
                /* 00F0 */    0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48, 
                /* 00F8 */    0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82, 
                /* 0100 */    0x43, 0x46, 0x01, 0x02, 0x91, 0x6B, 0x91, 0x36, 
                /* 0108 */    0x64, 0x1A, 0x83, 0x45, 0x84, 0xD0, 0x53, 0x83, 
                /* 0110 */    0x0F, 0xB9, 0x10, 0x8D, 0xB4, 0x00, 0x01, 0x08
            })
            Method (_WED, 1, NotSerialized)
            {
                Store (Arg0, DBGP)
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
                Store (0xAA, DBGP)
                Return (B1ED)
            }

            Method (WSAA, 2, NotSerialized)
            {
                Store (0xA1, DBGP)
                CreateDWordField (Arg1, 0x00, DDD0)
                If (LEqual (DDD0, 0x01))
                {
                    Add (DDD0, 0x02, DDD0)
                    Store (DDD0, Index (B1ED, 0x00))
                }
            }

            Method (WMAB, 3, NotSerialized)
            {
                Store (0xAB, DBGP)
                Store (0x01, WLMP)
                Store (0x00, WMID)
                Return (WH15 (Arg1, Arg2))
            }

            Method (WMAC, 3, NotSerialized)
            {
                Store (0xAC, DBGP)
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
            Name (C34F, 0x00)
            Name (SBTH, 0x00)
            Name (FIRE, 0x00)
            Name (CBE0, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (CBE0, 0x00, BER4)
            CreateWordField (CBE0, 0x00, BUF0)
            CreateWordField (CBE0, 0x02, BER2)
            Name (CBE1, Buffer (0x14)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (CBE1, 0x00, B1R0)
            CreateDWordField (CBE1, 0x04, B1R4)
            CreateDWordField (CBE1, 0x08, B1R8)
            CreateDWordField (CBE1, 0x0C, B1RC)
            OperationRegion (RAM, EmbeddedControl, 0x00, 0xFF)
            Field (RAM, 
            {
                0x11
                CMD0,   8, 
                        Offset (0x02), 
                NBID,   8, 
                        Offset (0x08), 
                DAT0,   8, 
                DAT1,   8, 
                    ,   2, 
                WLED,   2, 
                BLED,   2, 
                        Offset (0x51), 
                BLST,   1, 
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
                MSTP,   4, 
                        Offset (0x83), 
                CSTP,   4, 
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

            Field (RAM, 
            {
                0x11
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

            Field (RAM, 
            {
                0x11
                        Offset (0xE0), 
                BSDC,   16, 
                BSDV,   16, 
                BSSN,   16, 
                        Offset (0xEE), 
                BSCY,   16
            }

            Field (RAM, 
            {
                0x01
                        Offset (0xE2), 
                BSTF,   16, 
                BSTE,   16, 
                        Offset (0xEA), 
                BSMD,   16, 
                BSCC,   16, 
                BSME,   16
            }

            OperationRegion (PCNT, SystemIO, 0x8010, 0x04)
            Field (PCNT, 
            {
                0x01
                    ,   1, 
                TDTY,   3, 
                T_EN,   1, 
                    ,   12, 
                T_ST,   1
            }

            Method (WQC8, 1, NotSerialized)
            {
                Store (0xC8, DBGP)
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
                Store (0xCA, DBGP)
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
                        If (\_SB.PCI0.LPC0.EC0.BNVE)
                        {
                            HKEY (0x1C)
                        }
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

                If (LEqual (Arg1, 0x08))
                {
                    Store (0x01, BER2)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x09))
                {
                    Store (0x01, BER2)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0A))
                {
                    Store (0x01, BER2)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0B))
                {
                    Store (0x01, BER2)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0C))
                {
                    Store (0x01, BER2)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0D))
                {
                    Store (BLST, Local0)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }
            }

            Method (WMCB, 3, NotSerialized)
            {
                Store (0xCB, DBGP)
                CreateDWordField (Arg2, 0x00, CD04)
                CreateByteField (Arg2, 0x00, CD01)
                Store (0x00, BER2)
                If (LEqual (Arg1, 0x01))
                {
                    Store (SBTH, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    If (CD04)
                    {
                        Store (CD01, SBTH)
                    }
                    Else
                    {
                        Store (0x00, SBTH)
                    }

                    Store (0x00, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (0x01, BER2)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x04))
                {
                    Store (0x01, BER2)
                    Return (CBE0)
                }
            }

            Method (WMCC, 3, NotSerialized)
            {
                Store (0xCC, DBGP)
                Store (0x01, BER2)
                Return (CBE0)
            }

            Method (WMCD, 3, NotSerialized)
            {
                Store (0xCD, DBGP)
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

                If (LEqual (Arg1, 0x04))
                {
                    If (CD04)
                    {
                        Store (0x01, C34F)
                    }
                    Else
                    {
                        Store (0x00, C34F)
                    }

                    Store (0x00, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x05))
                {
                    Store (C34F, BUF0)
                    Return (CBE0)
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
                    Store (THS0, Local0)
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

                If (LEqual (Arg1, 0x0A))
                {
                    Store (0x01, BER2)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0B))
                {
                    CreateDWordField (Arg2, 0x00, CDR0)
                    CreateDWordField (Arg2, 0x04, CDR4)
                    Store (0x00, CBE1)
                    If (LEqual (CDR4, 0x00))
                    {
                        If (LEqual (CDR0, 0x00))
                        {
                            Store (0x01, B1RC)
                            Return (CBE1)
                        }

                        If (LEqual (CDR0, 0x01))
                        {
                            Store (0x0B, B1R8)
                            Store (0x06, B1R4)
                            Store (0x00, B1R0)
                            Return (CBE1)
                        }
                    }

                    If (LEqual (CDR4, 0x01))
                    {
                        If (LEqual (CDR0, 0x00))
                        {
                            Store (0x02, B1RC)
                            Return (CBE1)
                        }

                        If (LEqual (CDR0, 0x01))
                        {
                            Store (0x0B, B1R8)
                            Store (0x06, B1R4)
                            Store (0x02, B1R0)
                            Return (CBE1)
                        }

                        If (LEqual (CDR0, 0x02))
                        {
                            Store (0x0B, B1R8)
                            Store (0x06, B1R4)
                            Store (0x03, B1R0)
                            Return (CBE1)
                        }
                    }

                    If (LEqual (CDR4, 0x02))
                    {
                        If (LEqual (CDR0, 0x00))
                        {
                            Store (0x01, B1RC)
                            Return (CBE1)
                        }

                        If (LEqual (CDR0, 0x01))
                        {
                            Store (0x0B, B1R8)
                            Store (0x06, B1R4)
                            Store (0x04, B1R0)
                            Return (CBE1)
                        }
                    }

                    If (LEqual (CDR4, 0x03))
                    {
                        If (LEqual (CDR0, 0x00))
                        {
                            Store (0x01, B1RC)
                            Return (CBE1)
                        }

                        If (LEqual (CDR0, 0x01))
                        {
                            Store (0x02, B1R8)
                            Store (0x00, B1R4)
                            Store (0x00, B1R0)
                            Return (CBE1)
                        }
                    }

                    Return (CBE1)
                }
            }

            Method (WMCE, 3, NotSerialized)
            {
                Store (0xCE, DBGP)
                CreateDWordField (Arg2, 0x00, CD04)
                CreateByteField (Arg2, 0x00, CD01)
                If (LEqual (Arg1, 0x01))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSCM, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSBT, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSVO, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSCU, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSRC, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSFC, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSCY, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSDC, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSDV, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x05, NBID)
                    Store (BSMD, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSSN, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                If (LEqual (Arg1, 0x0D))
                {
                    Store (0x01, BER2)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0E))
                {
                    Store (0x01, BER2)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0F))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x05, NBID)
                    Store (BSTF, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
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

                    Acquire (\_SB.PCI0.LPC0.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x05, NBID)
                    Store (BSME, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x11))
                {
                    Store (0x00, BER2)
                    Store (0x0258, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x12))
                {
                    Store (0x00, BER2)
                    Store (0x21, BUF0)
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

                    If (LEqual (Arg0, 0x0D))
                    {
                        Store (0x0A00, Local0)
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

                If (LEqual (Local1, 0x0A00))
                {
                    Or (Local1, BLST, Local0)
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

                If (And (Local0, 0x40))
                {
                    Store (0x07, Local1)
                }

                If (LEqual (Local1, 0x00))
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
                Store (0xCF, DBGP)
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

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPC0.EC0.KLID, Local0)
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
                    Store (Arg0, \_SB.PCI0.LPC0.EC0.LIDW)
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
                0x06, 
                0x03
            })
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            Name (_PRW, Package (0x02)
            {
                0x06, 
                0x03
            })
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, 0x030AD041)
            Name (_ADR, 0x00)
            Name (_UID, 0x01)
            Name (_BBN, 0x00)
            Method (_OSC, 4, NotSerialized)
            {
                CreateDWordField (Arg3, 0x08, CDW3)
                And (CDW3, 0x1C, CDW3)
                Store (Arg3, Local0)
                Return (Local0)
            }

            Method (_INI, 0, NotSerialized)
            {
                \_SB.OSTP ()
            }

            OperationRegion (NBRV, PCI_Config, 0x08, 0x01)
            Field (NBRV, 
            {
                0x01
                PREV,   8
            }

            Method (NBR2, 0, NotSerialized)
            {
                If (And (PREV, 0xF0))
                {
                    Return (Ones)
                }
                Else
                {
                    Return (Zero)
                }
            }

            OperationRegion (NBBR, PCI_Config, 0x1C, 0x08)
            Field (NBBR, 
            {
                0x03
                BR3L,   32, 
                BR3H,   32
            }

            OperationRegion (NBBI, PCI_Config, 0x84, 0x04)
            Field (NBBI, 
            {
                0x03
                PARB,   32
            }

            OperationRegion (NBMS, PCI_Config, 0x60, 0x08)
            Field (NBMS, 
            {
                0x03
                MIDX,   32, 
                MIDR,   32
            }

            OperationRegion (NBGC, PCI_Config, 0x8C, 0x04)
            Field (NBGC, 
            {
                0x03
                GFXE,   1, 
                GFXI,   1
            }

            Mutex (NBMM, 0x00)
            Method (NBMR, 1, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Store (Local0, MIDX)
                Store (MIDR, Local0)
                Store (0x7F, MIDX)
                Release (NBMM)
                Return (Local0)
            }

            Method (NBMW, 2, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Or (Local0, 0x80, Local0)
                Store (Local0, MIDX)
                Store (Arg1, MIDR)
                Store (And (Local0, 0x7F, Local0), MIDX)
                Release (NBMM)
            }

            OperationRegion (NBXP, PCI_Config, 0xE0, 0x08)
            Field (NBXP, 
            {
                0x03
                NBXI,   32, 
                NBXD,   32
            }

            Mutex (NBXM, 0x00)
            Method (NBXR, 1, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI)
                Store (NBXD, Local0)
                Store (0x00, NBXI)
                Release (NBXM)
                Return (Local0)
            }

            Method (NBXW, 2, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI)
                Store (Arg1, NBXD)
                Store (0x00, NBXI)
                Release (NBXM)
            }

            Method (GFXM, 0, NotSerialized)
            {
                Store (NBMR (0x08), Local0)
                And (Local0, 0x0F, Local0)
                Return (Local0)
            }

            Method (GPPM, 0, NotSerialized)
            {
                Store (NBMR (0x31), Local0)
                And (Local0, 0x0F, Local0)
                Return (Local0)
            }

            Method (XPTR, 2, NotSerialized)
            {
                If (LAnd (LLess (Arg0, 0x02), LGreater (Arg0, 0x07)))
                {
                    Return (0x00)
                }
                Else
                {
                    Store (0x01, Local0)
                    If (LLess (Arg0, 0x04))
                    {
                        Add (Arg0, 0x02, Local1)
                    }
                    Else
                    {
                        Add (Arg0, 0x11, Local1)
                    }

                    ShiftLeft (Local0, Local1, Local0)
                    Store (NBMR (0x08), Local2)
                    If (Arg1)
                    {
                        And (Local2, Not (Local0), Local2)
                    }
                    Else
                    {
                        Or (Local2, Local0, Local2)
                    }

                    NBMW (0x08, Local2)
                    Return (Ones)
                }
            }

            Name (PX3L, 0x80000000)
            Name (PX3H, 0x80000000)
            Name (PX3S, 0x10000000)
            Name (PX3K, 0xF0000000)
            Mutex (BR3X, 0x00)
            Method (BR3M, 0, NotSerialized)
            {
                Store (PARB, Local0)
                ShiftRight (Local0, 0x10, Local0)
                And (Local0, 0x07, Local0)
                If (Local0)
                {
                    ShiftLeft (0x01, Local0, Local1)
                    Subtract (0x1000, Local1, Local1)
                    ShiftLeft (Local1, 0x14, Local1)
                    Store (Local1, PX3K)
                    ShiftRight (0x00100000, Local0, Local0)
                    Store (Local0, PX3S)
                }

                Acquire (BR3X, 0xFFFF)
                Store (NBMR (0x00), Local0)
                And (Local0, 0xFFFFFFF7, Local0)
                NBMW (0x00, Local0)
                Store (BR3L, Local0)
                And (Local0, PX3K, Local0)
                Store (Local0, PX3L)
                Store (BR3H, Local0)
                And (Local0, 0xFF, Local0)
                Store (Local0, PX3H)
                Store (NBMR (0x00), Local0)
                Or (Local0, 0x08, Local0)
                NBMW (0x00, Local0)
                Release (BR3X)
                Return (PX3L)
            }

            OperationRegion (K8ST, SystemMemory, 0x7FE94F74, 0x00000048)
            Field (K8ST, 
            {
                0x00
                C0_0,   16, 
                C2_0,   16, 
                C4_0,   16, 
                C6_0,   16, 
                C8_0,   16, 
                CA_0,   16, 
                CC_0,   16, 
                CE_0,   16, 
                D0_0,   16, 
                D2_0,   16, 
                D4_0,   16, 
                D6_0,   16, 
                D8_0,   16, 
                DA_0,   16, 
                DC_0,   16, 
                DE_0,   16, 
                E0_0,   16, 
                E2_0,   16, 
                E4_0,   16, 
                E6_0,   16, 
                E8_0,   16, 
                EA_0,   16, 
                EC_0,   16, 
                EE_0,   16, 
                F0_0,   16, 
                F2_0,   16, 
                F4_0,   16, 
                F6_0,   16, 
                F8_0,   16, 
                FA_0,   16, 
                FC_0,   16, 
                FE_0,   16, 
                TOML,   32, 
                TOMH,   32
            }

            Name (RSRC, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C2000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C6000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000C9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CA000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CE000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D2000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D6000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000D9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DA000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DE000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y10, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E2000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y11, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y12, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E6000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y13, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000E9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y14, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EA000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y15, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y16, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EE000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y17, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y18, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y19, AddressRangeMemory, TypeStatic)
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
                    0x00,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    0x00,, , TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                CreateBitField (RSRC, \_SB.PCI0._Y00._RW, C0RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y00._LEN, C0LN)
                Store (One, C0RW)
                Store (0x2000, C0LN)
                If (And (C0_0, 0x1818))
                {
                    Store (0x00, C0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y01._RW, C2RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y01._LEN, C2LN)
                Store (One, C2RW)
                Store (0x2000, C2LN)
                If (And (C2_0, 0x1818))
                {
                    Store (0x00, C2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y02._RW, C4RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y02._LEN, C4LN)
                Store (One, C4RW)
                Store (0x2000, C4LN)
                If (And (C4_0, 0x1818))
                {
                    Store (0x00, C4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y03._RW, C6RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y03._LEN, C6LN)
                Store (One, C6RW)
                Store (0x2000, C6LN)
                If (And (C6_0, 0x1818))
                {
                    Store (0x00, C6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y04._RW, C8RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y04._LEN, C8LN)
                Store (One, C8RW)
                Store (0x2000, C8LN)
                If (And (C8_0, 0x1818))
                {
                    Store (0x00, C8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y05._RW, CARW)
                CreateDWordField (RSRC, \_SB.PCI0._Y05._LEN, CALN)
                Store (One, CARW)
                Store (0x2000, CALN)
                If (And (CA_0, 0x1818))
                {
                    Store (0x00, CALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y06._RW, CCRW)
                CreateDWordField (RSRC, \_SB.PCI0._Y06._LEN, CCLN)
                Store (One, CCRW)
                Store (0x2000, CCLN)
                If (And (CC_0, 0x1818))
                {
                    Store (0x00, CCLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y07._RW, CERW)
                CreateDWordField (RSRC, \_SB.PCI0._Y07._LEN, CELN)
                Store (One, CERW)
                Store (0x2000, CELN)
                If (And (CE_0, 0x1818))
                {
                    Store (0x00, CELN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y08._RW, D0RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y08._LEN, D0LN)
                Store (One, D0RW)
                Store (0x2000, D0LN)
                If (And (D0_0, 0x1818))
                {
                    Store (0x00, D0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y09._RW, D2RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y09._LEN, D2LN)
                Store (One, D2RW)
                Store (0x2000, D2LN)
                If (And (D2_0, 0x1818))
                {
                    Store (0x00, D2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0A._RW, D4RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0A._LEN, D4LN)
                Store (One, D4RW)
                Store (0x2000, D4LN)
                If (And (D4_0, 0x1818))
                {
                    Store (0x00, D4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0B._RW, D6RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0B._LEN, D6LN)
                Store (One, D6RW)
                Store (0x2000, D6LN)
                If (And (D6_0, 0x1818))
                {
                    Store (0x00, D6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0C._RW, D8RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0C._LEN, D8LN)
                Store (One, D8RW)
                Store (0x2000, D8LN)
                If (And (D8_0, 0x1818))
                {
                    Store (0x00, D8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0D._RW, DARW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0D._LEN, DALN)
                Store (One, DARW)
                Store (0x2000, DALN)
                If (And (DA_0, 0x1818))
                {
                    Store (0x00, DALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0E._RW, DCRW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0E._LEN, DCLN)
                Store (One, DCRW)
                Store (0x2000, DCLN)
                If (And (DC_0, 0x1818))
                {
                    Store (0x00, DCLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0F._RW, DERW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0F._LEN, DELN)
                Store (One, DERW)
                Store (0x2000, DELN)
                If (And (DE_0, 0x1818))
                {
                    Store (0x00, DELN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y10._RW, E0RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y10._LEN, E0LN)
                Store (One, E0RW)
                Store (0x2000, E0LN)
                If (And (E0_0, 0x1818))
                {
                    Store (0x00, E0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y11._RW, E2RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y11._LEN, E2LN)
                Store (One, E2RW)
                Store (0x2000, E2LN)
                If (And (E2_0, 0x1818))
                {
                    Store (0x00, E2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y12._RW, E4RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y12._LEN, E4LN)
                Store (One, E4RW)
                Store (0x2000, E4LN)
                If (And (E4_0, 0x1818))
                {
                    Store (0x00, E4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y13._RW, E6RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y13._LEN, E6LN)
                Store (One, E6RW)
                Store (0x2000, E6LN)
                If (And (E6_0, 0x1818))
                {
                    Store (0x00, E6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y14._RW, E8RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y14._LEN, E8LN)
                Store (One, E8RW)
                Store (0x2000, E8LN)
                If (And (E8_0, 0x1818))
                {
                    Store (0x00, E8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y15._RW, EARW)
                CreateDWordField (RSRC, \_SB.PCI0._Y15._LEN, EALN)
                Store (One, EARW)
                Store (0x2000, EALN)
                If (And (EA_0, 0x1818))
                {
                    Store (0x00, EALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y16._RW, ECRW)
                CreateDWordField (RSRC, \_SB.PCI0._Y16._LEN, ECLN)
                Store (One, ECRW)
                Store (0x2000, ECLN)
                If (And (EC_0, 0x1818))
                {
                    Store (0x00, ECLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y17._RW, EERW)
                CreateDWordField (RSRC, \_SB.PCI0._Y17._LEN, EELN)
                Store (One, EERW)
                Store (0x2000, EELN)
                If (And (EE_0, 0x1818))
                {
                    Store (0x00, EELN)
                }

                CreateDWordField (RSRC, \_SB.PCI0._Y18._MIN, BT1S)
                CreateDWordField (RSRC, \_SB.PCI0._Y18._MAX, BT1M)
                CreateDWordField (RSRC, \_SB.PCI0._Y18._LEN, BT1L)
                CreateDWordField (RSRC, \_SB.PCI0._Y19._MIN, BT2S)
                CreateDWordField (RSRC, \_SB.PCI0._Y19._MAX, BT2M)
                CreateDWordField (RSRC, \_SB.PCI0._Y19._LEN, BT2L)
                Store (BR3M (), Local0)
                Store (PX3H, Local2)
                Store (PX3S, Local1)
                If (Local2)
                {
                    Store (0x00, Local1)
                    Store (TOML, Local0)
                }

                Store (TOML, BT1S)
                Store (Subtract (Local0, 0x01), BT1M)
                Subtract (Local0, TOML, BT1L)
                Store (Add (Local0, Local1), BT2S)
                Store (Add (Subtract (BT2M, BT2S), 0x01), BT2L)
                Return (RSRC)
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (MEM1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y1A)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y1B)
                })
                Method (_CRS, 0, NotSerialized)
                {
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._BAS, MB01)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._LEN, ML01)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1B._BAS, MB02)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1B._LEN, ML02)
                    If (GPIC)
                    {
                        Store (0xFEC00000, MB01)
                        Store (0xFEE00000, MB02)
                        Store (0x1000, ML01)
                        Store (0x1000, ML02)
                    }

                    Return (MEM1)
                }
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x09)
                    {
                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x00, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }
                    })
                }
                Else
                {
                    Return (Package (0x09)
                    {
                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x02, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x03, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }
                    })
                }
            }

            OperationRegion (BAR1, PCI_Config, 0x14, 0x04)
            Field (BAR1, 
            {
                0x01
                Z009,   32
            }

            Device (PB2)
            {
                Name (_ADR, 0x00020000)
                OperationRegion (PEX2, PCI_Config, 0x00, 0x0100)
                Field (PEX2, 
                {
                    0x00
                            Offset (0x68), 
                    PB2L,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x18, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00)
                    Name (SWIT, 0x01)
                    Name (CRTC, 0x01)
                    Name (LCDC, 0x01)
                    Name (TV0C, 0x00)
                    Name (CRTN, 0x01)
                    Name (LCDN, 0x01)
                    Name (TV0N, 0x00)
                    OperationRegion (DISV, PCI_Config, 0x00, 0x0100)
                    Field (DISV, 
                    {
                        0x00
                                Offset (0x68), 
                        DISL,   2
                    }

                    Method (VDEV, 0, NotSerialized)
                    {
                        GDST ()
                        If (LEqual (\VDSS, 0x00))
                        {
                            Store (0x00, Local0)
                            If (LEqual (CRTC, 0x01))
                            {
                                Store (0x02, Local0)
                            }

                            Increment (Local0)
                            If (LGreater (Local0, 0x04))
                            {
                                Store (0x01, Local0)
                            }

                            If (LAnd (Local0, 0x01))
                            {
                                Store (0x01, LCDN)
                            }

                            If (LAnd (Local0, 0x02))
                            {
                                Store (0x01, CRTN)
                            }

                            If (LAnd (Local0, 0x04))
                            {
                                Store (0x01, TV0N)
                            }
                        }

                        If (LEqual (\VDSS, 0x01))
                        {
                            Store (0x01, LCDN)
                            Store (0x00, CRTN)
                            Store (0x00, TV0N)
                        }

                        If (LEqual (\VDSS, 0x02))
                        {
                            Store (0x00, LCDN)
                            Store (0x01, CRTN)
                            Store (0x00, TV0N)
                        }

                        If (LEqual (\VDSS, 0x03))
                        {
                            Store (0x01, LCDN)
                            Store (0x01, CRTN)
                            Store (0x00, TV0N)
                        }

                        If (LEqual (\VDSS, 0x04))
                        {
                            Store (0x00, LCDN)
                            Store (0x00, CRTN)
                            Store (0x01, TV0N)
                        }

                        If (LEqual (\VDSS, 0x05))
                        {
                            Store (0x01, LCDN)
                            Store (0x00, CRTN)
                            Store (0x01, TV0N)
                        }
                    }

                    Method (GDST, 0, NotSerialized)
                    {
                        Store (0x00, CRTC)
                        Store (0x00, LCDC)
                        Store (0x00, TV0C)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (0x02, \_SB.PCI0.PB2.PB2L)
                        Store (0x02, \_SB.PCI0.PB2.VGA.DISL)
                        VDEV ()
                        Store (Arg0, Local0)
                        And (Local0, 0x01, SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x0100, 
                            0x0200, 
                            0x0110
                        })
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (CRTC)
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
                            If (CRTN)
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
                        Name (_ADR, 0x0110)
                        Name (BCLP, Package (0x0C)
                        {
                            0x64, 
                            0x3C, 
                            0x0A, 
                            0x14, 
                            0x1E, 
                            0x28, 
                            0x32, 
                            0x3C, 
                            0x46, 
                            0x50, 
                            0x5A, 
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
                                    If (LEqual (0x0B, Local1))
                                    {
                                        Store (0x00, Local0)
                                    }
                                }
                            }

                            Decrement (Local1)
                            Decrement (Local1)
                            If (\_SB.PCI0.LPC0.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPC0.EC0.ACST)
                                {
                                    Store (Local1, \_SB.PCI0.LPC0.EC0.BNAC)
                                }
                                Else
                                {
                                    Store (Local1, \_SB.PCI0.LPC0.EC0.BNDC)
                                }
                            }
                            Else
                            {
                                Store (Local1, \_SB.PCI0.LPC0.EC0.BNAC)
                            }

                            If (\_SB.PCI0.LPC0.EC0.BNVE)
                            {
                                HKEY (0x1C)
                            }

                            If (\_SB.AMW0.FIRE)
                            {
                                \_SB.AMW0.ACRN (0x03)
                            }
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            If (\_SB.PCI0.LPC0.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPC0.EC0.ACST)
                                {
                                    Store (\_SB.PCI0.LPC0.EC0.BNAC, Local1)
                                }
                                Else
                                {
                                    Store (\_SB.PCI0.LPC0.EC0.BNDC, Local1)
                                }
                            }
                            Else
                            {
                                Store (\_SB.PCI0.LPC0.EC0.BNAC, Local1)
                            }

                            Increment (Local1)
                            Increment (Local1)
                            Store (DerefOf (Index (BCLP, Local1)), Local0)
                            Return (Local0)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            If (LCDC)
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
                            If (LCDN)
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
                            If (TV0C)
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
                            If (TV0N)
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
                                Return (\_SB.PCI0.AGP.VGA.DDC3)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Concatenate (\_SB.PCI0.AGP.VGA.DDC3, \_SB.PCI0.AGP.VGA.DDC0, Local0)
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
                        /* 0008 */    0x0D, 0xAF, 0x00, 0x15, 0x00, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x02, 0x0D, 0x01, 0x03, 0x80, 0x21, 0x15, 0x78, 
                        /* 0018 */    0x0A, 0xCA, 0xA5, 0x95, 0x5B, 0x4C, 0x95, 0x27, 
                        /* 0020 */    0x22, 0x50, 0x54, 0x00, 0x00, 0x00, 0x01, 0x01, 
                        /* 0028 */    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 
                        /* 0030 */    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xBC, 0x1B, 
                        /* 0038 */    0x00, 0xA0, 0x50, 0x20, 0x17, 0x30, 0x30, 0x20, 
                        /* 0040 */    0x26, 0x00, 0x4B, 0xCF, 0x10, 0x00, 0x00, 0x1C, 
                        /* 0048 */    0x00, 0x00, 0x00, 0xFD, 0x00, 0x3B, 0x3D, 0x30, 
                        /* 0050 */    0x32, 0x08, 0x00, 0x0A, 0x20, 0x20, 0x20, 0x20, 
                        /* 0058 */    0x20, 0x20, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x4E, 
                        /* 0060 */    0x31, 0x35, 0x34, 0x49, 0x31, 0x0A, 0x20, 0x20, 
                        /* 0068 */    0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFC, 
                        /* 0070 */    0x00, 0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x20, 0x4C, 
                        /* 0078 */    0x43, 0x44, 0x0A, 0x20, 0x20, 0x20, 0x00, 0x98
                    })
                    Name (ATIB, Buffer (0x0100) {})
                    Method (XTIF, 2, Serialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Return (AF00 ())
                        }

                        If (LEqual (Arg0, 0x01))
                        {
                            Return (AF01 ())
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Return (AF02 ())
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            Return (AF05 ())
                        }

                        If (LEqual (Arg0, 0x06))
                        {
                            Return (AF06 (DerefOf (Index (Arg1, 0x03))))
                        }

                        If (LEqual (Arg0, 0x07))
                        {
                            Return (AF07 ())
                        }

                        If (LEqual (Arg0, 0x08))
                        {
                            Return (AF08 (DerefOf (Index (Arg1, 0x02))))
                        }
                        Else
                        {
                            CreateWordField (ATIB, 0x00, SSZE)
                            CreateWordField (ATIB, 0x02, VERN)
                            CreateDWordField (ATIB, 0x04, NMSK)
                            CreateDWordField (ATIB, 0x08, SFUN)
                            Store (0x00, SSZE)
                            Store (0x00, VERN)
                            Store (0x00, NMSK)
                            Store (0x00, SFUN)
                            Return (ATIB)
                        }
                    }

                    Method (AF00, 0, NotSerialized)
                    {
                        Store (0xF0, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        Store (0x0C, SSZE)
                        Store (0x01, VERN)
                        Store (0x11, NMSK)
                        Store (NMSK, MSKN)
                        Store (0xF3, SFUN)
                        Return (ATIB)
                    }

                    Method (AF01, 0, NotSerialized)
                    {
                        Store (0xF1, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, VMSK)
                        CreateDWordField (ATIB, 0x06, FLGS)
                        Store (0x0A, SSZE)
                        Store (0x03, VMSK)
                        Store (0x01, FLGS)
                        Return (ATIB)
                    }

                    Name (PSBR, Buffer (0x04)
                    {
                        0x00, 0x00, 0x00, 0x00
                    })
                    Name (MSKN, 0x00)
                    Name (SEXM, 0x00)
                    Name (STHG, 0x00)
                    Name (STHI, 0x00)
                    Name (SFPG, 0x00)
                    Name (SFPI, 0x00)
                    Name (SSPS, 0x00)
                    Name (SSDM, 0x0A)
                    Name (SCDY, 0x00)
                    Name (SACT, Buffer (0x05)
                    {
                        0x01, 0x02, 0x08, 0x03, 0x09
                    })
                    Method (AF02, 0, NotSerialized)
                    {
                        Store (0xF2, DBGP)
                        CreateBitField (PSBR, 0x00, PDSW)
                        CreateBitField (PSBR, 0x01, PEXM)
                        CreateBitField (PSBR, 0x02, PTHR)
                        CreateBitField (PSBR, 0x03, PFPS)
                        CreateBitField (PSBR, 0x04, PSPS)
                        CreateBitField (PSBR, 0x05, PDCC)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, PSBI)
                        CreateByteField (ATIB, 0x06, EXPM)
                        CreateByteField (ATIB, 0x07, THRM)
                        CreateByteField (ATIB, 0x08, THID)
                        CreateByteField (ATIB, 0x09, FPWR)
                        CreateByteField (ATIB, 0x0A, FPID)
                        CreateByteField (ATIB, 0x0B, SPWR)
                        Store (0x0C, SSZE)
                        Store (PSBR, PSBI)
                        If (PDSW)
                        {
                            Store (0x82, DBGP)
                            Store (Zero, PDSW)
                        }

                        If (PEXM)
                        {
                            Store (SEXM, EXPM)
                            Store (Zero, SEXM)
                            Store (Zero, PEXM)
                        }

                        If (PTHR)
                        {
                            Store (STHG, THRM)
                            Store (STHI, THID)
                            Store (Zero, STHG)
                            Store (Zero, STHI)
                            Store (Zero, PTHR)
                        }

                        If (PFPS)
                        {
                            Store (SFPG, FPWR)
                            Store (SFPI, FPWR)
                            Store (Zero, SFPG)
                            Store (Zero, SFPI)
                            Store (Zero, PFPS)
                        }

                        If (PSPS)
                        {
                            Store (SSPS, SPWR)
                            Store (Zero, SSPS)
                            Store (Zero, PSPS)
                        }

                        Return (ATIB)
                    }

                    Method (AF05, 0, NotSerialized)
                    {
                        Store (0xF5, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateByteField (ATIB, 0x02, TSEF)
                        CreateByteField (ATIB, 0x03, TVIF)
                        Store (0x04, SSZE)
                        Store (0x00, TSEF)
                        Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                        Store (0x95, \_SB.PCI0.LPC0.BCMD)
                        Store (0x05, \_SB.PCI0.LPC0.DID)
                        Store (ATIB, \_SB.PCI0.LPC0.INFO)
                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                        CreateByteField (\_SB.PCI0.LPC0.INFO, 0x03, TVII)
                        Store (TVII, TVIF)
                        Release (\_SB.PCI0.LPC0.PSMX)
                        Return (ATIB)
                    }

                    Method (AF06, 1, NotSerialized)
                    {
                        Store (0xF6, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateByteField (ATIB, 0x02, TSEF)
                        CreateByteField (ATIB, 0x03, TVIF)
                        Store (0x04, SSZE)
                        Store (0x00, TSEF)
                        Store (Arg0, TVIF)
                        Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                        Store (0x95, \_SB.PCI0.LPC0.BCMD)
                        Store (0x06, \_SB.PCI0.LPC0.DID)
                        Store (ATIB, \_SB.PCI0.LPC0.INFO)
                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                        Release (\_SB.PCI0.LPC0.PSMX)
                    }

                    Method (AF07, 0, NotSerialized)
                    {
                        Store (0xF7, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateByteField (ATIB, 0x02, XMOD)
                        Store (0x03, SSZE)
                        Store (0x00, XMOD)
                        Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                        Store (0x95, \_SB.PCI0.LPC0.BCMD)
                        Store (0x07, \_SB.PCI0.LPC0.DID)
                        Store (ATIB, \_SB.PCI0.LPC0.INFO)
                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                        CreateByteField (\_SB.PCI0.LPC0.INFO, 0x02, PMOD)
                        Store (PMOD, XMOD)
                        Release (\_SB.PCI0.LPC0.PSMX)
                        Return (ATIB)
                    }

                    Method (AF08, 1, NotSerialized)
                    {
                        Store (0xF8, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateByteField (ATIB, 0x02, XMOD)
                        Store (0x03, SSZE)
                        Store (Arg0, XMOD)
                        Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                        Store (0x95, \_SB.PCI0.LPC0.BCMD)
                        Store (0x08, \_SB.PCI0.LPC0.DID)
                        Store (ATIB, \_SB.PCI0.LPC0.INFO)
                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                        Release (\_SB.PCI0.LPC0.PSMX)
                    }

                    Method (AFN1, 1, Serialized)
                    {
                        If (And (MSKN, 0x02))
                        {
                            Store (Arg0, Local0)
                            And (Local0, 0x03, Local0)
                            Store (Local0, SEXM)
                            CreateBitField (PSBR, 0x01, PEXM)
                            Store (One, PEXM)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN2, 2, Serialized)
                    {
                        If (And (MSKN, 0x04))
                        {
                            Store (Arg0, Local0)
                            Store (Local0, STHI)
                            Store (Arg1, Local0)
                            Store (And (Local0, 0x03, Local0), STHG)
                            CreateBitField (PSBR, 0x02, PTHS)
                            Store (One, PTHS)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN5, 0, Serialized)
                    {
                        If (And (MSKN, 0x20))
                        {
                            CreateBitField (PSBR, 0x05, PDCC)
                            Store (One, PDCC)
                            Notify (VGA, 0x81)
                        }
                    }
                }
            }

            Device (PB3)
            {
                Name (_ADR, 0x00030000)
                Name (_PRW, Package (0x02)
                {
                    0x18, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (PB4)
            {
                Name (_ADR, 0x00040000)
                Name (_PRW, Package (0x02)
                {
                    0x18, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (PB5)
            {
                Name (_ADR, 0x00050000)
                Name (_PRW, Package (0x02)
                {
                    0x18, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (PB6)
            {
                Name (_ADR, 0x00060000)
                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, 
                {
                    0x01
                            Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                            Offset (0x1A), 
                    SLST,   16
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, 
                {
                    0x01
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (XPEX, SystemMemory, 0xE0030100, 0x0100)
                Field (XPEX, 
                {
                    0x03
                            Offset (0x40), 
                    ECPH,   32, 
                            Offset (0x58), 
                    VC02,   32, 
                    VC0S,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    If (\_SB.PCI0.NBR2 ())
                    {
                        If (And (VC02, 0x00020000))
                        {
                            Store (Ones, Local0)
                        }
                    }
                    Else
                    {
                        If (And (VC0S, 0x02))
                        {
                            Store (Ones, Local0)
                        }
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (0x00, XPIR)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (0x00, XPIR)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, Not (0x07), Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Store (0x4040, Local1)
                    Store (\_SB.PCI0.NBXR (0x00010065), Local2)
                    If (Arg0)
                    {
                        And (Local2, Not (Local1), Local2)
                    }
                    Else
                    {
                        Or (Local2, Local1, Local2)
                    }

                    \_SB.PCI0.NBXW (0x00010065, Local2)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, Not (0x20), Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (0x01, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (0x01)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (0x00, Local2)
                        }
                    }

                    And (Local0, Not (0x20), Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Device (NCRD)
                {
                    Name (_ADR, 0x00)
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x08)
                    Field (PCFG, 
                    {
                        0x03
                        DVID,   32, 
                        PCMS,   32
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x18, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }
            }

            Scope (\_GPE)
            {
                Method (_L18, 0, NotSerialized)
                {
                    Notify (\_SB.PCI0.PB2, 0x02)
                    Notify (\_SB.PCI0.PB4, 0x02)
                    Notify (\_SB.PCI0.PB5, 0x02)
                    Notify (\_SB.PCI0.PB6, 0x02)
                }

                Method (BL18, 0, NotSerialized)
                {
                    Notify (\_SB.PCI0.PB2, 0x02)
                    Notify (\_SB.PCI0.PB4, 0x02)
                    Notify (\_SB.PCI0.PB5, 0x02)
                }
            }

            Device (OHC1)
            {
                Name (_ADR, 0x00130000)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130001)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (OHC3)
            {
                Name (_ADR, 0x00130002)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (OHC4)
            {
                Name (_ADR, 0x00130003)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (OHC5)
            {
                Name (_ADR, 0x00130004)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (EHCI)
            {
                Name (_ADR, 0x00130005)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (SATA)
            {
                Name (_ADR, 0x00120000)
                Name (B5EN, 0x00)
                Name (BA_5, 0x00)
                Name (SBAR, 0xF0609000)
                OperationRegion (SATX, PCI_Config, 0x00, 0x28)
                Field (SATX, 
                {
                    0x00
                    VIDI,   32, 
                            Offset (0x24), 
                    BA05,   32
                }

                Method (GBAA, 0, Serialized)
                {
                    Store (BA05, BA_5)
                    If (LEqual (BA_5, 0xFFFFFFFF))
                    {
                        Store (0x00, B5EN)
                        Return (SBAR)
                    }
                    Else
                    {
                        Store (0x01, B5EN)
                        Return (BA_5)
                    }
                }

                OperationRegion (BAR5, SystemMemory, GBAA (), 0x1000)
                Field (BAR5, 
                {
                    0x00
                            Offset (0x120), 
                        ,   7, 
                    PMBY,   1, 
                            Offset (0x128), 
                    PMS0,   4, 
                            Offset (0x129), 
                    PMS1,   4, 
                            Offset (0x12C), 
                    DET0,   4, 
                            Offset (0x130), 
                            Offset (0x132), 
                    PRC0,   1, 
                            Offset (0x1A0), 
                        ,   7, 
                    SMBY,   1, 
                            Offset (0x1A8), 
                    SMS0,   4, 
                            Offset (0x1A9), 
                    SMS1,   4, 
                            Offset (0x1AC), 
                    DET1,   4, 
                            Offset (0x1B0), 
                            Offset (0x1B2), 
                    PRC1,   1, 
                            Offset (0x220), 
                        ,   7, 
                    PSBY,   1, 
                            Offset (0x228), 
                    PSS0,   4, 
                            Offset (0x229), 
                    PSS1,   4, 
                            Offset (0x22C), 
                    DET2,   4, 
                            Offset (0x230), 
                            Offset (0x232), 
                    PRC2,   1, 
                            Offset (0x2A0), 
                        ,   7, 
                    SSBY,   1, 
                            Offset (0x2A8), 
                    SSS0,   4, 
                            Offset (0x2A9), 
                    SSS1,   4, 
                            Offset (0x2AC), 
                    DET3,   4, 
                            Offset (0x2B0), 
                            Offset (0x2B2), 
                    PRC3,   1
                }

                Method (_INI, 0, NotSerialized)
                {
                    GBAA ()
                    \_GPE._L1F ()
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x1F, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SPTM)
                    }

                    Name (PRIS, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        GBAA ()
                        If (LAnd (LOr (LEqual (TPOS, 0x40), LEqual (TPOS, 0x04)), \_SB.PCI0.SATA.B5EN))
                        {
                            If (\_SB.PCI0.SATA.PMS1)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (\_SB.PCI0.SATA.PMBY, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }

                            If (\_SB.PCI0.SATA.PSS1)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (\_SB.PCI0.SATA.PSBY, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Store (0x00, PRIS)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, PRIS)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        Return (PRIS)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (Not (LEqual (\_SB.PCI0.SATA.PMS1, 0x00)))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Name (S12P, 0x00)
                        Method (_PS0, 0, NotSerialized)
                        {
                            GBAA ()
                            If (LAnd (LAnd (LNotEqual (TPOS, 0x40), LNotEqual (TPOS, 
                                0x04)), \_SB.PCI0.SATA.B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (\_SB.PCI0.SATA.PMBY, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }

                            Store (0x00, S12P)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, S12P)
                        }

                        Method (_PSC, 0, NotSerialized)
                        {
                            Return (S12P)
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (Not (LEqual (\_SB.PCI0.SATA.SMS1, 0x00)))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Name (S12P, 0x00)
                        Method (_PS0, 0, NotSerialized)
                        {
                            GBAA ()
                            If (LAnd (LAnd (LNotEqual (TPOS, 0x40), LNotEqual (TPOS, 
                                0x04)), \_SB.PCI0.SATA.B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (\_SB.PCI0.SATA.PSBY, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }

                            Store (0x00, S12P)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, S12P)
                        }

                        Method (_PSC, 0, NotSerialized)
                        {
                            Return (S12P)
                        }

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

                Device (SECD)
                {
                    Name (_ADR, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (Z008)
                    }
                }
            }

            Scope (\_GPE)
            {
                Method (_L1F, 0, NotSerialized)
                {
                    \_SB.PCI0.SATA.GBAA ()
                    If (\_SB.PCI0.SATA.B5EN)
                    {
                        If (\_SB.PCI0.SATA.PRC0)
                        {
                            If (Not (LEqual (\_SB.PCI0.SATA.PMS1, 0x00)))
                            {
                                Sleep (0x1E)
                            }

                            Notify (\_SB.PCI0.SATA.PRID.P_D0, 0x01)
                            Store (One, \_SB.PCI0.SATA.PRC0)
                        }

                        If (\_SB.PCI0.SATA.PRC2)
                        {
                            If (Not (LEqual (\_SB.PCI0.SATA.PSS1, 0x00)))
                            {
                                Sleep (0x1E)
                            }

                            Notify (\_SB.PCI0.SATA.PRID.P_D1, 0x01)
                            Store (One, \_SB.PCI0.SATA.PRC2)
                        }
                    }
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x00140000)
                OperationRegion (Z00A, PCI_Config, 0x08, 0x0100)
                Field (Z00A, 
                {
                    0x01
                    RVID,   8, 
                            Offset (0x0C), 
                    HPBS,   32, 
                            Offset (0x5C), 
                        ,   10, 
                    HPET,   1, 
                            Offset (0xF0), 
                    EIDX,   8, 
                            Offset (0xF4), 
                    EDAT,   32
                }

                OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
                Field (PMIO, 
                {
                    0x01
                    INPM,   8, 
                    DAPM,   8
                }

                IndexField (INPM, DAPM, 
                {
                    0x01
                        ,   1, 
                    TM1E,   1, 
                    TM2E,   1, 
                            Offset (0x01), 
                        ,   1, 
                    TM1S,   1, 
                    TM2S,   1, 
                            Offset (0x02), 
                        ,   1, 
                    IR9E,   1, 
                            Offset (0x04), 
                        ,   7, 
                    SLPS,   1, 
                        ,   1, 
                    IR9S,   1, 
                            Offset (0x10), 
                        ,   6, 
                    PWDE,   1, 
                            Offset (0x1C), 
                        ,   3, 
                    MKME,   1, 
                    PI3E,   1, 
                    PI2E,   1, 
                    PI1E,   1, 
                    PI0E,   1, 
                        ,   3, 
                    MKMS,   1, 
                    PI3S,   1, 
                    PI2S,   1, 
                    PI1S,   1, 
                    PI0S,   1, 
                            Offset (0x20), 
                    P1EB,   16, 
                            Offset (0x36), 
                        ,   6, 
                    GE6C,   1, 
                    GE7C,   1, 
                        ,   4, 
                    GM1C,   1, 
                    GM2C,   1, 
                    GM3C,   1, 
                            Offset (0x38), 
                        ,   1, 
                    GM4C,   1, 
                    GM5C,   1, 
                        ,   1, 
                    GM6C,   1, 
                            Offset (0x3A), 
                        ,   4, 
                    GM1S,   1, 
                    GM2S,   1, 
                    GM3S,   1, 
                            Offset (0x3B), 
                        ,   1, 
                    GM4S,   1, 
                    GM5S,   1, 
                        ,   1, 
                    GM6S,   1, 
                            Offset (0x50), 
                    C4C3,   1, 
                            Offset (0x55), 
                    SPRE,   1, 
                        ,   1, 
                        ,   1, 
                    EPNM,   1, 
                    DPPF,   1, 
                    FNGS,   1, 
                            Offset (0x65), 
                        ,   4, 
                    RS3U,   1, 
                    RSTU,   1, 
                            Offset (0x66), 
                    USBB,   8, 
                            Offset (0x68), 
                        ,   3, 
                    TPDE,   1, 
                        ,   1, 
                            Offset (0x92), 
                        ,   6, 
                    GE6S,   1, 
                    GE7S,   1, 
                            Offset (0x96), 
                    GP8I,   1, 
                    GP9I,   1, 
                            Offset (0x9A), 
                        ,   7, 
                    HECO,   1, 
                            Offset (0xA8), 
                    PI4E,   1, 
                    PI5E,   1, 
                    PI6E,   1, 
                    PI7E,   1, 
                            Offset (0xA9), 
                    PI4S,   1, 
                    PI5S,   1, 
                    PI6S,   1, 
                    PI7S,   1
                }

                OperationRegion (P1E0, SystemIO, P1EB, 0x04)
                Field (P1E0, 
                {
                    0x01
                        ,   14, 
                    PEWS,   1, 
                    WSTA,   1, 
                        ,   14, 
                    PEWD,   1
                }

                OperationRegion (GPIO, PCI_Config, 0x00, 0x0100)
                Field (GPIO, 
                {
                    0x00
                            Offset (0x50), 
                    G49O,   1, 
                    G50O,   1, 
                    G51O,   1, 
                    G52O,   1, 
                    G49E,   1, 
                    G50E,   1, 
                    G51E,   1, 
                    G52E,   1, 
                            Offset (0x56), 
                        ,   3, 
                    G64O,   1, 
                        ,   3, 
                    G64E,   1, 
                            Offset (0x7E), 
                        ,   1, 
                    G66O,   1, 
                        ,   3, 
                    G66E,   1, 
                            Offset (0x7F), 
                        ,   1, 
                    G66S,   1, 
                            Offset (0x80), 
                        ,   3, 
                    G03O,   1, 
                        ,   3, 
                    G03E,   1, 
                        ,   3, 
                    G03S,   1, 
                            Offset (0x82), 
                    G13O,   1, 
                        ,   3, 
                    G13E,   1, 
                            Offset (0xA6), 
                        ,   3, 
                    G48O,   1, 
                        ,   3, 
                    G48E,   1, 
                            Offset (0xA8), 
                        ,   1, 
                    G05O,   1, 
                        ,   1, 
                    G07O,   1, 
                    G08O,   1, 
                    G09O,   1, 
                            Offset (0xA9), 
                        ,   1, 
                    G05E,   1, 
                        ,   1, 
                    G07E,   1, 
                    G08E,   1, 
                    G09E,   1, 
                            Offset (0xAA), 
                        ,   3, 
                    G07S,   1
                }

                Method (TRMD, 0, NotSerialized)
                {
                    Store (Zero, SPRE)
                    Store (Zero, TPDE)
                }

                Method (HTCD, 0, NotSerialized)
                {
                    Store (Zero, PI2E)
                    Store (Zero, TM2E)
                    Store (PI2S, PI2S)
                    Store (TM2S, TM2S)
                }
            }

            Device (IDE)
            {
                Name (_ADR, 0x00140001)
                Name (UDMT, Package (0x08)
                {
                    0x78, 
                    0x5A, 
                    0x3C, 
                    0x2D, 
                    0x1E, 
                    0x14, 
                    0x0F, 
                    0x00
                })
                Name (PIOT, Package (0x06)
                {
                    0x0258, 
                    0x0186, 
                    0x010E, 
                    0xB4, 
                    0x78, 
                    0x00
                })
                Name (PITR, Package (0x06)
                {
                    0x99, 
                    0x47, 
                    0x34, 
                    0x22, 
                    0x20, 
                    0x99
                })
                Name (MDMT, Package (0x04)
                {
                    0x01E0, 
                    0x96, 
                    0x78, 
                    0x00
                })
                Name (MDTR, Package (0x04)
                {
                    0x77, 
                    0x21, 
                    0x20, 
                    0xFF
                })
                OperationRegion (IDE, PCI_Config, 0x40, 0x20)
                Field (IDE, 
                {
                    0x02
                    PPIT,   16, 
                    SPIT,   16, 
                    PMDT,   16, 
                    SMDT,   16, 
                    PPIC,   8, 
                    SPIC,   8, 
                    PPIM,   8, 
                    SPIM,   8, 
                            Offset (0x14), 
                    PUDC,   2, 
                    SUDC,   2, 
                            Offset (0x16), 
                    PUDM,   8, 
                    SUDM,   8
                }

                Method (ATPI, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    And (Local0, 0xFF, Local0)
                    Or (Local0, 0x41544900, Local0)
                    Store (Local0, \_SB.PCI0.LPC0.INFO)
                }

                Method (GETT, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F), Local0)
                    Store (ShiftRight (Arg0, 0x04), Local1)
                    Return (Multiply (0x1E, Add (Add (Local0, 0x01), Add (Local1, 
                        0x01))))
                }

                Method (GTM, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x00, PIT1)
                    CreateByteField (Arg0, 0x01, PIT0)
                    CreateByteField (Arg0, 0x02, MDT1)
                    CreateByteField (Arg0, 0x03, MDT0)
                    CreateByteField (Arg0, 0x04, PICX)
                    CreateByteField (Arg0, 0x05, UDCX)
                    CreateByteField (Arg0, 0x06, UDMX)
                    Name (BUF, Buffer (0x14)
                    {
                        /* 0000 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0008 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0010 */    0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (BUF, 0x00, PIO0)
                    CreateDWordField (BUF, 0x04, DMA0)
                    CreateDWordField (BUF, 0x08, PIO1)
                    CreateDWordField (BUF, 0x0C, DMA1)
                    CreateDWordField (BUF, 0x10, FLAG)
                    If (And (PICX, 0x01))
                    {
                        Return (BUF)
                    }

                    Store (GETT (PIT0), PIO0)
                    Store (GETT (PIT1), PIO1)
                    If (And (UDCX, 0x01))
                    {
                        Or (FLAG, 0x01, FLAG)
                        Store (DerefOf (Index (^UDMT, And (UDMX, 0x0F))), DMA0)
                    }
                    Else
                    {
                        Store (GETT (MDT0), DMA0)
                    }

                    If (And (UDCX, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                        Store (DerefOf (Index (^UDMT, ShiftRight (UDMX, 0x04))), DMA1)
                    }
                    Else
                    {
                        Store (GETT (MDT1), DMA1)
                    }

                    Or (FLAG, 0x1A, FLAG)
                    Return (BUF)
                }

                Method (STM, 3, NotSerialized)
                {
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Name (BUF, Buffer (0x07)
                    {
                        0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                    })
                    CreateByteField (BUF, 0x00, PIT1)
                    CreateByteField (BUF, 0x01, PIT0)
                    CreateByteField (BUF, 0x02, MDT1)
                    CreateByteField (BUF, 0x03, MDT0)
                    CreateByteField (BUF, 0x04, PIMX)
                    CreateByteField (BUF, 0x05, UDCX)
                    CreateByteField (BUF, 0x06, UDMX)
                    Store (Match (^PIOT, MLE, PIO0, MTR, 0x00, 0x00), Local0)
                    Divide (Local0, 0x05, Local0)
                    Store (Match (^PIOT, MLE, PIO1, MTR, 0x00, 0x00), Local1)
                    Divide (Local1, 0x05, Local1)
                    Store (Or (ShiftLeft (Local1, 0x04), Local0), PIMX)
                    Store (DerefOf (Index (^PITR, Local0)), PIT0)
                    Store (DerefOf (Index (^PITR, Local1)), PIT1)
                    If (And (FLAG, 0x01))
                    {
                        Store (Match (^UDMT, MLE, DMA0, MTR, 0x00, 0x00), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, Local0, UDMX)
                        Or (UDCX, 0x01, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (Match (^MDMT, MLE, DMA0, MTR, 0x00, 0x00), Local0)
                            Store (DerefOf (Index (^MDTR, Local0)), MDT0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (^UDMT, MLE, DMA1, MTR, 0x00, 0x00), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, ShiftLeft (Local0, 0x04), UDMX)
                        Or (UDCX, 0x02, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA1, 0xFFFFFFFF))
                        {
                            Store (Match (^MDMT, MLE, DMA1, MTR, 0x00, 0x00), Local0)
                            Store (DerefOf (Index (^MDTR, Local0)), MDT1)
                        }
                    }

                    Return (BUF)
                }

                Method (GTF, 2, NotSerialized)
                {
                    CreateByteField (Arg1, 0x00, MDT1)
                    CreateByteField (Arg1, 0x01, MDT0)
                    CreateByteField (Arg1, 0x02, PIMX)
                    CreateByteField (Arg1, 0x03, UDCX)
                    CreateByteField (Arg1, 0x04, UDMX)
                    If (LEqual (Arg0, 0xA0))
                    {
                        Store (And (PIMX, 0x0F), Local0)
                        Store (MDT0, Local1)
                        And (UDCX, 0x01, Local2)
                        Store (And (UDMX, 0x0F), Local3)
                    }
                    Else
                    {
                        Store (ShiftRight (PIMX, 0x04), Local0)
                        Store (MDT1, Local1)
                        And (UDCX, 0x02, Local2)
                        Store (ShiftRight (UDMX, 0x04), Local3)
                    }

                    Name (BUF, Buffer (0x0E)
                    {
                        /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x03, 
                        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF
                    })
                    CreateByteField (BUF, 0x01, PMOD)
                    CreateByteField (BUF, 0x08, DMOD)
                    CreateByteField (BUF, 0x05, CMDA)
                    CreateByteField (BUF, 0x0C, CMDB)
                    Store (Arg0, CMDA)
                    Store (Arg0, CMDB)
                    Or (Local0, 0x08, PMOD)
                    If (Local2)
                    {
                        Or (Local3, 0x40, DMOD)
                    }
                    Else
                    {
                        Store (Match (^MDMT, MLE, GETT (Local1), MTR, 0x00, 0x00), Local4)
                        If (LLess (Local4, 0x03))
                        {
                            Or (0x20, Local4, DMOD)
                        }
                    }

                    Return (BUF)
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (^^PPIT, VPIT)
                        Store (^^PMDT, VMDT)
                        Store (^^PPIC, VPIC)
                        Store (^^PUDC, VUDC)
                        Store (^^PUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, ^^PPIT)
                        Store (VMDT, ^^PMDT)
                        Store (VPIM, ^^PPIM)
                        Store (VUDC, ^^PUDC)
                        Store (VUDM, ^^PUDM)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^PMDT, VMDT)
                            Store (^^^PPIM, VPIM)
                            Store (^^^PUDC, VUDC)
                            Store (^^^PUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^PMDT, VMDT)
                            Store (^^^PPIM, VPIM)
                            Store (^^^PUDC, VUDC)
                            Store (^^^PUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        And (PPIC, 0x01, Local0)
                        If (LAnd (Local0, 0x01))
                        {
                            Return (Z008)
                        }
                        Else
                        {
                            Return (Z005)
                        }
                    }

                    Name (FWSO, "FWSO")
                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (_PSC, Local0)
                        Store (0x00, _PSC)
                        If (LEqual (Local0, 0x03))
                        {
                            Store (0x01, \_SB.PCI0.LPC0.INF)
                            While (\_SB.PCI0.LPC0.INF)
                            {
                                Store (0x20, \_SB.PCI0.LPC0.BCMD)
                                Store (Zero, \_SB.PCI0.LPC0.SMIC)
                                If (LAnd (LEqual (\_SB.PCI0.LPC0.INF, 0x01), LGreaterEqual (\_SB.OSTB, 0x04)))
                                {
                                    Sleep (0x01F4)
                                }
                            }
                        }
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (Z008)
                    }
                }
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)
                Mutex (PSMX, 0x00)
                OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
                Field (PIRQ, 
                {
                    0x01
                    PIID,   8, 
                    PIDA,   8
                }

                IndexField (PIID, PIDA, 
                {
                    0x01
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    PIRS,   8, 
                            Offset (0x09), 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                Name (IPRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10,11}
                })
                Name (UPRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Exclusive, )
                        {3,4,5,7}
                })
                Method (DSPI, 0, NotSerialized)
                {
                    Store (0x00, PIRA)
                    Store (0x00, PIRB)
                    Store (0x00, PIRC)
                    Store (0x00, PIRD)
                    Store (0x00, PIRE)
                    Store (0x00, PIRF)
                    Store (0x00, PIRG)
                    Store (0x00, PIRH)
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRA)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRA)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRA, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRA)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRB)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRB)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRB, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRB)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRC)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRC)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRC, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRC)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRD)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRD)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRD, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRD)
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRE)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRE)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRE, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRE)
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRF)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRF)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRF, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRF)
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRG)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRG)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRG, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRG)
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRH)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRH)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRH, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRH)
                    }
                }

                OperationRegion (LCLM, SystemIO, 0x0C50, 0x03)
                Field (LCLM, 
                {
                    0x01
                    CLMI,   8, 
                    CLMD,   8, 
                    CLGP,   8
                }

                IndexField (CLMI, CLMD, 
                {
                    0x01
                    IDRG,   8, 
                            Offset (0x02), 
                    TSTS,   8, 
                    TINT,   8, 
                            Offset (0x12), 
                    I2CC,   8, 
                    GPIO,   8
                }

                Method (RGPM, 0, NotSerialized)
                {
                    Store (\_SB.PCI0.LPC0.GPIO, Local0)
                    And (Local0, Not (0xC0), Local0)
                    Store (Local0, \_SB.PCI0.LPC0.GPIO)
                    Store (\_SB.PCI0.LPC0.CLGP, Local1)
                    Return (Local1)
                }

                OperationRegion (LPCR, PCI_Config, 0x44, 0x02)
                Field (LPCR, 
                {
                    0x01
                    CMA0,   1, 
                    CMA1,   1, 
                    CMA2,   1, 
                    CMA3,   1, 
                    CMA4,   1, 
                    CMA5,   1, 
                    CMA6,   1, 
                    CMA7,   1, 
                    CMB0,   1, 
                    CMB1,   1, 
                    CMB2,   1, 
                    CMB3,   1, 
                    CMB4,   1, 
                    CMB5,   1, 
                    CMB6,   1, 
                    CMB7,   1
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {13}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {2}
                    })
                }

                Device (RTC)
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

                Device (SPKR)
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

                Device (TIME)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {0}
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x1080,             // Range Minimum
                            0x1080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0220,             // Range Minimum
                            0x0220,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x040B,             // Range Minimum
                            0x040B,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0530,             // Range Minimum
                            0x0530,             // Range Maximum
                            0x08,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD2,             // Range Minimum
                            0x0CD2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD4,             // Range Minimum
                            0x0CD4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD6,             // Range Minimum
                            0x0CD6,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD8,             // Range Minimum
                            0x0CD8,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x8000,             // Range Minimum
                            0x8000,             // Range Maximum
                            0x01,               // Alignment
                            0x60,               // Length
                            )
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFF800000,         // Address Base
                            0x00700000,         // Address Length
                            )
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8100,             // Range Minimum
                            0x81FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic)
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8200,             // Range Minimum
                            0x82FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic)
                        IO (Decode16,
                            0x0F40,             // Range Minimum
                            0x0F40,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x087F,             // Range Minimum
                            0x087F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFFF00000,         // Address Base
                            0x00100000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y1C)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1C._BAS, BARX)
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1C._LEN, GALN)
                        Store (\_SB.PCI0.Z009, Local0)
                        If (Local0)
                        {
                            Store (0x1000, GALN)
                            And (Local0, 0xFFFFFFF0, BARX)
                        }

                        Return (MSRC)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                OperationRegion (SMI0, SystemIO, 0x00000F40, 0x00000002)
                Field (SMI0, 
                {
                    0x00
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x7FE94DE5, 0x00000120)
                Field (SMI1, 
                {
                    0x00
                    BCMD,   8, 
                    DID,    32, 
                    INFO,   1024
                }

                Field (SMI1, 
                {
                    0x00
                            AccessAs (ByteAcc, 0x00), 
                            Offset (0x05), 
                    INF,    8, 
                    INF1,   8, 
                    INF2,   8
                }

                Field (SMI1, 
                {
                    0x00
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

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x03)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (EPMS, 0x00)
                    Name (WLLS, 0x00)
                    Name (WLES, 0x00)
                    Name (BTLS, 0x00)
                    Name (BTES, 0x00)
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
                    Field (ECO1, 
                    {
                        0x11
                        PX62,   8
                    }

                    OperationRegion (ECO2, SystemIO, 0x66, 0x01)
                    Field (ECO2, 
                    {
                        0x11
                        PX66,   8
                    }

                    OperationRegion (RAM, EmbeddedControl, 0x00, 0xFF)
                    Field (RAM, 
                    {
                        0x11
                                Offset (0x0A), 
                            ,   1, 
                        BLNK,   1, 
                        WLLD,   2, 
                        BTLD,   2, 
                                Offset (0x13), 
                        URTB,   8, 
                                Offset (0x52), 
                            ,   1, 
                            ,   1, 
                        WEPM,   1, 
                                Offset (0x58), 
                        FIRP,   8, 
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
                            ,   5, 
                        FIRO,   1, 
                        SYSC,   4, 
                        SYSO,   4
                    }

                    Field (RAM, 
                    {
                        0x11
                                Offset (0x7F), 
                        BNEN,   1, 
                        BNCM,   1, 
                        BNDM,   1, 
                        BNVE,   1, 
                                Offset (0x83), 
                        BNAC,   4, 
                        BNDC,   4
                    }

                    Field (RAM, 
                    {
                        0x11
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

                    Field (RAM, 
                    {
                        0x11
                                Offset (0x92), 
                        KTAF,   8
                    }

                    Field (RAM, 
                    {
                        0x11
                                Offset (0x92), 
                        THSL,   4
                    }

                    Field (RAM, 
                    {
                        0x11
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
                            If (LAnd (LGreaterEqual (\_SB.OSTB, 0x40), LEqual (\_SB.LINX, 0x00)))
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

                    Method (_Q16, 0, NotSerialized)
                    {
                        Store (0x16, DBGP)
                        LAMN (0x01)
                    }

                    Method (_Q24, 0, NotSerialized)
                    {
                        Store (0x24, DBGP)
                        LAMN (0x6A)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Store (0x25, DBGP)
                        LAMN (0x6D)
                    }

                    Method (_Q17, 0, NotSerialized)
                    {
                        Store (0x17, DBGP)
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q1A, 0, NotSerialized)
                    {
                        Store (0x1A, DBGP)
                        HKEY (0x1A)
                    }

                    Method (_Q5C, 0, NotSerialized)
                    {
                        Store (0x5C, DBGP)
                        If (\_SB.AMW0.FIRE)
                        {
                            \_SB.AMW0.ACRN (0x0D)
                        }
                    }

                    Method (_Q1E, 0, NotSerialized)
                    {
                        Store (0x1E, DBGP)
                        LAMN (0x20)
                    }

                    Method (_Q1F, 0, NotSerialized)
                    {
                        Store (0x1F, DBGP)
                        LAMN (0x21)
                    }

                    Method (_Q22, 0, NotSerialized)
                    {
                        Store (0x22, DBGP)
                        LAMN (0x07)
                    }

                    Method (_Q10, 0, NotSerialized)
                    {
                        Store (0x10, DBGP)
                        LAMN (0x30)
                        If (\_SB.AMW0.FIRE)
                        {
                            \_SB.AMW0.ACRN (0x01)
                        }
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store (0x11, DBGP)
                        LAMN (0x36)
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        Store (0x12, DBGP)
                        LAMN (0x31)
                    }

                    Method (_Q13, 0, NotSerialized)
                    {
                        Store (0x13, DBGP)
                        LAMN (0x11)
                    }

                    Method (_Q14, 0, NotSerialized)
                    {
                        Store (0x14, DBGP)
                        LAMN (0x12)
                    }

                    Method (_Q15, 0, NotSerialized)
                    {
                        Store (0x15, DBGP)
                        LAMN (0x13)
                    }

                    Method (_Q1B, 0, NotSerialized)
                    {
                        Store (0x1B, DBGP)
                        LAMN (0x08)
                    }

                    Method (_Q1C, 0, NotSerialized)
                    {
                        Store (0x1C, DBGP)
                        If (BNEN)
                        {
                            If (BNVE)
                            {
                                HKEY (0x1C)
                            }

                            If (\_SB.AMW0.FIRE)
                            {
                                \_SB.AMW0.ACRN (0x03)
                            }
                            Else
                            {
                                LAMN (0x73)
                            }
                        }
                        Else
                        {
                            Sleep (0x64)
                            If (\_SB.PCI0.GFXI)
                            {
                                Notify (\_SB.PCI0.AGP.VGA.LCD, 0x86)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.PB2.VGA.LCD, 0x86)
                            }
                        }
                    }

                    Method (_Q1D, 0, NotSerialized)
                    {
                        Store (0x1D, DBGP)
                        If (BNEN)
                        {
                            If (BNVE)
                            {
                                HKEY (0x1D)
                            }

                            If (\_SB.AMW0.FIRE)
                            {
                                \_SB.AMW0.ACRN (0x03)
                            }
                            Else
                            {
                                LAMN (0x74)
                            }
                        }
                        Else
                        {
                            Sleep (0x64)
                            If (\_SB.PCI0.GFXI)
                            {
                                Notify (\_SB.PCI0.AGP.VGA.LCD, 0x87)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.PB2.VGA.LCD, 0x87)
                            }
                        }
                    }

                    Method (_Q23, 0, NotSerialized)
                    {
                        Store (0x23, DBGP)
                        LAMN (0x44)
                        If (\_SB.AMW0.FIRE)
                        {
                            \_SB.AMW0.ACRN (0x02)
                        }
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Store (0x32, DBGP)
                        HKEY (0x32)
                        Store (0x00, KCTT)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x33, DBGP)
                        Store (0x00, KCSS)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x34, DBGP)
                        Store (0x01, KCSS)
                    }

                    Method (_Q35, 0, NotSerialized)
                    {
                        Store (0x35, DBGP)
                        HKEY (0x35)
                        Store (0x01, KCTT)
                    }

                    Method (_Q36, 0, NotSerialized)
                    {
                        Store (0x36, DBGP)
                        Store (0x01, KOSD)
                        Sleep (0x01F4)
                        NTMR ()
                    }

                    Method (_Q39, 0, NotSerialized)
                    {
                        Store (0x39, DBGP)
                        Store (0x01, KPPS)
                        HKEY (0x39)
                    }

                    Method (_Q3A, 0, NotSerialized)
                    {
                        Store (0x3A, DBGP)
                        Store (0x00, KPPS)
                        HKEY (0x3A)
                    }

                    Method (_Q40, 0, NotSerialized)
                    {
                        Store (0x40, DBGP)
                        Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x81)
                        If (\_SB.AMW0.FIRE)
                        {
                            If (\_SB.PCI0.LPC0.EC0.NB0N)
                            {
                                \_SB.AMW0.ACRN (0x04)
                            }
                        }
                    }

                    Method (_Q41, 0, NotSerialized)
                    {
                        Store (0x41, DBGP)
                        Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x81)
                    }

                    Method (_Q48, 0, NotSerialized)
                    {
                        Store (0x48, DBGP)
                        Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x80)
                    }

                    Method (_Q4C, 0, NotSerialized)
                    {
                        Store (0x4C, DBGP)
                        If (B0ST)
                        {
                            Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x80)
                        }
                    }

                    Method (_Q4D, 0, NotSerialized)
                    {
                        Store (0x4D, DBGP)
                        \_SB.AMW0.ADSN (0x01)
                    }

                    Method (_Q4E, 0, NotSerialized)
                    {
                        Store (0x4E, DBGP)
                        \_SB.AMW0.ADSN (0x03)
                    }

                    Method (_Q50, 0, NotSerialized)
                    {
                        Store (0x50, DBGP)
                        Notify (\_SB.PCI0.LPC0.EC0.ADP1, 0x80)
                    }

                    Method (_Q51, 0, NotSerialized)
                    {
                        Store (0x51, DBGP)
                        Notify (\_SB.PCI0.LPC0.EC0.ADP1, 0x80)
                    }

                    Method (_Q52, 0, NotSerialized)
                    {
                        Store (0x52, DBGP)
                        Notify (\_SB.LID0, 0x80)
                    }

                    Method (_Q53, 0, NotSerialized)
                    {
                        Store (0x53, DBGP)
                        Notify (\_SB.LID0, 0x80)
                    }

                    Method (NTMR, 0, NotSerialized)
                    {
                        Notify (\_TZ.TZS0, 0x80)
                        Notify (\_TZ.TZS1, 0x80)
                    }

                    Method (_Q65, 0, NotSerialized)
                    {
                        If (LEqual (IRTR, 0xA4))
                        {
                            Store (0xE3, \_SB.PCI0.SMB.USBB)
                        }
                        Else
                        {
                            If (\_SB.PCI0.GFXI)
                            {
                                Store (0x20, \_SB.PCI0.SMB.USBB)
                            }
                            Else
                            {
                                Store (0x60, \_SB.PCI0.SMB.USBB)
                            }
                        }
                    }

                    Field (RAM, 
                    {
                        0x11
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

                    Field (RAM, 
                    {
                        0x11
                                Offset (0x88), 
                        NB0S,   8, 
                        NB1S,   8
                    }

                    Field (RAM, 
                    {
                        0x11
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

                    Field (RAM, 
                    {
                        0x11
                                Offset (0xE0), 
                        BSDC,   16, 
                        BSDV,   16, 
                        BSSN,   16
                    }

                    Field (RAM, 
                    {
                        0x01
                                Offset (0xE0), 
                        BSMN,   128
                    }

                    Field (RAM, 
                    {
                        0x01
                                Offset (0xE0), 
                        BSDN,   128
                    }

                    Field (RAM, 
                    {
                        0x01
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

                Device (NS38)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Name (_UID, 0x01)
                    Method (_STA, 0, Serialized)
                    {
                        If (FIRN)
                        {
                            Return (0x0F)
                        }

                        Return (0x00)
                    }

                    OperationRegion (N381, SystemIO, 0x2E, 0x02)
                    Field (N381, 
                    {
                        0x11
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, 
                    {
                        0x11
                                Offset (0x07), 
                        R07H,   8, 
                                Offset (0x20), 
                        R20H,   8, 
                        R21H,   8, 
                        R22H,   8, 
                        R23H,   8, 
                        R24H,   8, 
                        R25H,   8, 
                        R26H,   8, 
                        R27H,   8, 
                        R28H,   8, 
                        R29H,   8, 
                        R2AH,   8, 
                                Offset (0x30), 
                        R30H,   8, 
                                Offset (0x60), 
                        R60H,   8, 
                        R61H,   8, 
                                Offset (0x70), 
                        R70H,   8, 
                        R71H,   8, 
                                Offset (0x74), 
                        R74H,   8, 
                        R75H,   8, 
                                Offset (0xF0), 
                        RF0H,   8, 
                        RF1H,   8
                    }

                    Device (NFIR)
                    {
                        Name (_HID, EisaId ("NSC6001"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, Serialized)
                        {
                            If (FIRN)
                            {
                                Store (0x02, R07H)
                                If (R30H)
                                {
                                    Return (0x0F)
                                }

                                Return (0x0D)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                        }

                        Method (_CRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y1D)
                                IRQNoFlags (_Y1E)
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8_16, _Y1F)
                                    {3}
                            })
                            Store (0x02, R07H)
                            If (FIRN)
                            {
                                CreateByteField (BUF0, \_SB.PCI0.LPC0.NS38.NFIR._CRS._Y1D._MIN, IOL0)
                                CreateByteField (BUF0, 0x03, IOH0)
                                CreateByteField (BUF0, \_SB.PCI0.LPC0.NS38.NFIR._CRS._Y1D._MAX, IOL1)
                                CreateByteField (BUF0, 0x05, IOH1)
                                CreateByteField (BUF0, \_SB.PCI0.LPC0.NS38.NFIR._CRS._Y1D._LEN, LEN0)
                                CreateWordField (BUF0, \_SB.PCI0.LPC0.NS38.NFIR._CRS._Y1E._INT, IRQW)
                                CreateByteField (BUF0, \_SB.PCI0.LPC0.NS38.NFIR._CRS._Y1F._DMA, DMA0)
                                Store (R60H, IOH0)
                                Store (R61H, IOL0)
                                Store (R60H, IOH1)
                                Store (R61H, IOL1)
                                Store (0x08, LEN0)
                                And (R70H, 0x0F, Local0)
                                If (Local0)
                                {
                                    ShiftLeft (One, Local0, IRQW)
                                }
                                Else
                                {
                                    Store (Zero, IRQW)
                                }

                                Store (R74H, Local0)
                                If (LEqual (Local0, 0x04))
                                {
                                    Store (Zero, DMA0)
                                }
                                Else
                                {
                                    ShiftLeft (One, Local0, DMA0)
                                }
                            }

                            Return (BUF0)
                        }

                        Method (_PRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                EndDependentFn ()
                            })
                            Return (BUF0)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateWordField (Arg0, 0x09, IRQW)
                            CreateByteField (Arg0, 0x0C, DMA0)
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                            Store (IOLO, R61H)
                            Store (IOHI, R60H)
                            FindSetRightBit (IRQW, Local0)
                            If (LNotEqual (IRQW, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R70H)
                            FindSetRightBit (DMA0, Local0)
                            If (LNotEqual (DMA0, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R74H)
                            Store (0x01, R30H)
                            Or (RF0H, 0x80, Local0)
                            Store (Local0, RF0H)
                        }

                        Method (_PS0, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x01, R30H)
                        }

                        Method (_PS3, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                        }
                    }
                }

                Device (WPC8)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Name (_UID, 0x02)
                    Method (_STA, 0, Serialized)
                    {
                        If (FIRS)
                        {
                            Return (0x0F)
                        }

                        Return (0x00)
                    }

                    OperationRegion (WPC, SystemIO, 0x4E, 0x02)
                    Field (WPC, 
                    {
                        0x11
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, 
                    {
                        0x11
                                Offset (0x07), 
                        R07H,   8, 
                                Offset (0x20), 
                        R20H,   8, 
                        R21H,   8, 
                        R22H,   8, 
                        R23H,   8, 
                        R24H,   8, 
                        R25H,   8, 
                        R26H,   8, 
                        R27H,   8, 
                        R28H,   8, 
                        R29H,   8, 
                        R2AH,   8, 
                                Offset (0x30), 
                        R30H,   8, 
                                Offset (0x60), 
                        R60H,   8, 
                        R61H,   8, 
                                Offset (0x70), 
                        R70H,   8, 
                        R71H,   8, 
                                Offset (0x74), 
                        R74H,   8, 
                        R75H,   8, 
                                Offset (0xF0), 
                        RF0H,   8, 
                        RF1H,   8
                    }

                    Device (WFIR)
                    {
                        Name (_HID, EisaId ("NSC6001"))
                        Name (_UID, 0x02)
                        Method (_STA, 0, Serialized)
                        {
                            If (FIRS)
                            {
                                Store (0x1A, R07H)
                                If (R30H)
                                {
                                    Return (0x0F)
                                }

                                Return (0x0D)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x1A, R07H)
                            Store (0x00, R30H)
                        }

                        Method (_CRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y20)
                                IRQNoFlags (_Y21)
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8_16, _Y22)
                                    {3}
                            })
                            Store (0x1A, R07H)
                            If (FIRS)
                            {
                                CreateByteField (BUF0, \_SB.PCI0.LPC0.WPC8.WFIR._CRS._Y20._MIN, IOL0)
                                CreateByteField (BUF0, 0x03, IOH0)
                                CreateByteField (BUF0, \_SB.PCI0.LPC0.WPC8.WFIR._CRS._Y20._MAX, IOL1)
                                CreateByteField (BUF0, 0x05, IOH1)
                                CreateByteField (BUF0, \_SB.PCI0.LPC0.WPC8.WFIR._CRS._Y20._LEN, LEN0)
                                CreateWordField (BUF0, \_SB.PCI0.LPC0.WPC8.WFIR._CRS._Y21._INT, IRQW)
                                CreateByteField (BUF0, \_SB.PCI0.LPC0.WPC8.WFIR._CRS._Y22._DMA, DMA0)
                                Store (R60H, IOH0)
                                Store (R61H, IOL0)
                                Store (R60H, IOH1)
                                Store (R61H, IOL1)
                                Store (0x08, LEN0)
                                And (R70H, 0x0F, Local0)
                                If (Local0)
                                {
                                    ShiftLeft (One, Local0, IRQW)
                                }
                                Else
                                {
                                    Store (Zero, IRQW)
                                }

                                Store (R74H, Local0)
                                If (LEqual (Local0, 0x04))
                                {
                                    Store (Zero, DMA0)
                                }
                                Else
                                {
                                    ShiftLeft (One, Local0, DMA0)
                                }
                            }

                            Return (BUF0)
                        }

                        Method (_PRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                EndDependentFn ()
                            })
                            Return (BUF0)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateWordField (Arg0, 0x09, IRQW)
                            CreateByteField (Arg0, 0x0C, DMA0)
                            Store (0x1A, R07H)
                            Store (0x00, R30H)
                            Store (IOLO, R61H)
                            Store (IOHI, R60H)
                            FindSetRightBit (IRQW, Local0)
                            If (LNotEqual (IRQW, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R70H)
                            FindSetRightBit (DMA0, Local0)
                            If (LNotEqual (DMA0, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R74H)
                            Store (0x01, R30H)
                            Or (RF0H, 0x80, Local0)
                            Store (Local0, RF0H)
                        }

                        Method (_PS0, 0, Serialized)
                        {
                            Store (0x1A, R07H)
                            Store (0x01, R30H)
                        }

                        Method (_PS3, 0, Serialized)
                        {
                            Store (0x1A, R07H)
                            Store (0x00, R30H)
                        }
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y23)
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.SMB.HPBS, 0xFED00000))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LEqual (\_SB.PCI0.SMB.HPET, 0x01))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateDWordField (CRS, \_SB.PCI0.LPC0.HPET._Y23._BAS, HPT)
                        If (LEqual (\_SB.PCI0.SMB.HPET, 0x01))
                        {
                            Store (0xFED00000, HPT)
                        }

                        Return (CRS)
                    }
                }
            }

            Device (P2P)
            {
                Name (_ADR, 0x00140004)
                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x05
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x02, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x03, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x04, 
                                0x00, 
                                0x14
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x04, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (AZLA)
            {
                Name (_ADR, 0x00140002)
                Name (HDWA, 0x00)
                Name (_PRW, Package (0x02)
                {
                    0x1B, 
                    0x03
                })
                Method (_PS0, 0, Serialized)
                {
                    If (LEqual (HDWA, 0x00))
                    {
                        Store (0x01, HDWA)
                        HKEY (0x8F)
                    }
                }

                Method (_PS3, 0, Serialized)
                {
                    Store (0x00, HDWA)
                }
            }

            Device (AGP)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x02)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }
                        })
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00050000)
                    Name (SWIT, 0x01)
                    Name (CRTC, 0x01)
                    Name (LCDC, 0x01)
                    Name (TV0C, 0x00)
                    Name (CRTN, 0x01)
                    Name (LCDN, 0x01)
                    Name (TV0N, 0x00)
                    Method (VDEV, 0, NotSerialized)
                    {
                        GDST ()
                        If (LEqual (\VDSS, 0x00))
                        {
                            Store (0x00, Local0)
                            If (LEqual (CRTC, 0x01))
                            {
                                Store (0x02, Local0)
                            }

                            Increment (Local0)
                            If (LGreater (Local0, 0x04))
                            {
                                Store (0x01, Local0)
                            }

                            If (LAnd (Local0, 0x01))
                            {
                                Store (0x01, LCDN)
                            }

                            If (LAnd (Local0, 0x02))
                            {
                                Store (0x01, CRTN)
                            }

                            If (LAnd (Local0, 0x04))
                            {
                                Store (0x01, TV0N)
                            }
                        }

                        If (LEqual (\VDSS, 0x01))
                        {
                            Store (0x01, LCDN)
                            Store (0x00, CRTN)
                            Store (0x00, TV0N)
                        }

                        If (LEqual (\VDSS, 0x02))
                        {
                            Store (0x00, LCDN)
                            Store (0x01, CRTN)
                            Store (0x00, TV0N)
                        }

                        If (LEqual (\VDSS, 0x03))
                        {
                            Store (0x01, LCDN)
                            Store (0x01, CRTN)
                            Store (0x00, TV0N)
                        }

                        If (LEqual (\VDSS, 0x04))
                        {
                            Store (0x00, LCDN)
                            Store (0x00, CRTN)
                            Store (0x01, TV0N)
                        }

                        If (LEqual (\VDSS, 0x05))
                        {
                            Store (0x01, LCDN)
                            Store (0x00, CRTN)
                            Store (0x01, TV0N)
                        }
                    }

                    Method (GDST, 0, NotSerialized)
                    {
                        Store (0x00, CRTC)
                        Store (0x00, LCDC)
                        Store (0x00, TV0C)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        VDEV ()
                        Store (Arg0, Local0)
                        And (Local0, 0x01, SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x0100, 
                            0x0200, 
                            0x0110
                        })
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (CRTC)
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
                            If (CRTN)
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
                        Name (_ADR, 0x0110)
                        Name (BCLP, Package (0x0C)
                        {
                            0x64, 
                            0x3C, 
                            0x0A, 
                            0x14, 
                            0x1E, 
                            0x28, 
                            0x32, 
                            0x3C, 
                            0x46, 
                            0x50, 
                            0x5A, 
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
                                    If (LEqual (0x0B, Local1))
                                    {
                                        Store (0x00, Local0)
                                    }
                                }
                            }

                            Decrement (Local1)
                            Decrement (Local1)
                            If (\_SB.PCI0.LPC0.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPC0.EC0.ACST)
                                {
                                    Store (Local1, \_SB.PCI0.LPC0.EC0.BNAC)
                                }
                                Else
                                {
                                    Store (Local1, \_SB.PCI0.LPC0.EC0.BNDC)
                                }
                            }
                            Else
                            {
                                Store (Local1, \_SB.PCI0.LPC0.EC0.BNAC)
                            }

                            If (\_SB.PCI0.LPC0.EC0.BNVE)
                            {
                                HKEY (0x1C)
                            }

                            If (\_SB.AMW0.FIRE)
                            {
                                \_SB.AMW0.ACRN (0x03)
                            }
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            If (\_SB.PCI0.LPC0.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPC0.EC0.ACST)
                                {
                                    Store (\_SB.PCI0.LPC0.EC0.BNAC, Local1)
                                }
                                Else
                                {
                                    Store (\_SB.PCI0.LPC0.EC0.BNDC, Local1)
                                }
                            }
                            Else
                            {
                                Store (\_SB.PCI0.LPC0.EC0.BNAC, Local1)
                            }

                            Increment (Local1)
                            Increment (Local1)
                            Store (DerefOf (Index (BCLP, Local1)), Local0)
                            Return (Local0)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            If (LCDC)
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
                            If (LCDN)
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
                            If (TV0C)
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
                            If (TV0N)
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
                                Return (\_SB.PCI0.AGP.VGA.DDC3)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Concatenate (\_SB.PCI0.AGP.VGA.DDC3, \_SB.PCI0.AGP.VGA.DDC0, Local0)
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
                        /* 0008 */    0x0D, 0xAF, 0x00, 0x15, 0x00, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x02, 0x0D, 0x01, 0x03, 0x80, 0x21, 0x15, 0x78, 
                        /* 0018 */    0x0A, 0xCA, 0xA5, 0x95, 0x5B, 0x4C, 0x95, 0x27, 
                        /* 0020 */    0x22, 0x50, 0x54, 0x00, 0x00, 0x00, 0x01, 0x01, 
                        /* 0028 */    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 
                        /* 0030 */    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xBC, 0x1B, 
                        /* 0038 */    0x00, 0xA0, 0x50, 0x20, 0x17, 0x30, 0x30, 0x20, 
                        /* 0040 */    0x26, 0x00, 0x4B, 0xCF, 0x10, 0x00, 0x00, 0x1C, 
                        /* 0048 */    0x00, 0x00, 0x00, 0xFD, 0x00, 0x3B, 0x3D, 0x30, 
                        /* 0050 */    0x32, 0x08, 0x00, 0x0A, 0x20, 0x20, 0x20, 0x20, 
                        /* 0058 */    0x20, 0x20, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x4E, 
                        /* 0060 */    0x31, 0x35, 0x34, 0x49, 0x31, 0x0A, 0x20, 0x20, 
                        /* 0068 */    0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFC, 
                        /* 0070 */    0x00, 0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x20, 0x4C, 
                        /* 0078 */    0x43, 0x44, 0x0A, 0x20, 0x20, 0x20, 0x00, 0x98
                    })
                    Name (ATIB, Buffer (0x0100) {})
                    Method (XTIF, 2, Serialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Return (AF00 ())
                        }

                        If (LEqual (Arg0, 0x01))
                        {
                            Return (AF01 ())
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Return (AF02 ())
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            Return (AF05 ())
                        }

                        If (LEqual (Arg0, 0x06))
                        {
                            Return (AF06 (DerefOf (Index (Arg1, 0x03))))
                        }

                        If (LEqual (Arg0, 0x07))
                        {
                            Return (AF07 ())
                        }

                        If (LEqual (Arg0, 0x08))
                        {
                            Return (AF08 (DerefOf (Index (Arg1, 0x02))))
                        }
                        Else
                        {
                            CreateWordField (ATIB, 0x00, SSZE)
                            CreateWordField (ATIB, 0x02, VERN)
                            CreateDWordField (ATIB, 0x04, NMSK)
                            CreateDWordField (ATIB, 0x08, SFUN)
                            Store (0x00, SSZE)
                            Store (0x00, VERN)
                            Store (0x00, NMSK)
                            Store (0x00, SFUN)
                            Return (ATIB)
                        }
                    }

                    Method (AF00, 0, NotSerialized)
                    {
                        Store (0xF0, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        Store (0x0C, SSZE)
                        Store (0x01, VERN)
                        Store (0x11, NMSK)
                        Store (NMSK, MSKN)
                        Store (0xF3, SFUN)
                        Return (ATIB)
                    }

                    Method (AF01, 0, NotSerialized)
                    {
                        Store (0xF1, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, VMSK)
                        CreateDWordField (ATIB, 0x06, FLGS)
                        Store (0x0A, SSZE)
                        Store (0x03, VMSK)
                        Store (0x01, FLGS)
                        Return (ATIB)
                    }

                    Name (PSBR, Buffer (0x04)
                    {
                        0x00, 0x00, 0x00, 0x00
                    })
                    Name (MSKN, 0x00)
                    Name (SEXM, 0x00)
                    Name (STHG, 0x00)
                    Name (STHI, 0x00)
                    Name (SFPG, 0x00)
                    Name (SFPI, 0x00)
                    Name (SSPS, 0x00)
                    Name (SSDM, 0x0A)
                    Name (SCDY, 0x00)
                    Name (SACT, Buffer (0x05)
                    {
                        0x01, 0x02, 0x08, 0x03, 0x09
                    })
                    Method (AF02, 0, NotSerialized)
                    {
                        Store (0xF2, DBGP)
                        CreateBitField (PSBR, 0x00, PDSW)
                        CreateBitField (PSBR, 0x01, PEXM)
                        CreateBitField (PSBR, 0x02, PTHR)
                        CreateBitField (PSBR, 0x03, PFPS)
                        CreateBitField (PSBR, 0x04, PSPS)
                        CreateBitField (PSBR, 0x05, PDCC)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, PSBI)
                        CreateByteField (ATIB, 0x06, EXPM)
                        CreateByteField (ATIB, 0x07, THRM)
                        CreateByteField (ATIB, 0x08, THID)
                        CreateByteField (ATIB, 0x09, FPWR)
                        CreateByteField (ATIB, 0x0A, FPID)
                        CreateByteField (ATIB, 0x0B, SPWR)
                        Store (0x0C, SSZE)
                        Store (PSBR, PSBI)
                        If (PDSW)
                        {
                            Store (0x82, DBGP)
                            Store (Zero, PDSW)
                        }

                        If (PEXM)
                        {
                            Store (SEXM, EXPM)
                            Store (Zero, SEXM)
                            Store (Zero, PEXM)
                        }

                        If (PTHR)
                        {
                            Store (STHG, THRM)
                            Store (STHI, THID)
                            Store (Zero, STHG)
                            Store (Zero, STHI)
                            Store (Zero, PTHR)
                        }

                        If (PFPS)
                        {
                            Store (SFPG, FPWR)
                            Store (SFPI, FPWR)
                            Store (Zero, SFPG)
                            Store (Zero, SFPI)
                            Store (Zero, PFPS)
                        }

                        If (PSPS)
                        {
                            Store (SSPS, SPWR)
                            Store (Zero, SSPS)
                            Store (Zero, PSPS)
                        }

                        Return (ATIB)
                    }

                    Method (AF05, 0, NotSerialized)
                    {
                        Store (0xF5, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateByteField (ATIB, 0x02, TSEF)
                        CreateByteField (ATIB, 0x03, TVIF)
                        Store (0x04, SSZE)
                        Store (0x00, TSEF)
                        Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                        Store (0x95, \_SB.PCI0.LPC0.BCMD)
                        Store (0x05, \_SB.PCI0.LPC0.DID)
                        Store (ATIB, \_SB.PCI0.LPC0.INFO)
                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                        CreateByteField (\_SB.PCI0.LPC0.INFO, 0x03, TVII)
                        Store (TVII, TVIF)
                        Release (\_SB.PCI0.LPC0.PSMX)
                        Return (ATIB)
                    }

                    Method (AF06, 1, NotSerialized)
                    {
                        Store (0xF6, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateByteField (ATIB, 0x02, TSEF)
                        CreateByteField (ATIB, 0x03, TVIF)
                        Store (0x04, SSZE)
                        Store (0x00, TSEF)
                        Store (Arg0, TVIF)
                        Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                        Store (0x95, \_SB.PCI0.LPC0.BCMD)
                        Store (0x06, \_SB.PCI0.LPC0.DID)
                        Store (ATIB, \_SB.PCI0.LPC0.INFO)
                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                        Release (\_SB.PCI0.LPC0.PSMX)
                    }

                    Method (AF07, 0, NotSerialized)
                    {
                        Store (0xF7, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateByteField (ATIB, 0x02, XMOD)
                        Store (0x03, SSZE)
                        Store (0x00, XMOD)
                        Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                        Store (0x95, \_SB.PCI0.LPC0.BCMD)
                        Store (0x07, \_SB.PCI0.LPC0.DID)
                        Store (ATIB, \_SB.PCI0.LPC0.INFO)
                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                        CreateByteField (\_SB.PCI0.LPC0.INFO, 0x02, PMOD)
                        Store (PMOD, XMOD)
                        Release (\_SB.PCI0.LPC0.PSMX)
                        Return (ATIB)
                    }

                    Method (AF08, 1, NotSerialized)
                    {
                        Store (0xF8, DBGP)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateByteField (ATIB, 0x02, XMOD)
                        Store (0x03, SSZE)
                        Store (Arg0, XMOD)
                        Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                        Store (0x95, \_SB.PCI0.LPC0.BCMD)
                        Store (0x08, \_SB.PCI0.LPC0.DID)
                        Store (ATIB, \_SB.PCI0.LPC0.INFO)
                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                        Release (\_SB.PCI0.LPC0.PSMX)
                    }

                    Method (AFN1, 1, Serialized)
                    {
                        If (And (MSKN, 0x02))
                        {
                            Store (Arg0, Local0)
                            And (Local0, 0x03, Local0)
                            Store (Local0, SEXM)
                            CreateBitField (PSBR, 0x01, PEXM)
                            Store (One, PEXM)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN2, 2, Serialized)
                    {
                        If (And (MSKN, 0x04))
                        {
                            Store (Arg0, Local0)
                            Store (Local0, STHI)
                            Store (Arg1, Local0)
                            Store (And (Local0, 0x03, Local0), STHG)
                            CreateBitField (PSBR, 0x02, PTHS)
                            Store (One, PTHS)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN5, 0, Serialized)
                    {
                        If (And (MSKN, 0x20))
                        {
                            CreateBitField (PSBR, 0x05, PDCC)
                            Store (One, PDCC)
                            Notify (VGA, 0x81)
                        }
                    }
                }
            }
        }
    }

    Scope (\_GPE)
    {
        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P2P, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.OHC1, 0x02)
            Notify (\_SB.PCI0.OHC2, 0x02)
        }

        Method (_L19, 0, NotSerialized)
        {
            Name (HPOK, 0x00)
            If (\_SB.PCI0.SMB.GM4C)
            {
                Sleep (0x14)
                Store (\_SB.PCI0.LPC0.RGPM (), Local0)
                If (And (Local0, 0x10))
                {
                    Store (0x00, \_SB.PCI0.SMB.GM4C)
                    Store ("HotPlug:06: Removal Event", Debug)
                    Store (0x08, \_SB.PCI0.PB6.SLST)
                    Store (\_SB.PCI0.PB6.NCRD.DVID, Local7)
                    Sleep (0x0A)
                    Store (0x01, Local4)
                    Store (0x05, Local5)
                    While (LAnd (Local4, Local5))
                    {
                        Store (\_SB.PCI0.PB6.XPRD (0xA5), Local6)
                        And (Local6, 0x3F, Local6)
                        If (LLessEqual (Local6, 0x04))
                        {
                            Store (0x00, Local4)
                        }
                        Else
                        {
                            Store (\_SB.PCI0.PB6.NCRD.DVID, Local7)
                            Sleep (0x05)
                            Decrement (Local5)
                        }
                    }

                    \_SB.PCI0.XPTR (0x06, 0x00)
                    \_SB.PCI0.PB6.XPLP (0x00)
                    Store (0x01, HPOK)
                }
            }
            Else
            {
                Sleep (0x14)
                Store (\_SB.PCI0.LPC0.RGPM (), Local0)
                If (LNot (And (Local0, 0x10)))
                {
                    Store (0x01, \_SB.PCI0.SMB.GM4C)
                    Store ("HotPlug:06: Insertion Event", Debug)
                    Store (0x00, HPOK)
                    \_SB.PCI0.PB6.XPLP (0x01)
                    Sleep (0xC8)
                    \_SB.PCI0.XPTR (0x06, 0x01)
                    Sleep (0x14)
                    Store (0x00, Local2)
                    While (LLess (Local2, 0x0F))
                    {
                        Store (0x08, \_SB.PCI0.PB6.SLST)
                        Store (0x01, Local4)
                        Store (0xC8, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (\_SB.PCI0.PB6.XPRD (0xA5), Local6)
                            And (Local6, 0x3F, Local6)
                            If (LEqual (Local6, 0x10))
                            {
                                Store ("HotPlug:06: TrainingState=0x10", Debug)
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        If (LNot (Local4))
                        {
                            Store ("HotPlug:06: Check VC Negotiation Pending", Debug)
                            Store (\_SB.PCI0.PB6.XPDL (), Local5)
                            If (Local5)
                            {
                                Store ("HotPlug:06: Retraining Link", Debug)
                                \_SB.PCI0.PB6.XPRT ()
                                Sleep (0x05)
                                Increment (Local2)
                            }
                            Else
                            {
                                Store ("HotPlug:06: Device OK", Debug)
                                Store (0x30, \_SB.PCI0.LPC0.INFO)
                                Store (0x93, \_SB.PCI0.LPC0.BCMD)
                                Store (Zero, \_SB.PCI0.LPC0.SMIC)
                                If (LEqual (\_SB.PCI0.PB6.XPR2 (), Ones))
                                {
                                    Store (0x01, HPOK)
                                    Store (0x10, Local2)
                                }
                                Else
                                {
                                    Store ("HotPlug:06: Common Clock Retraining Failed", Debug)
                                    Store (0x00, HPOK)
                                    Store (0x10, Local2)
                                }
                            }
                        }
                        Else
                        {
                            Store ("HotPlug:06: TrainingState Timeout", Debug)
                            Store (0x10, Local2)
                        }
                    }

                    If (LNot (HPOK))
                    {
                        Store ("HotPlug:06: Insertion Failed: Disable Training & PowerDown", Debug)
                        Store (\_SB.PCI0.PB6.NCRD.DVID, Local7)
                        Sleep (0x0A)
                        Store (0x01, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (\_SB.PCI0.PB6.XPRD (0xA5), Local6)
                            And (Local6, 0x3F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Store (\_SB.PCI0.PB6.NCRD.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        \_SB.PCI0.XPTR (0x06, 0x00)
                        \_SB.PCI0.PB6.XPLP (0x00)
                    }
                }
            }

            If (HPOK)
            {
                Notify (\_SB.PCI0.PB6, 0x00)
                PHSR (0x92, 0x00)
            }
        }
    }

    Scope (\_SB.PCI0.SMB)
    {
        Mutex (SBX0, 0x00)
        OperationRegion (SMB1, SystemIO, 0x8050, 0x10)
        Field (SMB1, 
        {
            0x01
            HSTS,   8, 
            SLVS,   8, 
            HCNT,   8, 
            HCMD,   8, 
            HADD,   8, 
            DAT0,   8, 
            DAT1,   8, 
            BLKD,   8, 
            PECR,   8, 
            CAUX,   8, 
            ASFS,   8, 
            SMK0,   8, 
            SMK1,   8, 
            SLMC,   8, 
            RADD,   8, 
            SADD,   8
        }

        Method (SBI, 0, NotSerialized)
        {
            Store (Package (0x02)
                {
                    0x10, 
                    0x00
                }, Local0)
            Store (Buffer (0x05)
                {
                    0x10, 0x20, 0x03, 0x0A, 0x00
                }, Index (Local0, 0x01))
            Return (Local0)
        }

        Method (SWBD, 1, NotSerialized)
        {
            Store (Arg0, Local0)
            Store (0x00, Local2)
            Store (HSTS, Local3)
            Store (And (Local3, 0x80), Local1)
            While (LNotEqual (Local1, 0x80))
            {
                If (LLess (Local0, 0x0A))
                {
                    Store (0x18, Local2)
                    Store (0x00, Local1)
                }
                Else
                {
                    Sleep (0x0A)
                    Subtract (Local0, 0x0A, Local0)
                    Store (HSTS, Local3)
                    Store (And (Local3, 0x80), Local1)
                }
            }

            If (LNotEqual (Local2, 0x18))
            {
                Store (And (HSTS, 0x1C), Local1)
                If (Local1)
                {
                    Store (0x07, Local2)
                }
            }

            Return (Local2)
        }

        Method (SWTC, 1, NotSerialized)
        {
            Store (Arg0, Local0)
            Store (0x07, Local2)
            Store (0x01, Local1)
            While (LEqual (Local1, 0x01))
            {
                Store (And (HSTS, 0x1F), Local3)
                If (LNotEqual (Local3, 0x00))
                {
                    If (LEqual (Local3, 0x01))
                    {
                        If (LLess (Local0, 0x0A))
                        {
                            Store (0x18, Local2)
                            Store (0x00, Local1)
                        }
                        Else
                        {
                            Sleep (0x0A)
                            Subtract (Local0, 0x0A, Local0)
                        }
                    }
                    Else
                    {
                        Store (0x07, Local2)
                        Store (0x00, Local1)
                    }
                }
                Else
                {
                    Store (0x00, Local2)
                    Store (0x00, Local1)
                }
            }

            Store (Or (HSTS, 0x1F), HSTS)
            Return (Local2)
        }

        Method (SBR, 3, NotSerialized)
        {
            Store (Package (0x22)
                {
                    0x07, 
                    0x00, 
                    0x00
                }, Local0)
            Store (And (Arg0, 0x5F), Local4)
            If (LNotEqual (Local4, 0x03))
            {
                If (LNotEqual (Local4, 0x05))
                {
                    If (LNotEqual (Local4, 0x07))
                    {
                        If (LNotEqual (Local4, 0x09))
                        {
                            If (LNotEqual (Local4, 0x0B))
                            {
                                Store (0x19, Index (Local0, 0x00))
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            If (LEqual (Acquire (SBX0, 0xFFFF), 0x00))
            {
                Store (Or (ShiftLeft (Arg1, 0x01), 0x01), HADD)
                Store (Arg2, HCMD)
                Store (Or (HSTS, 0x1F), HSTS)
                Store (And (Arg0, 0xA0), Local1)
                Store (Or (And (HCNT, 0x5F), Local1), HCNT)
                If (LEqual (Local4, 0x03))
                {
                    Store (Or (And (HCNT, 0xA0), 0x40), HCNT)
                }

                If (LEqual (Local4, 0x05))
                {
                    Store (Or (And (HCNT, 0xA0), 0x44), HCNT)
                }

                If (LEqual (Local4, 0x07))
                {
                    Store (Or (And (HCNT, 0xA0), 0x48), HCNT)
                }

                If (LEqual (Local4, 0x09))
                {
                    Store (Or (And (HCNT, 0xA0), 0x4C), HCNT)
                }

                If (LEqual (Local4, 0x0B))
                {
                    Store (Or (HSTS, 0x80), HSTS)
                    Store (0x00, DAT0)
                    Store (Or (And (HCNT, 0xA0), 0x54), HCNT)
                }

                Store (SWTC (0x03E8), Local1)
                Store (Local1, Index (Local0, 0x00))
                If (LEqual (Local1, 0x00))
                {
                    If (LEqual (Local4, 0x05))
                    {
                        Store (0x01, Index (Local0, 0x01))
                        Store (DAT0, Index (Local0, 0x02))
                    }

                    If (LEqual (Local4, 0x07))
                    {
                        Store (0x01, Index (Local0, 0x01))
                        Store (DAT0, Index (Local0, 0x02))
                    }

                    If (LEqual (Local4, 0x09))
                    {
                        Store (0x02, Index (Local0, 0x01))
                        Store (DAT1, Local2)
                        ShiftLeft (Local2, 0x08, Local2)
                        Add (Local2, DAT0, Local2)
                        Store (Local2, Index (Local0, 0x02))
                    }

                    If (LEqual (Local4, 0x0B))
                    {
                        Store (SWBD (0x01F4), Local1)
                        If (LNotEqual (Local1, 0x00))
                        {
                            Store (Local1, Index (Local0, 0x00))
                        }
                        Else
                        {
                            Store (DAT0, Index (Local0, 0x01))
                            Store (DAT0, Local1)
                            Store (HCNT, Local2)
                            Store (0x00, Local2)
                            While (LLess (Local2, Local1))
                            {
                                Add (0x02, Local2, Local3)
                                Store (BLKD, Index (Local0, Local3))
                                Add (0x01, Local2, Local2)
                            }

                            Store (Or (HSTS, 0x80), HSTS)
                        }
                    }
                }

                Store (And (HCNT, 0x5F), HCNT)
                Release (SBX0)
            }

            Return (Local0)
        }

        Method (SBW, 5, NotSerialized)
        {
            Store (Package (0x01)
                {
                    0x07
                }, Local0)
            Store (And (Arg0, 0x5F), Local4)
            If (LNotEqual (Local4, 0x02))
            {
                If (LNotEqual (Local4, 0x04))
                {
                    If (LNotEqual (Local4, 0x06))
                    {
                        If (LNotEqual (Local4, 0x08))
                        {
                            If (LNotEqual (Local4, 0x0A))
                            {
                                Store (0x19, Index (Local0, 0x00))
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            If (LEqual (Acquire (SBX0, 0xFFFF), 0x00))
            {
                Store (ShiftLeft (Arg1, 0x01), HADD)
                Store (Arg2, HCMD)
                Store (Or (HSTS, 0x1F), HSTS)
                Store (And (Arg0, 0xA0), Local1)
                Store (Or (And (HCNT, 0x5F), Local1), HCNT)
                If (LEqual (Local4, 0x02))
                {
                    Store (Or (And (HCNT, 0xA0), 0x40), HCNT)
                }

                If (LEqual (Local4, 0x04))
                {
                    Store (Or (And (HCNT, 0xA0), 0x44), HCNT)
                }

                If (LEqual (Local4, 0x06))
                {
                    Store (Arg4, DAT0)
                    Store (Or (And (HCNT, 0xA0), 0x48), HCNT)
                }

                If (LEqual (Local4, 0x08))
                {
                    And (Arg4, 0xFF, DAT0)
                    ShiftRight (Arg4, 0x08, DAT1)
                    Store (Or (And (HCNT, 0xA0), 0x4C), HCNT)
                }

                If (LEqual (Local4, 0x0A))
                {
                    Store (Or (HSTS, 0x80), HSTS)
                    Store (HCNT, Local1)
                    Store (Arg3, DAT0)
                    Store (0x00, Local2)
                    While (LLess (Local2, Arg3))
                    {
                        Store (Index (Arg4, Local2), BLKD)
                        Add (0x01, Local2, Local2)
                    }

                    Store (Or (And (HCNT, 0xA0), 0x54), HCNT)
                }

                Store (SWTC (0x03E8), Index (Local0, 0x00))
                Store (And (HCNT, 0x5F), HCNT)
                Release (SBX0)
            }

            Return (Local0)
        }
    }

    Scope (\_SB.PCI0.SMB)
    {
        Name (ASD, Buffer (0x04)
        {
            0xFF, 0xFF, 0xFF, 0xFF
        })
        Device (OW00)
        {
            Name (_HID, "MGMT201")
            Name (_UID, 0x02010300)
            Method (_STA, 0, NotSerialized)
            {
                Return (ASFE)
            }

            Method (INFO, 0, NotSerialized)
            {
                Name (BUFF, Buffer (0x1A)
                {
                    /* 0000 */    0x02, 0x10, 0x01, 0x03, 0x00, 0x04, 0x01, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x01, 
                    /* 0010 */    0x03, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x01
                })
                Store (WTQ (), Local0)
                Store (Local0, Index (BUFF, 0x14))
                Return (BUFF)
            }

            Method (WTV, 0, NotSerialized)
            {
                Return (0x80000000)
            }

            Method (WTR, 0, NotSerialized)
            {
            }

            Method (WTQ, 0, NotSerialized)
            {
                Store (0xAF, \_SB.PCI0.LPC0.BCMD)
                Store (0x02, \_SB.PCI0.LPC0.DID)
                Store (Zero, \_SB.PCI0.LPC0.SMIC)
                Return (\_SB.PCI0.LPC0.INFO)
            }

            Method (WTC, 1, NotSerialized)
            {
                Store (0x00, Local1)
                Store (0x01, Local2)
                While (LNotEqual (Local2, 0xFF))
                {
                    Store (Index (\_SB.PCI0.SMB.ASD, Local1), Local2)
                    If (LNotEqual (Local2, 0xFF))
                    {
                        STOP (Local2)
                        STRT (Local2, Arg0)
                        Add (Local1, 0x01, Local1)
                    }
                }
            }

            Method (WAQ, 0, NotSerialized)
            {
                Return (0x01)
            }

            Method (WAC, 1, NotSerialized)
            {
                If (LEqual (Arg0, 0x00))
                {
                    Store (0x00, Local1)
                    Store (0x01, Local2)
                    While (LNotEqual (Local2, 0xFF))
                    {
                        Store (Index (\_SB.PCI0.SMB.ASD, Local1), Local2)
                        If (LNotEqual (Local2, 0xFF))
                        {
                            STOP (Local2)
                            Add (Local1, 0x01, Local1)
                        }
                    }
                }
            }

            Name (MSG, Buffer (0x20) {})
            Method (STRT, 2, NotSerialized)
            {
                Store (0x13, Index (MSG, 0x00))
                Store (0x10, Index (MSG, 0x01))
                Store (And (Arg1, 0xFF), Index (MSG, 0x02))
                Store (ShiftRight (Arg1, 0x08), Index (MSG, 0x03))
                Store (0x20, Index (MSG, 0x04))
                Store (0x6F, Index (MSG, 0x05))
                Store (0x10, Index (MSG, 0x06))
                Store (0x68, Index (MSG, 0x07))
                Store (0x10, Index (MSG, 0x08))
                Store (0xFF, Index (MSG, 0x09))
                Store (0xFF, Index (MSG, 0x0A))
                Store (0x23, Index (MSG, 0x0B))
                Store (0x00, Index (MSG, 0x0C))
                \_SB.PCI0.SMB.SBW (0x0A, Arg0, 0x02, 0x0D, MSG)
            }

            Method (STOP, 1, NotSerialized)
            {
                Store (0x14, Index (MSG, 0x00))
                Store (0x10, Index (MSG, 0x01))
                \_SB.PCI0.SMB.SBW (0x0A, Arg0, 0x02, 0x02, MSG)
            }
        }

        Device (OW01)
        {
            Name (_HID, "MGMT201")
            Name (_UID, 0x02010400)
            Method (_STA, 0, NotSerialized)
            {
                Return (ASFE)
            }

            Method (INFO, 0, NotSerialized)
            {
                Name (BUFF, Buffer (0x1A)
                {
                    /* 0000 */    0x02, 0x10, 0x01, 0x04, 0x00, 0x04, 0x01, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x01, 
                    /* 0010 */    0x03, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x01
                })
                Store (WTQ (), Local0)
                Store (Local0, Index (BUFF, 0x14))
                Return (BUFF)
            }

            Method (WTV, 0, NotSerialized)
            {
                Return (\_SB.PCI0.SMB.OW00.WTV ())
            }

            Method (WTR, 0, NotSerialized)
            {
                Return (\_SB.PCI0.SMB.OW00.WTR ())
            }

            Method (WTQ, 0, NotSerialized)
            {
                Return (\_SB.PCI0.SMB.OW00.WTQ ())
            }

            Method (WTC, 1, NotSerialized)
            {
                Return (\_SB.PCI0.SMB.OW00.WTC (Arg0))
            }

            Method (WAQ, 0, NotSerialized)
            {
                Return (\_SB.PCI0.SMB.OW00.WAQ ())
            }

            Method (WAC, 1, NotSerialized)
            {
                Return (\_SB.PCI0.SMB.OW00.WAC (Arg0))
            }
        }
    }

    Scope (\_SB)
    {
        Name (ASFE, 0x00)
        Device (ASF)
        {
            Name (_HID, "ASF0001")
            Method (_STA, 0, NotSerialized)
            {
                Return (ASFE)
            }

            Method (GPWT, 0, NotSerialized)
            {
                Store (0xAF, \_SB.PCI0.LPC0.BCMD)
                Store (0x01, \_SB.PCI0.LPC0.DID)
                Store (Zero, \_SB.PCI0.LPC0.SMIC)
                Return (\_SB.PCI0.LPC0.INFO)
            }

            Method (SPWT, 1, NotSerialized)
            {
                Store (0xAF, \_SB.PCI0.LPC0.BCMD)
                Store (0x02, \_SB.PCI0.LPC0.DID)
                Store (Arg0, \_SB.PCI0.LPC0.INFO)
                Store (Zero, \_SB.PCI0.LPC0.SMIC)
            }
        }
    }
}

