/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of a1650, Fri Sep 14 10:15:47 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000490B (18699)
 *     Revision         0x01
 *     OEM ID           "FUJ   "
 *     OEM Table ID     "W37     "
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x0100000E (16777230)
 */
DefinitionBlock ("a1650.aml", "DSDT", 1, "FUJ   ", "W37     ", 0x06040000)
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
    Name (\FSTS, 0x00)
    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00008010, 0x06) {}
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
    OperationRegion (\DEBG, SystemIO, 0x80, 0x01)
    Field (\DEBG, ByteAcc, NoLock, Preserve)
    {
        DBGP,   8
    }

    OperationRegion (\PMIO, SystemIO, 0x0CD6, 0x02)
    Field (\PMIO, ByteAcc, NoLock, Preserve)
    {
        PIDX,   8, 
        PDAT,   8
    }

    OperationRegion (\P01, SystemIO, 0x8001, 0x01)
    Field (\P01, ByteAcc, NoLock, Preserve)
    {
        PST1,   8
    }

    Name (HTTX, 0x00)
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
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0x1BEAFF04, 0x00000001)
        Field (OSTY, AnyAcc, NoLock, Preserve)
        {
            TPOS,   8
        }

        Method (OSTP, 0, NotSerialized)
        {
            If (LEqual (^OSTB, Ones))
            {
                If (CondRefOf (\_OSI, Local0))
                {
                    If (\_OSI ("Windows 2001.1"))
                    {
                        Store (0x20, ^OSTB)
                        Store (0x20, ^TPOS)
                    }
                    Else
                    {
                        If (\_OSI ("Windows 2001 SP1"))
                        {
                            Store (0x10, ^OSTB)
                            Store (0x10, ^TPOS)
                        }
                        Else
                        {
                            If (\_OSI ("Windows 2001"))
                            {
                                Store (0x08, ^OSTB)
                                Store (0x08, ^TPOS)
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
        Store (DEAX, \_SB.PCI0.LPC0.WNVA)
        Store (DEBX, \_SB.PCI0.LPC0.WNVB)
        Store (DECX, \_SB.PCI0.LPC0.WNVC)
        Store (DEDX, \_SB.PCI0.LPC0.WNVD)
        Store (0x8F, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        Concatenate (\_SB.PCI0.LPC0.WNVA, \_SB.PCI0.LPC0.WNVB, Local0)
        Concatenate (\_SB.PCI0.LPC0.WNVC, \_SB.PCI0.LPC0.WNVD, Local1)
        Concatenate (Local0, Local1, B2ED)
        Store (\_SB.PCI0.LPC0.WFLG, Index (B2ED, 0x10))
        Release (MSMI)
        Return (B2ED)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, DBGP)
        Store (0x01, \LIDF)
        PHSR (0x86, 0x00)
        If (LGreaterEqual (Arg0, 0x03))
        {
            Store (RBEC (0x71), Local0)
            Or (Local0, 0x08, Local0)
            WBEC (0x71, Local0)
            Sleep (0x03E8)
        }

        If (LEqual (Arg0, 0x04))
        {
            PHSR (0x82, 0x00)
            Store (\_SB.PCI0.SMB.RVID, Local1)
            If (LGreaterEqual (Local1, 0x10))
            {
                Store (Zero, \_SB.PCI0.SMB.RSTU)
            }
        }

        If (LEqual (Arg0, 0x05))
        {
            PHSR (0x83, 0x00)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (Arg0, DBGP)
        \_SB.PCI0.LPC0.EC0.TINI ()
        Store (\_SB.PCI0.LPC0.EC0.SILS, \_TZ.PSVA)
        If (LEqual (Arg0, 0x03))
        {
            Store (0x61, PIDX)
            Store (PDAT, Local0)
            And (Local0, 0x80, Local0)
            PHSR (0x87, 0x00)
            If (LEqual (Local0, 0x00))
            {
                Notify (\_SB.SLPB, 0x02)
            }
        }

        Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x81)
    }

    Scope (\_GPE)
    {
        Method (_L06, 0, NotSerialized)
        {
        }
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

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Method (_PSV, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x20, \_SB.PCI0.LPC0.EC0.TIID)
                    Store (\_SB.PCI0.LPC0.EC0.TSP0, Local0)
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

        ThermalZone (TZS2)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPC0.EC0.THS2, Local0)
                }
                Else
                {
                    Store (RBEC (0xAA), Local0)
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x20, \_SB.PCI0.LPC0.EC0.TIID)
                    Store (\_SB.PCI0.LPC0.EC0.TSC2, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x20)
                    Store (RBEC (0xD5), Local0)
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

            If (LGreaterEqual (Local0, 0x78))
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

        Device (AMW0)
        {
            Name (_HID, "*pnp0c14")
            Name (_UID, 0x00)
            Name (WLID, 0x00)
            Name (WLMP, 0x00)
            Name (_WDG, Buffer (0x3C)
            {
                0x81, 0x17, 0xF4, 0xD9, 0x33, 0xF6, 0x00, 0x44, 
                0x93, 0x55, 0x60, 0x17, 0x70, 0xBE, 0xC5, 0x10, 
                0x41, 0x41, 0x01, 0x00,
                0x1D, 0x37, 0xC3, 0x67, 0xA3, 0x95, 0x37, 0x4C, 
                0xBB, 0x61, 0xDD, 0x47, 0xB4, 0x91, 0xDA, 0xAB, 
                0x41, 0x42, 0x01, 0x02,
                0x71, 0xBF, 0xD1, 0x40, 0x2D, 0xA8, 0x59, 0x4E, 
                0xA1, 0x68, 0x39, 0x85, 0xE0, 0x3B, 0x2E, 0x87, 
                0xB0, 0x00, 0x01, 0x08
            })
            Name (B0ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            Name (B1ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            Method (_WED, 1, NotSerialized)
            {
                Store (0xB0, DBGP)
                If (LEqual (Arg0, 0xB0))
                {
                    Store (WLID, B0ED)
                    Return (B0ED)
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
                Return (WH15 (Arg1, Arg2))
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (_UID, 0x01)
            Name (_BBN, 0x00)
            Method (_INI, 0, NotSerialized)
            {
                \_SB.OSTP ()
            }

            OperationRegion (K8ST, SystemMemory, 0x1BEAFF74, 0x00000048)
            Field (K8ST, AnyAcc, Lock, Preserve)
            {
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
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y18, AddressRangeMemory, TypeStatic)
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

                CreateDWordField (RSRC, \_SB.PCI0._Y18._MIN, BTMN)
                CreateDWordField (RSRC, \_SB.PCI0._Y18._LEN, BTLN)
                Store (TOML, BTMN)
                Add (Not (BTMN), 0x01, BTLN)
                Return (RSRC)
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (MEM1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y19)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y1A)
                })
                Method (_CRS, 0, NotSerialized)
                {
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y19._BAS, MB01)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y19._LEN, ML01)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._BAS, MB02)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._LEN, ML02)
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
                    Return (Package (0x06)
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
                    Return (Package (0x06)
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
            Field (BAR1, ByteAcc, NoLock, Preserve)
            {
                Z009,   32
            }

            Device (OHC1)
            {
                Name (_ADR, 0x00130000)
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130001)
            }

            Device (EHCI)
            {
                Name (_ADR, 0x00130002)
            }

            Device (SATA)
            {
                Name (_ADR, 0x00120000)
                Name (B5EN, 0x00)
                Name (BA_5, 0x00)
                OperationRegion (SATX, PCI_Config, 0x00, 0x28)
                Field (SATX, AnyAcc, NoLock, Preserve)
                {
                    VIDI,   32, 
                            Offset (0x24), 
                    BA05,   32
                }

                Method (GBAA, 0, NotSerialized)
                {
                    Store (BA_5, B5EN)
                    If (LEqual (BA_5, 0xFFFFFFFF))
                    {
                        Store (0x00, B5EN)
                        Return (0xFFF80000)
                    }
                    Else
                    {
                        Store (0x01, B5EN)
                        Return (BA_5)
                    }
                }

                OperationRegion (BAR5, SystemMemory, GBAA, 0x0200)
                Field (BAR5, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x104), 
                    CSTX,   1, 
                    CST0,   1, 
                            Offset (0x10A), 
                    STA0,   1, 
                            Offset (0x184), 
                    CSTY,   1, 
                    CST1,   1, 
                            Offset (0x18A), 
                    STA1,   1
                }

                Method (_INI, 0, NotSerialized)
                {
                    Store (BA05, BA_5)
                    GBAA ()
                    If (B5EN)
                    {
                        If (\_SB.PCI0.SATA.STA0)
                        {
                            Store (\_SB.PCI0.SATA.STA0, \_SB.PCI0.SATA.STA0)
                        }

                        If (\_SB.PCI0.SATA.STA1)
                        {
                            Store (\_SB.PCI0.SATA.STA1, \_SB.PCI0.SATA.STA1)
                        }
                    }
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (BA05, BA_5)
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (\_SB.PCI0.SATA.CST0)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (BA05, BA_5)
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (\_SB.PCI0.SATA.CST1)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                    }
                }
            }

            Device (SAT2)
            {
                Name (_ADR, 0x00110000)
                Name (B5EN, 0x00)
                Name (BA_5, 0x00)
                OperationRegion (SATX, PCI_Config, 0x00, 0x28)
                Field (SATX, AnyAcc, NoLock, Preserve)
                {
                    VIDI,   32, 
                            Offset (0x24), 
                    BA05,   32
                }

                Method (GBAA, 0, NotSerialized)
                {
                    Store (BA_5, B5EN)
                    If (LEqual (BA_5, 0xFFFFFFFF))
                    {
                        Store (0x00, B5EN)
                        Return (0xFFF80000)
                    }
                    Else
                    {
                        Store (0x01, B5EN)
                        Return (BA_5)
                    }
                }

                OperationRegion (BAR5, SystemMemory, GBAA, 0x0200)
                Field (BAR5, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x104), 
                    CSTX,   1, 
                    CST0,   1, 
                            Offset (0x10A), 
                    STA0,   1, 
                            Offset (0x184), 
                    CSTY,   1, 
                    CST1,   1, 
                            Offset (0x18A), 
                    STA1,   1
                }

                Method (_INI, 0, NotSerialized)
                {
                    Store (BA05, BA_5)
                    GBAA ()
                    If (B5EN)
                    {
                        If (\_SB.PCI0.SAT2.STA0)
                        {
                            Store (\_SB.PCI0.SAT2.STA0, \_SB.PCI0.SAT2.STA0)
                        }

                        If (\_SB.PCI0.SAT2.STA1)
                        {
                            Store (\_SB.PCI0.SAT2.STA1, \_SB.PCI0.SAT2.STA1)
                        }
                    }
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (BA05, BA_5)
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (\_SB.PCI0.SAT2.CST0)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (BA05, BA_5)
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (\_SB.PCI0.SAT2.CST1)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                    }
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x00140000)
                OperationRegion (Z00A, PCI_Config, 0x08, 0x01)
                Field (Z00A, ByteAcc, NoLock, Preserve)
                {
                    RVID,   8
                }

                OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                    INPM,   8, 
                    DAPM,   8
                }

                IndexField (INPM, DAPM, ByteAcc, NoLock, Preserve)
                {
                        ,   1, 
                    TM1E,   1, 
                    TM2E,   1, 
                            Offset (0x01), 
                        ,   1, 
                    TM1S,   1, 
                    TM2S,   1, 
                            Offset (0x04), 
                        ,   7, 
                    SLPS,   1, 
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
                            Offset (0x36), 
                        ,   6, 
                    GVT6,   1, 
                            Offset (0x37), 
                        ,   4, 
                    GPX1,   1, 
                        ,   1, 
                    GPX3,   1, 
                            Offset (0x38), 
                        ,   1, 
                    GPX4,   1, 
                    GPX5,   1, 
                        ,   1, 
                    GPX6,   1, 
                            Offset (0x55), 
                    SPRE,   1, 
                            Offset (0x65), 
                        ,   5, 
                    RSTU,   1, 
                            Offset (0x68), 
                        ,   3, 
                    TPDE,   1, 
                        ,   1
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
                Field (IDE, WordAcc, NoLock, Preserve)
                {
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
                            Return (Z006)
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
                        Store (^^SPIT, VPIT)
                        Store (^^SMDT, VMDT)
                        Store (^^SPIC, VPIC)
                        Store (^^SUDC, VUDC)
                        Store (^^SUDM, VUDM)
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
                        Store (VPIT, ^^SPIT)
                        Store (VMDT, ^^SMDT)
                        Store (VPIM, ^^SPIM)
                        Store (VUDC, ^^SUDC)
                        Store (VUDM, ^^SUDM)
                    }

                    Device (S_D0)
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
                            Store (^^^SMDT, VMDT)
                            Store (^^^SPIM, VPIM)
                            Store (^^^SUDC, VUDC)
                            Store (^^^SUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (S_D1)
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
                            Store (^^^SMDT, VMDT)
                            Store (^^^SPIM, VPIM)
                            Store (^^^SUDC, VUDC)
                            Store (^^^SUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        And (SPIC, 0x01, Local0)
                        If (LAnd (Local0, 0x01))
                        {
                            Return (Z006)
                        }
                        Else
                        {
                            Return (Z005)
                        }
                    }
                }
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)
                OperationRegion (LPC0, PCI_Config, 0x00, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x44), 
                    LC44,   8, 
                    LC45,   8
                }

                Mutex (PSMX, 0x00)
                OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
                Field (PIRQ, ByteAcc, NoLock, Preserve)
                {
                    PIID,   8, 
                    PIDA,   8
                }

                IndexField (PIID, PIDA, ByteAcc, NoLock, Preserve)
                {
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    PIRS,   8, 
                    PIR5,   8, 
                    PIR6,   8, 
                    PIR7,   8, 
                    PIR8,   8, 
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
                Method (DSPI, 0, NotSerialized)
                {
                    Store (0x00, PIRA)
                    Store (0x00, PIRB)
                    Store (0x00, PIRC)
                    Store (0x00, PIRD)
                    Store (0x00, PIRS)
                    Store (0x00, PIR5)
                    Store (0x00, PIR6)
                    Store (0x00, PIR7)
                    Store (0x00, PIR8)
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

                OperationRegion (LPCR, PCI_Config, 0x44, 0x02)
                Field (LPCR, ByteAcc, NoLock, Preserve)
                {
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

                Device (PS2K)
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
                    Name (_HID, EisaId ("SYN0305"))
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

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_CRS, ResourceTemplate ()
                    {
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
                            0x1200,             // Range Minimum
                            0x1200,             // Range Maximum
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
                            0xFFF80000,         // Address Base
                            0x00080000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y1B)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LGreaterEqual (TPOS, 0x04))
                        {
                            CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1B._BAS, BARX)
                            CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1B._LEN, GALN)
                            Store (0x1000, GALN)
                            Store (\_SB.PCI0.Z009, Local0)
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
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x1BEAFDE4, 0x00000120)
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
                    WFLG,   32
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x03)
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
                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x0A), 
                            ,   1, 
                        BLNK,   1, 
                                Offset (0x70), 
                            ,   1, 
                        KLID,   1, 
                            ,   3, 
                        KACS,   1, 
                                Offset (0x71), 
                            ,   2, 
                        EZ4D,   1, 
                            ,   1, 
                        KBID,   3, 
                                Offset (0x72), 
                            ,   2, 
                        KEYW,   1, 
                        TPDW,   1, 
                        LIDW,   1, 
                        BL2W,   1
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x01), 
                        TIID,   8, 
                                Offset (0x10), 
                            ,   1, 
                        KTEE,   1, 
                                Offset (0x11), 
                        KPPS,   1, 
                                Offset (0x15), 
                        SILS,   1, 
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

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x92), 
                        KTAF,   8
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x92), 
                        THSL,   4
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
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
                        Store (0x00, KTAF)
                        Store (0x01, KTEE)
                        Store (0x01, KPPS)
                    }

                    Method (_Q16, 0, NotSerialized)
                    {
                        Store (0x01, DBGP)
                        LAMN (0x01)
                    }

                    Method (_Q24, 0, NotSerialized)
                    {
                        Store (0x24, DBGP)
                        LAMN (0x24)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Store (0x25, DBGP)
                        LAMN (0x25)
                    }

                    Method (_Q17, 0, NotSerialized)
                    {
                        Store (0x17, DBGP)
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q19, 0, NotSerialized)
                    {
                        Store (0x19, DBGP)
                        LAMN (0x05)
                    }

                    Method (_Q80, 0, NotSerialized)
                    {
                        Store (0x80, DBGP)
                        Store (0x02, \VDSS)
                        Z00B ()
                    }

                    Method (_Q81, 0, NotSerialized)
                    {
                        Store (0x81, DBGP)
                        Store (0x01, \VDSS)
                        Z00B ()
                    }

                    Method (_Q82, 0, NotSerialized)
                    {
                        Store (0x82, DBGP)
                        Store (0x03, \VDSS)
                        Z00B ()
                    }

                    Method (Z00B, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.AGP.VGA, 0x80)
                    }

                    Method (_Q10, 0, NotSerialized)
                    {
                        Store (0x30, DBGP)
                        LAMN (0x30)
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store (0x36, DBGP)
                        LAMN (0x36)
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        Store (0x6E, DBGP)
                        LAMN (0x6E)
                    }

                    Method (_Q15, 0, NotSerialized)
                    {
                        Store (0x15, DBGP)
                        \_TZ.SPSV (0x00, SILS)
                        Notify (\_TZ.TZS0, 0x80)
                    }

                    Method (_Q23, 0, NotSerialized)
                    {
                        Store (0x23, DBGP)
                        LAMN (0x23)
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Store (0x32, DBGP)
                        LAMN (0x32)
                        Store (0x00, KCTT)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x33, DBGP)
                        Store (0x00, KCSS)
                        NTMR ()
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x34, DBGP)
                        Store (0x01, KCSS)
                        NTMR ()
                    }

                    Method (_Q35, 0, NotSerialized)
                    {
                        Store (0x35, DBGP)
                        LAMN (0x35)
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
                        \_TZ.SPSV (0x10, 0x01)
                        Notify (\_TZ.TZS0, 0x80)
                    }

                    Method (_Q3A, 0, NotSerialized)
                    {
                        Store (0x3A, DBGP)
                        Store (0x00, KPPS)
                        \_TZ.SPSV (0x10, 0x00)
                        Notify (\_TZ.TZS0, 0x80)
                    }

                    Method (_Q40, 0, NotSerialized)
                    {
                        Store (0x40, DBGP)
                        LAMN (0x40)
                        Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x81)
                    }

                    Method (_Q41, 0, NotSerialized)
                    {
                        Store (0x41, DBGP)
                        Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x81)
                    }

                    Method (_Q48, 0, NotSerialized)
                    {
                        Store (0x48, DBGP)
                        HKEY (0x48)
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
                        Notify (\_SB.LID0, 0x80)
                    }

                    Method (_Q53, 0, NotSerialized)
                    {
                        Notify (\_SB.LID0, 0x80)
                    }

                    Method (NTMR, 0, NotSerialized)
                    {
                        Notify (\_TZ.TZS0, 0x80)
                        Notify (\_TZ.TZS2, 0x80)
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x02), 
                        NBID,   8, 
                                Offset (0x88), 
                        NB0A,   1, 
                            ,   3, 
                        NBL2,   1, 
                                Offset (0x89), 
                        NB1A,   1
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x88), 
                        NB0S,   8, 
                        NB1S,   8
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
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
                        BSBS,   8
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
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
                        BSCH,   64, 
                        BSMF,   64
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
                            Store (Arg0, NBID)
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
                            Store (BSDV, Index (Arg1, 0x04))
                            Divide (Local2, 0x64, Local7, Local6)
                            Multiply (Local6, 0x05, Local3)
                            Store (Local3, Index (Arg1, 0x05))
                            Multiply (Local6, 0x03, Local4)
                            Store (Local4, Index (Arg1, 0x06))
                            Subtract (Local3, Local4, Index (Arg1, 0x07))
                            Subtract (Local2, Local3, Index (Arg1, 0x08))
                            Or (Arg0, 0x01, NBID)
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
                            Store ("Bat 6Cell", Index (Arg1, 0x09))
                            And (Arg0, 0xF0, NBID)
                            Or (Arg0, 0x04, NBID)
                            Store (BSCH, Index (Arg1, 0x0B))
                            Store ("SMP-PA", Index (Arg1, 0x0C))
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

                        If (NBL2)
                        {
                            Or (Local0, 0x04, Local0)
                        }

                        If (And (Arg1, 0x01))
                        {
                            And (Arg0, 0xF0, NBID)
                            Store (BSAC, Local1)
                            If (Arg2)
                            {
                                Multiply (BSRC, 0x0A, Local2)
                            }
                            Else
                            {
                                Store (BSRC, Local2)
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
                            }
                            Else
                            {
                                ShiftRight (RBEC (0x88), 0x00, Local0)
                                And (Local0, 0x01, Local1)
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
                            If (\ECON)
                            {
                                Store (NB0A, Local0)
                            }
                            Else
                            {
                                ShiftRight (RBEC (0x88), 0x00, Local0)
                            }

                            And (Local0, 0x01, Local6)
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
                                ShiftRight (RBEC (0x70), 0x05, Local0)
                                And (Local0, 0x01, Local1)
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
            }

            Device (EXP1)
            {
                Name (_ADR, 0x00020000)
                OperationRegion (P1CS, PCI_Config, 0x40, 0xC0)
                Field (P1CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x20), 
                    RID1,   16, 
                    PSP1,   1, 
                    PPP1,   1
                }

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
                }
            }

            Device (EXP2)
            {
                Name (_ADR, 0x00030000)
                OperationRegion (P2CS, PCI_Config, 0x40, 0xC0)
                Field (P2CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x20), 
                    RID2,   16, 
                    PSP2,   1, 
                    PPP2,   1
                }

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

            Device (P2P)
            {
                Name (_ADR, 0x00140004)
                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x05)
                        {
                            Package (0x04)
                            {
                                0x0007FFFF, 
                                0x00, 
                                0x00, 
                                0x17
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x02, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x03, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x05)
                        {
                            Package (0x04)
                            {
                                0x0007FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKH, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (AUDO)
            {
                Name (_ADR, 0x00140005)
            }

            Device (MODM)
            {
                Name (_ADR, 0x00140006)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x04
                })
            }

            Device (AGP)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
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
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKA, 
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
                }
            }
        }
    }
}

