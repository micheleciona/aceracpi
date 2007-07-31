/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20030918
 *
 * Disassembly of dsdt.orig.dat, Tue Feb  3 20:32:10 2004
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "INTEL", "SolanoM2", 100925440)
{
    OperationRegion (DBG, SystemIO, 0x80, 0x01)
    Field (DBG, ByteAcc, NoLock, Preserve)
    {
        DEBG,   8
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x00, 0x80001010, 0x05) {}
    }

    Name (\_S0, Package (0x02)
    {
        0x00, 
        0x00
    })
    Name (\_S1, Package (0x02)
    {
        0x02, 
        0x02
    })
    Name (\_S4, Package (0x02)
    {
        0x06, 
        0x06
    })
    Name (\_S5, Package (0x02)
    {
        0x07, 
        0x07
    })
    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, DEBG)
        If (LEqual (Arg0, 0x04))
        {
            If (LNot (LEqual (SizeOf (\_OS), 0x11)))
            {
                Store (0x8C, \_SB.BCMD)
                Store (Zero, \_SB.SMIC)
            }
        }

        Store (Arg0, \_SB.INF)
        Store (0x80, \_SB.BCMD)
        Store (Zero, \_SB.SMIC)
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store ("WAK", Debug)
        If (LNot (LEqual (SizeOf (\_OS), 0x14)))
        {
            Store (0x01, \_SB.PCI0.HUB.BME2)
        }

        If (LEqual (Arg0, 0x01))
        {
            Store (SizeOf (\_OS), \_SB.INF)
            Store (0x81, \_SB.BCMD)
            Store (Zero, \_SB.SMIC)
            Store (\_SB.INF, Local1)
            Store (Local1, DEBG)
            If (LOr (LNot (LEqual (Local1, 0x04)), LEqual (SizeOf (\_OS), 0x11)))
            {
                Notify (\_SB.SLPB, 0x02)
            }

            If (LEqual (Local1, 0x81))
            {
                Notify (\_SB.LID, 0x80)
            }

            If (LEqual (Local1, 0x7A))
            {
                Store ("Battery A critical low: ----- ", Debug)
                Notify (\_SB.BATA, 0x80)
            }

            If (LEqual (Local1, 0x7B))
            {
                Store ("Battery B critical low: ----- ", Debug)
                Notify (\_SB.BATB, 0x80)
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            Notify (\_SB.SLPB, 0x02)
        }
    }

    Scope (_SI)
    {
        Method (_MSG, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x00))
            {
                Store (0x00, \_SB.INF)
            }
            Else
            {
                Store (0x01, \_SB.INF)
            }

            Store (0x89, \_SB.BCMD)
            Store (Zero, \_SB.SMIC)
        }
    }

    Scope (_TZ)
    {
        Name (TBSE, 0x0AAC)
        Name (DTMP, 0x0CA0)
        Name (DCRT, 0x0DCC)
        Name (DAC0, 0x0D36)
        Name (DPSV, 0x0D68)
        Name (TCON, 0x1088)
        ThermalZone (THRM)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.EC0.ECOK)
                {
                    Store ("SYST of _TMP =", Debug)
                    Store (0x88, \_SB.BCMD)
                    Store (Zero, \_SB.SMIC)
                    Store (\_SB.INF, Local0)
                    Store (Local0, Debug)
                    If (LAnd (LGreater (Local0, 0x00), LLess (Local0, 0x80)))
                    {
                        Return (Add (Multiply (Local0, 0x0A), TBSE))
                    }
                    Else
                    {
                        Return (DTMP)
                    }
                }
                Else
                {
                    Return (DTMP)
                }
            }

            Method (_PSV, 0, NotSerialized)
            {
                Store (TCON, Local0)
                If (\_SB.PCI0.LPC0.EC0.ECOK)
                {
                    Store (\_SB.PCI0.LPC0.EC0.Z000, Local1)
                    If (Local1)
                    {
                        Store (Add (Multiply (Local1, 0x0A), TBSE), Local0)
                    }
                }

                Return (Local0)
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.EC0.ECOK)
                {
                    Store ("T5SYS of _CRT =", Debug)
                    Store (\_SB.PCI0.LPC0.EC0.Z001, Debug)
                    If (\_SB.PCI0.LPC0.EC0.Z001)
                    {
                        Return (Add (Multiply (\_SB.PCI0.LPC0.EC0.Z001, 0x0A), TBSE))
                    }
                    Else
                    {
                        Return (DCRT)
                    }
                }
                Else
                {
                    Return (DCRT)
                }
            }

            Method (_SCP, 1, NotSerialized)
            {
                Store ("_SCP", Debug)
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Name (_TC1, 0x02)
            Name (_TC2, 0x05)
            Name (_TSP, 0x012C)
        }
    }

    Scope (_GPE)
    {
        Method (_L00, 0, NotSerialized)
        {
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.AC97, 0x02)
        }

        Method (_L08, 0, NotSerialized)
        {
            Notify (\_SB.SLPB, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.SLPB, 0x02)
            Notify (\_SB.PCI0.HUB, 0x02)
        }

        Method (_L18, 0, NotSerialized)
        {
            Store ("EC_SMI (GPI8)", Debug)
        }

        Method (_L17, 0, NotSerialized)
        {
        }
    }

    Scope (_SB)
    {
        OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
        Field (SMI0, AnyAcc, NoLock, Preserve)
        {
            SMIC,   8
        }

        OperationRegion (SMI1, SystemMemory, 0x0FE7FEBD, 0x00000090)
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
            INF,    8
        }

        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
            AccessAs (ByteAcc, 0x00), 
            Offset (0x05), 
            Z002,   16
        }

        Mutex (PSMX, 0x00)
        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            Name (_PRW, Package (0x02)
            {
                0x17, 
                0x01
            })
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_BBN, 0x00)
            Name (_ADR, 0x00)
            OperationRegion (REGS, PCI_Config, 0x40, 0xC0)
            Field (REGS, DWordAcc, NoLock, Preserve)
            {
                Offset (0x12), 
                DRP0,   4, 
                DRP1,   4, 
                Offset (0x14), 
                DRP2,   4, 
                Offset (0x18), 
                    ,   7, 
                HEN,    1, 
                PAM0,   8, 
                PAM1,   8, 
                PAM2,   8, 
                PAM3,   8, 
                PAM4,   8, 
                PAM5,   8, 
                PAM6,   8, 
                Offset (0x30), 
                    ,   6, 
                UMA,    2
            }

            Name (DMST, Package (0x10)
            {
                0x00, 
                0x20, 
                0x20, 
                0x30, 
                0x40, 
                0x40, 
                0x60, 
                0x80, 
                0x00, 
                0x80, 
                0x80, 
                0xC0, 
                0x0100, 
                0x0100, 
                0x0100, 
                0x0200
            })
            Name (RSRC, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,
                    0x0000,
                    0x00FF,
                    0x0000,
                    0x0100, 0x00)
                IO (Decode16, 0x0CF8, 0x0CF8, 0x01, 0x08)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,
                    0x0000,
                    0x0CF7,
                    0x0000,
                    0x0CF8, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000A0000,
                    0x000BFFFF,
                    0x00000000,
                    0x00020000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000C0000,
                    0x000C3FFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000C4000,
                    0x000C7FFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000C8000,
                    0x000CBFFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000CC000,
                    0x000CFFFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000D0000,
                    0x000D3FFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000D4000,
                    0x000D7FFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000D8000,
                    0x000DBFFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000DC000,
                    0x000DFFFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000E0000,
                    0x000E3FFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000E4000,
                    0x000E7FFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000E8000,
                    0x000EBFFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000EC000,
                    0x000EFFFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x00000000,
                    0x00000000,
                    0x00000000,
                    0x00000000, 0x00)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,
                    0x0D00,
                    0xFFFF,
                    0x0000,
                    0xF300, 0x00)
            })
            Method (_CRS, 0, Serialized)
            {
                Store (Zero, Local1)
                CreateDWordField (RSRC, 0x0193, BTMN)
                CreateDWordField (RSRC, 0x0197, BTMX)
                CreateDWordField (RSRC, 0x019F, BTLN)
                Store (DRP0, Local0)
                Store (DRP1, Local1)
                Store (DRP2, Local2)
                Add (DerefOf (Index (DMST, Local0)), DerefOf (Index (DMST, Local1)), Local0)
                Add (DerefOf (Index (DMST, Local2)), Local0, Local0)
                ShiftLeft (Local0, 0x14, Local0)
                Store (Local0, BTMN)
                Subtract (0xFEC00000, Local0, BTLN)
                Subtract (Add (BTMN, BTLN), 0x01, BTMX)
                CreateBitField (RSRC, 0x0250, C0RW)
                CreateDWordField (RSRC, 0x4F, C0MN)
                CreateDWordField (RSRC, 0x53, C0MX)
                CreateDWordField (RSRC, 0x5B, C0LN)
                Store (One, C0RW)
                If (LEqual (And (PAM1, 0x03), 0x01))
                {
                    Store (Zero, C0RW)
                }

                Store (Zero, C0LN)
                If (LNot (And (PAM1, 0x03)))
                {
                    Store (0x4000, C0LN)
                }

                CreateBitField (RSRC, 0x0328, C4RW)
                CreateDWordField (RSRC, 0x6A, C4MN)
                CreateDWordField (RSRC, 0x6E, C4MX)
                CreateDWordField (RSRC, 0x76, C4LN)
                Store (One, C4RW)
                If (LEqual (And (PAM1, 0x30), 0x10))
                {
                    Store (Zero, C4RW)
                }

                Store (Zero, C4LN)
                If (LNot (And (PAM1, 0x30)))
                {
                    Store (0x4000, C4LN)
                }

                CreateBitField (RSRC, 0x0400, C8RW)
                CreateDWordField (RSRC, 0x85, C8MN)
                CreateDWordField (RSRC, 0x89, C8MX)
                CreateDWordField (RSRC, 0x91, C8LN)
                Store (One, C8RW)
                If (LEqual (And (PAM2, 0x03), 0x01))
                {
                    Store (Zero, C8RW)
                }

                Store (Zero, C8LN)
                If (LNot (And (PAM2, 0x03)))
                {
                    Store (0x4000, C8LN)
                }

                CreateBitField (RSRC, 0x04D8, CCRW)
                CreateDWordField (RSRC, 0xA0, CCMN)
                CreateDWordField (RSRC, 0xA4, CCMX)
                CreateDWordField (RSRC, 0xAC, CCLN)
                Store (One, CCRW)
                If (LEqual (And (PAM2, 0x30), 0x10))
                {
                    Store (Zero, CCRW)
                }

                Store (Zero, CCLN)
                If (LNot (And (PAM2, 0x30)))
                {
                    Store (0x4000, CCLN)
                }

                CreateBitField (RSRC, 0x05B0, D0RW)
                CreateDWordField (RSRC, 0xBB, D0MN)
                CreateDWordField (RSRC, 0xBF, D0MX)
                CreateDWordField (RSRC, 0xC7, D0LN)
                Store (One, D0RW)
                If (LEqual (And (PAM3, 0x03), 0x01))
                {
                    Store (Zero, D0RW)
                }

                Store (Zero, D0LN)
                If (LNot (And (PAM3, 0x03)))
                {
                    Store (0x4000, D0LN)
                }

                CreateBitField (RSRC, 0x0688, D4RW)
                CreateDWordField (RSRC, 0xD6, D4MN)
                CreateDWordField (RSRC, 0xDA, D4MX)
                CreateDWordField (RSRC, 0xE2, D4LN)
                Store (One, D4RW)
                If (LEqual (And (PAM3, 0x30), 0x10))
                {
                    Store (Zero, D4RW)
                }

                Store (Zero, D4LN)
                If (LNot (And (PAM3, 0x30)))
                {
                    Store (0x4000, D4LN)
                }

                CreateBitField (RSRC, 0x0760, D8RW)
                CreateDWordField (RSRC, 0xF1, D8MN)
                CreateDWordField (RSRC, 0xF5, D8MX)
                CreateDWordField (RSRC, 0xFD, D8LN)
                Store (One, D8RW)
                If (LEqual (And (PAM4, 0x03), 0x01))
                {
                    Store (Zero, D8RW)
                }

                Store (Zero, D8LN)
                If (LNot (And (PAM4, 0x03)))
                {
                    Store (0x4000, D8LN)
                }

                CreateBitField (RSRC, 0x0838, DCRW)
                CreateDWordField (RSRC, 0x010C, DCMN)
                CreateDWordField (RSRC, 0x0110, DCMX)
                CreateDWordField (RSRC, 0x0118, DCLN)
                Store (One, DCRW)
                If (LEqual (And (PAM4, 0x30), 0x10))
                {
                    Store (Zero, DCRW)
                }

                Store (Zero, DCLN)
                If (LNot (And (PAM4, 0x30)))
                {
                    Store (0x4000, DCLN)
                }

                CreateBitField (RSRC, 0x0910, E0RW)
                CreateDWordField (RSRC, 0x0127, E0MN)
                CreateDWordField (RSRC, 0x012B, E0MX)
                CreateDWordField (RSRC, 0x0133, E0LN)
                Store (One, E0RW)
                If (LEqual (And (PAM5, 0x03), 0x01))
                {
                    Store (Zero, E0RW)
                }

                Store (Zero, E0LN)
                If (LNot (And (PAM5, 0x03)))
                {
                    Store (0x4000, E0LN)
                }

                CreateBitField (RSRC, 0x09E8, E4RW)
                CreateDWordField (RSRC, 0x0142, E4MN)
                CreateDWordField (RSRC, 0x0146, E4MX)
                CreateDWordField (RSRC, 0x014E, E4LN)
                Store (One, E4RW)
                If (LEqual (And (PAM5, 0x30), 0x10))
                {
                    Store (Zero, E4RW)
                }

                Store (Zero, E4LN)
                If (LNot (And (PAM5, 0x30)))
                {
                    Store (0x4000, E4LN)
                }

                CreateBitField (RSRC, 0x0AC0, E8RW)
                CreateDWordField (RSRC, 0x015D, E8MN)
                CreateDWordField (RSRC, 0x0161, E8MX)
                CreateDWordField (RSRC, 0x0169, E8LN)
                Store (One, E8RW)
                If (LEqual (And (PAM6, 0x03), 0x01))
                {
                    Store (Zero, E8RW)
                }

                Store (Zero, E8LN)
                If (LNot (And (PAM6, 0x03)))
                {
                    Store (0x4000, E8LN)
                }

                CreateBitField (RSRC, 0x0B98, ECRW)
                CreateDWordField (RSRC, 0x0178, ECMN)
                CreateDWordField (RSRC, 0x017C, ECMX)
                CreateDWordField (RSRC, 0x0184, ECLN)
                Store (One, ECRW)
                If (LEqual (And (PAM6, 0x30), 0x10))
                {
                    Store (Zero, ECRW)
                }

                Store (Zero, ECLN)
                If (LNot (And (PAM6, 0x30)))
                {
                    Store (0x4000, ECLN)
                }

                Return (RSRC)
            }

            Name (_PRT, Package (0x05)
            {
                Package (0x04)
                {
                    0x001FFFFF, 
                    0x00, 
                    \_SB.PCI0.LPC0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    \_SB.PCI0.LPC0.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x02, 
                    \_SB.PCI0.LPC0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x03, 
                    \_SB.PCI0.LPC0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x00, 
                    \_SB.PCI0.LPC0.LNKA, 
                    0x00
                }
            })
            Device (LVID)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, 0x01)
                Name (RSRC, ResourceTemplate ()
                {
                    Memory32Fixed (ReadOnly, 0x00000000, 0x00000000)
                })
                Method (_CRS, 0, Serialized)
                {
                    CreateDWordField (RSRC, 0x04, SBAS)
                    CreateDWordField (RSRC, 0x08, SLEN)
                    Store (DRP0, Local0)
                    Store (DRP1, Local1)
                    Add (DerefOf (Index (DMST, Local0)), DerefOf (Index (DMST, Local1)), Local0)
                    ShiftLeft (Local0, 0x14, Local0)
                    If (HEN)
                    {
                        Subtract (Local0, 0x00100000, Local0)
                    }

                    If (LEqual (UMA, 0x02))
                    {
                        Subtract (Local0, 0x00100000, SBAS)
                        Store (0x00180000, SLEN)
                    }

                    If (LEqual (UMA, 0x03))
                    {
                        Subtract (Local0, 0x00100000, SBAS)
                        Store (0x00100000, SLEN)
                    }

                    Return (RSRC)
                }
            }

            Device (GRFX)
            {
                Name (_ADR, 0x00020000)
                Name (SWIT, 0x01)
                Name (CRTA, 0x01)
                Name (LCDA, 0x01)
                Name (TOGF, 0x00)
                Method (_DOS, 1, NotSerialized)
                {
                    Store ("VGA --_DOS", Debug)
                    Store (Arg0, SWIT)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x00010100, 
                        0x00010200
                    })
                }

                Device (CRT)
                {
                    Method (_ADR, 0, NotSerialized)
                    {
                        Return (0x0100)
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store ("CRT --_DCS", Debug)
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
                        Store ("CRT --_DGS", Debug)
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
                        Store ("CRT --_DSS", Debug)
                    }
                }

                Device (LFP)
                {
                    Method (_ADR, 0, NotSerialized)
                    {
                        Return (0x0200)
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store ("LCD --_DCS", Debug)
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
                        Store ("LCD --_DGS", Debug)
                        Store (LCDA, Local0)
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
                        Store ("LCD --_DSS", Debug)
                    }
                }
            }

            Device (HUB)
            {
                Name (_ADR, 0x001E0000)
                OperationRegion (HUBR, PCI_Config, 0x00, 0xC0)
                Field (HUBR, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x04), 
                        ,   2, 
                    BME2,   1
                }

                Name (_PRT, Package (0x06)
                {
                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x00, 
                        \_SB.PCI0.LPC0.LNKF, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x01, 
                        \_SB.PCI0.LPC0.LNKG, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x02, 
                        \_SB.PCI0.LPC0.LNKF, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x03, 
                        \_SB.PCI0.LPC0.LNKG, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x00, 
                        \_SB.PCI0.LPC0.LNKE, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000FFFFF, 
                        0x00, 
                        \_SB.PCI0.LPC0.LNKA, 
                        0x00
                    }
                })
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x01
                })
            }

            Device (LPC0)
            {
                Name (_ADR, 0x001F0000)
                Method (DECD, 4, NotSerialized)
                {
                    Store (Arg0, Debug)
                }

                OperationRegion (REGS, PCI_Config, 0x40, 0xC0)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    PMBA,   16, 
                    Offset (0x18), 
                    GPBA,   16, 
                    Offset (0xB0), 
                        ,   5, 
                    FUND,   2
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x1D)
                    Name (ECOK, 0x00)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECOK)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0062, 0x0062, 0x01, 0x01)
                        IO (Decode16, 0x0066, 0x0066, 0x01, 0x01)
                    })
                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x04), 
                        CMCM,   8, 
                        CMD1,   8, 
                        CMD2,   8, 
                        CMD3,   8
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xAB), 
                        Z003,   1, 
                        LIDS,   1, 
                        ACS,    1, 
                            ,   3, 
                        Z004,   1, 
                        Z005,   1, 
                        Offset (0xAD), 
                            ,   1, 
                        Z006,   1, 
                        Z007,   1, 
                        Offset (0xB5), 
                        BSTA,   8, 
                        BSTB,   8, 
                        Offset (0xC2), 
                        BRCA,   16, 
                        LFCA,   16, 
                        PERA,   16, 
                        Offset (0xCA), 
                        BRCB,   16, 
                        LFCB,   16, 
                        PERB,   16, 
                        Z008,   8, 
                        Z009,   8, 
                        Z00A,   8, 
                        Z00B,   8, 
                        Z00C,   8, 
                        Z001,   8, 
                        Z00D,   8, 
                        Z00E,   8, 
                        Z00F,   8, 
                        Z00G,   8, 
                        Z000,   8, 
                        FAN0,   8, 
                        FAN1,   8, 
                        FAN2,   8, 
                            ,   3, 
                        Z00H,   1, 
                        Z00I,   1, 
                        Z00J,   1, 
                        Z00K,   1, 
                        Z00L,   1, 
                        Offset (0xEC), 
                        SYST,   8, 
                        CPUT,   8
                    }

                    Mutex (MTX0, 0x00)
                    Method (ECAC, 4, Serialized)
                    {
                        Acquire (MTX0, 0xFFFF)
                        Store (Arg1, CMD1)
                        Store (Arg2, CMD2)
                        Store (Arg3, CMD3)
                        Store (Arg0, CMCM)
                        Store (CMCM, Local0)
                        While (Local0)
                        {
                            Store (CMCM, Local0)
                        }

                        Store (CMD1, Local0)
                        Release (MTX0)
                        Return (Local0)
                    }

                    Method (_Q04, 0, NotSerialized)
                    {
                        Store ("Sleep button be pressed: ----- ", Debug)
                        Store (0x85, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q05, 0, NotSerialized)
                    {
                        Store ("LCD/CRT toggle: ----- ", Debug)
                        Store (0x8B, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF, Local0)
                        If (Local0)
                        {
                            Store (\_SB.PCI0.GRFX.SWIT, Local1)
                            If (LEqual (Local1, 0x00))
                            {
                                Increment (\_SB.PCI0.GRFX.TOGF)
                                Store (\_SB.PCI0.GRFX.TOGF, Local0)
                                If (LEqual (Local0, 0x01))
                                {
                                    Store ("LCD", Debug)
                                    Store (Zero, \_SB.PCI0.GRFX.CRTA)
                                    Store (One, \_SB.PCI0.GRFX.LCDA)
                                }

                                If (LEqual (Local0, 0x02))
                                {
                                    Store ("CRT", Debug)
                                    Store (One, \_SB.PCI0.GRFX.CRTA)
                                    Store (Zero, \_SB.PCI0.GRFX.LCDA)
                                }

                                If (LEqual (Local0, 0x03))
                                {
                                    Store ("Both", Debug)
                                    Store (One, \_SB.PCI0.GRFX.CRTA)
                                    Store (One, \_SB.PCI0.GRFX.LCDA)
                                    Store (Zero, \_SB.PCI0.GRFX.TOGF)
                                }

                                Notify (\_SB.PCI0.GRFX, 0x80)
                            }
                            Else
                            {
                                Store (0x83, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                            }
                        }
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store (0x08, \_SB.INF)
                        Store (0x8D, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                    }

                    Method (_Q16, 0, NotSerialized)
                    {
                        Store (0x31, \_SB.INF)
                        Store (0x8D, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                    }

                    Method (_Q17, 0, NotSerialized)
                    {
                        Store (0x32, \_SB.INF)
                        Store (0x8D, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                    }

                    Method (_Q09, 0, NotSerialized)
                    {
                        Store (0x86, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                    }

                    Method (_Q78, 0, NotSerialized)
                    {
                        Store ("Thermal Throttle: ----- ", Debug)
                        Store (0x86, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                    }

                    Method (_Q79, 0, NotSerialized)
                    {
                        Store ("Thermal Critical Point: ----- ", Debug)
                        Store (0x8A, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Notify (\_TZ.THRM, 0x80)
                        Notify (\_TZ.THRM, 0x81)
                    }

                    Method (_Q81, 0, NotSerialized)
                    {
                        Store ("LID Close/Open: ----- ", Debug)
                        Notify (\_SB.LID, 0x80)
                        Notify (\_TZ.THRM, 0x80)
                        Notify (\_TZ.THRM, 0x81)
                    }

                    Method (_Q7A, 0, NotSerialized)
                    {
                        Store ("Battery A critical low: ----- ", Debug)
                        Notify (\_SB.BATA, 0x80)
                        Notify (\_SB.BATB, 0x80)
                    }

                    Method (_Q82, 0, NotSerialized)
                    {
                        Store (0x87, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store ("AC in/Out: ----- ", Debug)
                        Notify (\_SB.AC, 0x80)
                        Notify (\_SB.BATA, 0x80)
                        Notify (\_SB.BATB, 0x80)
                    }

                    Method (_Q86, 0, NotSerialized)
                    {
                        Store ("Battery A In/Out: ----- ", Debug)
                        Store (0x85, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Notify (\_SB.BATA, 0x80)
                        Notify (\_SB.BATA, 0x00)
                        Notify (\_SB.BATA, 0x81)
                    }

                    Method (_Q87, 0, NotSerialized)
                    {
                        Store ("Battery B In/Out: ----- ", Debug)
                        Store (0x85, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Notify (\_SB.BATB, 0x80)
                        Notify (\_SB.BATB, 0x00)
                        Notify (\_SB.BATB, 0x81)
                    }

                    Method (_Q7C, 0, NotSerialized)
                    {
                        Store ("Battery A Status changed: ----- ", Debug)
                        Notify (\_SB.BATA, 0x80)
                    }

                    Method (_Q7D, 0, NotSerialized)
                    {
                        Store ("Battery B Status changed: ----- ", Debug)
                        Notify (\_SB.BATB, 0x80)
                    }

                    Method (_Q96, 0, NotSerialized)
                    {
                        Sleep (0x0190)
                        Notify (\_SB.PCI0.IDE.SECN.MAST, 0x00)
                        Sleep (0x64)
                        Notify (\_SB.PCI0.IDE.SECN.MAST, 0x01)
                    }

                    Method (_Q20, 0, NotSerialized)
                    {
                        Store ("SMBus Event", Debug)
                    }
                }

                Device (MBRD)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x1F)
                    Name (RSRC, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0010, 0x0010, 0x01, 0x10)
                        IO (Decode16, 0x0024, 0x0024, 0x01, 0x02)
                        IO (Decode16, 0x0028, 0x0028, 0x01, 0x02)
                        IO (Decode16, 0x002C, 0x002C, 0x01, 0x02)
                        IO (Decode16, 0x0030, 0x0030, 0x01, 0x02)
                        IO (Decode16, 0x0034, 0x0034, 0x01, 0x02)
                        IO (Decode16, 0x0038, 0x0038, 0x01, 0x02)
                        IO (Decode16, 0x003C, 0x003C, 0x01, 0x02)
                        IO (Decode16, 0x0050, 0x0050, 0x01, 0x04)
                        IO (Decode16, 0x0072, 0x0072, 0x01, 0x06)
                        IO (Decode16, 0x0080, 0x0080, 0x01, 0x01)
                        IO (Decode16, 0x0090, 0x0090, 0x01, 0x10)
                        IO (Decode16, 0x00A4, 0x00A4, 0x01, 0x02)
                        IO (Decode16, 0x00A8, 0x00A8, 0x01, 0x02)
                        IO (Decode16, 0x00AC, 0x00AC, 0x01, 0x02)
                        IO (Decode16, 0x00B0, 0x00B0, 0x01, 0x06)
                        IO (Decode16, 0x00B8, 0x00B8, 0x01, 0x02)
                        IO (Decode16, 0x00BC, 0x00BC, 0x01, 0x02)
                        IO (Decode16, 0x1000, 0x1000, 0x01, 0x80)
                        IO (Decode16, 0x1180, 0x1180, 0x01, 0x40)
                        IO (Decode16, 0x002E, 0x002E, 0x01, 0x02)
                        IO (Decode16, 0x04D0, 0x04D0, 0x01, 0x02)
                        IO (Decode16, 0x0360, 0x0360, 0x01, 0x02)
                        IO (Decode16, 0xFE00, 0xFE00, 0x01, 0xFF)
                        Memory32Fixed (ReadOnly, 0xFF800000, 0x00800000)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, 0x92, PMMN)
                        CreateWordField (RSRC, 0x94, PMMX)
                        And (^^PMBA, 0xFF80, PMMN)
                        Store (PMMN, PMMX)
                        CreateWordField (RSRC, 0x9A, GPMN)
                        CreateWordField (RSRC, 0x9C, GPMX)
                        And (^^GPBA, 0xFF80, GPMN)
                        Store (GPMN, GPMX)
                        Return (RSRC)
                    }
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0000, 0x0000, 0x01, 0x10)
                        IO (Decode16, 0x0081, 0x0081, 0x01, 0x0F)
                        IO (Decode16, 0x00C0, 0x00C0, 0x01, 0x20)
                        DMA (Compatibility, NotBusMaster, Transfer16) {4}
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x00F0, 0x00F0, 0x01, 0x0F)
                        IRQ (Edge, ActiveHigh, Exclusive) {13}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0020, 0x0020, 0x01, 0x02)
                        IO (Decode16, 0x00A0, 0x00A0, 0x01, 0x02)
                        IRQ (Edge, ActiveHigh, Exclusive) {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0070, 0x0070, 0x01, 0x02)
                        IRQ (Edge, ActiveHigh, Exclusive) {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0061, 0x0061, 0x01, 0x01)
                    })
                }

                Device (TIME)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0040, 0x0040, 0x01, 0x04)
                        IRQ (Edge, ActiveHigh, Exclusive) {0}
                    })
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0060, 0x0060, 0x01, 0x01)
                        IO (Decode16, 0x0064, 0x0064, 0x01, 0x01)
                        IRQ (Edge, ActiveHigh, Exclusive) {1}
                    })
                }

                Device (MSE0)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive) {12}
                    })
                }

                OperationRegion (PIRX, PCI_Config, 0x60, 0x04)
                Field (PIRX, DWordAcc, NoLock, Preserve)
                {
                    AccessAs (ByteAcc, 0x00), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8
                }

                OperationRegion (PIRY, PCI_Config, 0x68, 0x04)
                Field (PIRY, DWordAcc, NoLock, Preserve)
                {
                    AccessAs (ByteAcc, 0x00), 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {3,7,10,11}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRA, 0x80, PIRA)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, 0x01, IRQ0)
                        And (PIRA, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Store (RSRC, Debug)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRA, 0x70), PIRA)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRA, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {3,7,10,11}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRB, 0x80, PIRB)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, 0x01, IRQ0)
                        And (PIRB, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRB, 0x70), PIRB)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRB, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {3,7,10,11}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRC, 0x80, PIRC)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, 0x01, IRQ0)
                        And (PIRC, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRC, 0x70), PIRC)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRC, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {3,7,10,11}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRD, 0x80, PIRD)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, 0x01, IRQ0)
                        And (PIRD, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRD, 0x70), PIRD)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRD, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {3,7,10,11}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRE, 0x80, PIRE)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, 0x01, IRQ0)
                        And (PIRE, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRE, 0x70), PIRE)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRE, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {3,7,10,11}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRF, 0x80, PIRF)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, 0x01, IRQ0)
                        And (PIRF, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRF, 0x70), PIRF)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRF, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {3,7,10,11}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRG, 0x80, PIRG)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, 0x01, IRQ0)
                        And (PIRG, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRG, 0x70), PIRG)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRG, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {3,7,10,11}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRH, 0x80, PIRH)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, 0x01, IRQ0)
                        And (PIRH, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRH, 0x70), PIRH)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRH, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Mutex (MX00, 0x00)
                OperationRegion (VSIO, SystemIO, 0x2E, 0x02)
                Field (VSIO, ByteAcc, NoLock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x07), 
                    LDNM,   8, 
                    Offset (0x22), 
                    PWCT,   8, 
                    PWMG,   8, 
                    Offset (0x25), 
                    DEMD,   8
                }

                IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x30), 
                    ACTI,   8, 
                    Offset (0x60), 
                    IOBH,   8, 
                    IOBL,   8, 
                    I2BH,   8, 
                    I2BL,   8, 
                    Offset (0x70), 
                    IRQX,   8, 
                    Offset (0x74), 
                    DMAX,   8, 
                    Offset (0xF0), 
                    MODX,   8, 
                    OPTX,   8
                }

                IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                {
                    Offset (0xF1), 
                        ,   3, 
                    IRMD,   3
                }

                Method (ENCG, 0, NotSerialized)
                {
                    Acquire (MX00, 0xFFFF)
                    Store (0x55, INDX)
                }

                Method (EXCG, 0, NotSerialized)
                {
                    Store (0xAA, INDX)
                    Release (MX00)
                }

                Method (SDEV, 1, NotSerialized)
                {
                    Store (Arg0, LDNM)
                }

                Device (UAR1)
                {
                    Name (_HID, EisaId ("PNP0501"))
                    Name (RSRC, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0000, 0x0000, 0x08, 0x08)
                        IRQNoFlags () {}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x04)
                        Store (ACTI, Local0)
                        And (Local0, 0x01, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            EXCG ()
                            Return (0x0D)
                        }

                        Store (PWCT, Local0)
                        And (Local0, 0x10, Local0)
                        If (LNot (LEqual (Local0, 0x10)))
                        {
                            EXCG ()
                            Return (0x0D)
                        }

                        Return (0x0F)
                        EXCG ()
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x04)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xEF, Local0)
                        Store (Local0, PWCT)
                        EXCG ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x04)
                        If (LEqual (_STA (), 0x0F))
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16, 0x03F8, 0x03F8, 0x08, 0x08)
                                IRQNoFlags () {4}
                            })
                            CreateByteField (BUF0, 0x02, IOLO)
                            CreateByteField (BUF0, 0x03, IOHI)
                            CreateByteField (BUF0, 0x04, IORL)
                            CreateByteField (BUF0, 0x05, IORH)
                            CreateByteField (BUF0, 0x09, IRQL)
                            Store (IOBH, Local0)
                            Store (Local0, IOHI)
                            Store (IOBL, Local0)
                            Store (Local0, IOLO)
                            Store (IOLO, IORL)
                            Store (IOHI, IORH)
                            Store (IRQX, Local0)
                            Store (0x01, Local1)
                            ShiftLeft (Local1, Local0, IRQL)
                            EXCG ()
                            Return (BUF0)
                        }
                        Else
                        {
                            EXCG ()
                            Return (RSRC)
                        }
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x03F8, 0x03F8, 0x08, 0x08)
                            IRQNoFlags () {4}
                        }
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x02F8, 0x02F8, 0x08, 0x08)
                            IRQNoFlags () {3}
                        }
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x03E8, 0x03E8, 0x08, 0x08)
                            IRQNoFlags () {4}
                        }
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x02E8, 0x02E8, 0x08, 0x08)
                            IRQNoFlags () {3}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateByteField (Arg0, 0x09, IRQL)
                        ENCG ()
                        SDEV (0x04)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xEF, Local0)
                        Store (Local0, PWCT)
                        Store (IOHI, Local0)
                        Store (Local0, IOBH)
                        Store (IOLO, Local0)
                        Store (Local0, IOBL)
                        FindSetRightBit (IRQL, Local0)
                        Decrement (Local0)
                        Store (Local0, IRQX)
                        Store (PWCT, Local0)
                        Or (Local0, 0x10, Local0)
                        Store (Local0, PWCT)
                        Store (ACTI, Local0)
                        Or (Local0, 0x01)
                        Store (Local0, ACTI)
                        EXCG ()
                    }
                }

                Device (LPT)
                {
                    Name (_HID, EisaId ("PNP0400"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x03)
                        Store (MODX, Local0)
                        And (Local0, 0x07, Local0)
                        If (LEqual (Local0, 0x02))
                        {
                            EXCG ()
                            Return (0x00)
                        }

                        Store (ACTI, Local0)
                        And (Local0, 0x01, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            EXCG ()
                            Return (0x0D)
                        }

                        Store (PWCT, Local0)
                        And (Local0, 0x08, Local0)
                        If (LNot (LEqual (Local0, 0x08)))
                        {
                            EXCG ()
                            Return (0x0D)
                        }

                        EXCG ()
                        Return (0x0F)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x03)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xF7, Local0)
                        Store (Local0, PWCT)
                        EXCG ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16, 0x0000, 0x0000, 0x08, 0x08)
                            IRQNoFlags () {}
                        })
                        CreateByteField (BUF0, 0x02, IOLO)
                        CreateByteField (BUF0, 0x03, IOHI)
                        CreateByteField (BUF0, 0x04, IORL)
                        CreateByteField (BUF0, 0x05, IORH)
                        CreateByteField (BUF0, 0x07, LNA1)
                        CreateByteField (BUF0, 0x09, IRQL)
                        ENCG ()
                        SDEV (0x03)
                        Store (IOBH, Local0)
                        Store (Local0, IOHI)
                        Store (IOBL, Local0)
                        Store (Local0, IOLO)
                        Store (IOLO, IORL)
                        Store (IOHI, IORH)
                        If (Local0)
                        {
                            If (LEqual (IOLO, 0xBC))
                            {
                                Store (0x04, LNA1)
                            }
                            Else
                            {
                                Store (0x08, LNA1)
                            }
                        }
                        Else
                        {
                            Store (0x00, LNA1)
                        }

                        Store (IRQX, Local0)
                        Store (0x01, Local1)
                        ShiftLeft (Local1, Local0, IRQL)
                        EXCG ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16, 0x0378, 0x0378, 0x01, 0x08)
                            IRQNoFlags () {5,7}
                        }
                        StartDependentFn (0x01, 0x01)
                        {
                            IO (Decode16, 0x0278, 0x0278, 0x01, 0x08)
                            IRQNoFlags () {5,7}
                        }
                        StartDependentFn (0x02, 0x02)
                        {
                            IO (Decode16, 0x03BC, 0x03BC, 0x01, 0x04)
                            IRQNoFlags () {5,7}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateByteField (Arg0, 0x09, IRQL)
                        ENCG ()
                        SDEV (0x03)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xF7, Local0)
                        Store (Local0, PWCT)
                        Store (IOHI, Local0)
                        Store (Local0, IOBH)
                        Store (IOLO, Local0)
                        Store (Local0, IOBL)
                        FindSetRightBit (IRQL, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }
                        Else
                        {
                            Store (0x00, Local0)
                        }

                        Store (Local0, IRQX)
                        Store (PWCT, Local0)
                        Or (Local0, 0x08, Local0)
                        Store (Local0, PWCT)
                        Store (ACTI, Local0)
                        Or (Local0, 0x01)
                        Store (Local0, ACTI)
                        EXCG ()
                    }
                }

                Device (ECP)
                {
                    Name (_HID, EisaId ("PNP0401"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x03)
                        Store (MODX, Local0)
                        And (Local0, 0x07, Local0)
                        If (LNot (LEqual (Local0, 0x02)))
                        {
                            EXCG ()
                            Return (0x00)
                        }

                        Store (ACTI, Local0)
                        And (Local0, 0x01, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            EXCG ()
                            Return (0x0D)
                        }

                        Store (PWCT, Local0)
                        And (Local0, 0x08, Local0)
                        If (LNot (LEqual (Local0, 0x08)))
                        {
                            EXCG ()
                            Return (0x0D)
                        }

                        EXCG ()
                        Return (0x0F)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x03)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xF7, Local0)
                        Store (Local0, PWCT)
                        EXCG ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16, 0x0000, 0x0000, 0x08, 0x04)
                            IO (Decode16, 0x0000, 0x0000, 0x08, 0x04)
                            IRQNoFlags () {}
                            DMA (Compatibility, NotBusMaster, Transfer8) {}
                        })
                        CreateByteField (BUF0, 0x02, IOLO)
                        CreateByteField (BUF0, 0x03, IOHI)
                        CreateByteField (BUF0, 0x04, IORL)
                        CreateByteField (BUF0, 0x05, IORH)
                        CreateByteField (BUF0, 0x0A, DALO)
                        CreateByteField (BUF0, 0x0B, DAHI)
                        CreateByteField (BUF0, 0x0C, DRLO)
                        CreateByteField (BUF0, 0x0D, DRHI)
                        CreateByteField (BUF0, 0x11, IRQL)
                        CreateByteField (BUF0, 0x14, DMAC)
                        ENCG ()
                        SDEV (0x03)
                        Store (IOBH, Local0)
                        Store (Local0, IOHI)
                        Store (IOBL, Local0)
                        Store (Local0, IOLO)
                        Store (IOLO, IORL)
                        Store (IOHI, IORH)
                        Store (IOHI, Local0)
                        Add (Local0, 0x04, Local0)
                        Store (Local0, DAHI)
                        Store (IOLO, DALO)
                        Store (DALO, DRLO)
                        Store (DAHI, DRHI)
                        Store (IRQX, Local0)
                        Store (0x01, Local1)
                        ShiftLeft (Local1, Local0, IRQL)
                        Store (DMAX, Local0)
                        Store (0x01, Local1)
                        ShiftLeft (Local1, Local0, DMAC)
                        EXCG ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16, 0x0378, 0x0378, 0x01, 0x04)
                            IO (Decode16, 0x0778, 0x0778, 0x01, 0x04)
                            IRQNoFlags () {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                        }
                        StartDependentFn (0x01, 0x01)
                        {
                            IO (Decode16, 0x0278, 0x0278, 0x01, 0x04)
                            IO (Decode16, 0x0678, 0x0678, 0x01, 0x04)
                            IRQNoFlags () {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                        }
                        StartDependentFn (0x02, 0x02)
                        {
                            IO (Decode16, 0x03BC, 0x03BC, 0x01, 0x04)
                            IO (Decode16, 0x07BC, 0x07BC, 0x01, 0x04)
                            IRQNoFlags () {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateByteField (Arg0, 0x11, IRQL)
                        CreateByteField (Arg0, 0x14, DMAC)
                        ENCG ()
                        SDEV (0x03)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xF7, Local0)
                        Store (Local0, PWCT)
                        Store (IOHI, Local0)
                        Store (Local0, IOBH)
                        Store (IOLO, Local0)
                        Store (Local0, IOBL)
                        FindSetRightBit (IRQL, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }
                        Else
                        {
                            Store (0x00, Local0)
                        }

                        Store (Local0, IRQX)
                        FindSetRightBit (DMAC, Local0)
                        Decrement (Local0)
                        Store (Local0, DMAX)
                        Store (PWCT, Local0)
                        Or (Local0, 0x08, Local0)
                        Store (Local0, PWCT)
                        Store (ACTI, Local0)
                        Or (Local0, 0x01)
                        Store (Local0, ACTI)
                        EXCG ()
                    }
                }

                Device (FIRB)
                {
                    Name (_HID, EisaId ("SMCF010"))
                    Name (RSRC, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0000, 0x0000, 0x08, 0x08)
                        IO (Decode16, 0x0000, 0x0000, 0x08, 0x08)
                        IRQNoFlags () {}
                        DMA (Compatibility, NotBusMaster, Transfer8) {0,1,3}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x05)
                        If (LEqual (IRMD, 0x02))
                        {
                            EXCG ()
                            Return (0x00)
                        }

                        Store (ACTI, Local0)
                        And (Local0, 0x01, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            EXCG ()
                            Return (0x0D)
                        }

                        Store (PWCT, Local0)
                        And (Local0, 0x20, Local0)
                        If (LNot (LEqual (Local0, 0x20)))
                        {
                            EXCG ()
                            Return (0x0D)
                        }

                        Store (0x6E, OPTX)
                        Return (0x0F)
                        EXCG ()
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x05)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xDF, Local0)
                        Store (Local0, PWCT)
                        EXCG ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16, 0x02F8, 0x02F8, 0x08, 0x08)
                            IO (Decode16, 0x0158, 0x0158, 0x08, 0x08)
                            IRQNoFlags () {3}
                            DMA (Compatibility, NotBusMaster, Transfer8) {3}
                        })
                        CreateByteField (BUF0, 0x02, IOLO)
                        CreateByteField (BUF0, 0x03, IOHI)
                        CreateByteField (BUF0, 0x04, IORL)
                        CreateByteField (BUF0, 0x05, IORH)
                        CreateByteField (BUF0, 0x0A, I2LO)
                        CreateByteField (BUF0, 0x0B, I2HI)
                        CreateByteField (BUF0, 0x0C, I2RL)
                        CreateByteField (BUF0, 0x0D, I2RH)
                        CreateByteField (BUF0, 0x11, IRQL)
                        CreateByteField (BUF0, 0x12, IRQH)
                        CreateByteField (BUF0, 0x14, DMAC)
                        ENCG ()
                        SDEV (0x05)
                        Store (IOBH, Local0)
                        Store (Local0, IOHI)
                        Store (IOBL, Local0)
                        Store (Local0, IOLO)
                        Store (IOLO, IORL)
                        Store (IOHI, IORH)
                        Store (IOHI, Local0)
                        Subtract (Local0, 0x01, Local0)
                        Store (Local0, I2HI)
                        Store (Local0, I2RH)
                        Store (IOLO, Local0)
                        Subtract (Local0, 0xA0, Local0)
                        Store (Local0, I2LO)
                        Store (Local0, I2RL)
                        Store (IRQX, Local0)
                        Store (0x01, Local1)
                        If (LNot (LLess (Local0, 0x08)))
                        {
                            Subtract (Local0, 0x08, Local0)
                            ShiftLeft (Local1, Local0, IRQH)
                            Store (0x00, IRQL)
                        }
                        Else
                        {
                            ShiftLeft (Local1, Local0, IRQL)
                            Store (0x00, IRQH)
                        }

                        Store (DMAX, Local0)
                        Store (0x01, Local1)
                        ShiftLeft (Local1, Local0, DMAC)
                        EXCG ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x03F8, 0x03F8, 0x08, 0x08)
                            IO (Decode16, 0x0258, 0x0258, 0x08, 0x08)
                            IRQNoFlags () {4}
                            DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                        }
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x02F8, 0x02F8, 0x08, 0x08)
                            IO (Decode16, 0x0158, 0x0158, 0x08, 0x08)
                            IRQNoFlags () {3}
                            DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                        }
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x03E8, 0x03E8, 0x08, 0x08)
                            IO (Decode16, 0x0248, 0x0248, 0x08, 0x08)
                            IRQNoFlags () {4}
                            DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                        }
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x02E8, 0x02E8, 0x08, 0x08)
                            IO (Decode16, 0x0148, 0x0148, 0x08, 0x08)
                            IRQNoFlags () {3}
                            DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateByteField (Arg0, 0x0A, I2LO)
                        CreateByteField (Arg0, 0x0B, I2HI)
                        CreateByteField (Arg0, 0x11, IRQL)
                        CreateByteField (Arg0, 0x12, IRQH)
                        CreateByteField (Arg0, 0x14, DMAC)
                        ENCG ()
                        SDEV (0x05)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xDF, Local0)
                        Store (Local0, PWCT)
                        Store (IOHI, Local0)
                        Store (Local0, IOBH)
                        Store (IOLO, Local0)
                        Store (Local0, IOBL)
                        Store (I2HI, Local0)
                        Store (Local0, I2BH)
                        Store (I2LO, Local0)
                        Store (Local0, I2BL)
                        FindSetRightBit (IRQL, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }
                        Else
                        {
                            FindSetRightBit (IRQH, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                                Add (Local0, 0x08, Local0)
                            }
                        }

                        Store (Local0, IRQX)
                        FindSetRightBit (DMAC, Local0)
                        Decrement (Local0)
                        Store (Local0, DMAX)
                        Store (0x00, MODX)
                        Store (0x6E, OPTX)
                        Store (PWCT, Local0)
                        Or (Local0, 0x20, Local0)
                        Store (Local0, PWCT)
                        Store (ACTI, Local0)
                        Or (Local0, 0x01)
                        Store (Local0, ACTI)
                        EXCG ()
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x05)
                        Store (PWCT, Local0)
                        Or (Local0, 0x20, Local0)
                        Store (Local0, PWCT)
                        Store (ACTI, Local0)
                        Or (Local0, 0x01)
                        Store (Local0, ACTI)
                        EXCG ()
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x05)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xDF, Local0)
                        Store (Local0, PWCT)
                        EXCG ()
                    }
                }

                Device (Z00M)
                {
                    Name (_HID, EisaId ("PNP0510"))
                    Name (RSRC, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0000, 0x0000, 0x08, 0x08)
                        IO (Decode16, 0x0000, 0x0000, 0x08, 0x08)
                        IRQNoFlags () {}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x05)
                        If (LNot (LEqual (IRMD, 0x02)))
                        {
                            EXCG ()
                            Return (0x00)
                        }

                        Store (ACTI, Local0)
                        And (Local0, 0x01, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            EXCG ()
                            Return (0x0D)
                        }

                        Store (PWCT, Local0)
                        And (Local0, 0x20, Local0)
                        If (LNot (LEqual (Local0, 0x20)))
                        {
                            EXCG ()
                            Return (0x0D)
                        }

                        Return (0x0F)
                        EXCG ()
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x05)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xDF, Local0)
                        Store (Local0, PWCT)
                        EXCG ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16, 0x02F8, 0x02F8, 0x08, 0x08)
                            IO (Decode16, 0x0158, 0x0158, 0x08, 0x08)
                            IRQNoFlags () {3}
                        })
                        CreateByteField (BUF0, 0x02, IOLO)
                        CreateByteField (BUF0, 0x03, IOHI)
                        CreateByteField (BUF0, 0x04, IORL)
                        CreateByteField (BUF0, 0x05, IORH)
                        CreateByteField (BUF0, 0x0A, I2LO)
                        CreateByteField (BUF0, 0x0B, I2HI)
                        CreateByteField (BUF0, 0x0C, I2RL)
                        CreateByteField (BUF0, 0x0D, I2RH)
                        CreateByteField (BUF0, 0x11, IRQL)
                        CreateByteField (BUF0, 0x12, IRQH)
                        ENCG ()
                        SDEV (0x05)
                        Store (IOBH, Local0)
                        Store (Local0, IOHI)
                        Store (IOBL, Local0)
                        Store (Local0, IOLO)
                        Store (IOLO, IORL)
                        Store (IOHI, IORH)
                        Store (IOHI, Local0)
                        Subtract (Local0, 0x01, Local0)
                        Store (Local0, I2HI)
                        Store (Local0, I2RH)
                        Store (IOLO, Local0)
                        Subtract (Local0, 0xA0, Local0)
                        Store (Local0, I2LO)
                        Store (Local0, I2RL)
                        Store (IRQX, Local0)
                        Store (0x01, Local1)
                        ShiftLeft (Local1, Local0, IRQL)
                        EXCG ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x03F8, 0x03F8, 0x08, 0x08)
                            IO (Decode16, 0x0158, 0x0158, 0x08, 0x08)
                            IRQNoFlags () {4}
                        }
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x02F8, 0x02F8, 0x08, 0x08)
                            IO (Decode16, 0x0158, 0x0158, 0x08, 0x08)
                            IRQNoFlags () {3}
                        }
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x03E8, 0x03E8, 0x08, 0x08)
                            IO (Decode16, 0x0158, 0x0158, 0x08, 0x08)
                            IRQNoFlags () {4}
                        }
                        StartDependentFn (0x00, 0x01)
                        {
                            IO (Decode16, 0x02E8, 0x02E8, 0x08, 0x08)
                            IO (Decode16, 0x0158, 0x0158, 0x08, 0x08)
                            IRQNoFlags () {3}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateByteField (Arg0, 0x0A, I2LO)
                        CreateByteField (Arg0, 0x0B, I2HI)
                        CreateByteField (Arg0, 0x11, IRQL)
                        CreateByteField (Arg0, 0x12, IRQH)
                        ENCG ()
                        SDEV (0x05)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xDF, Local0)
                        Store (Local0, PWCT)
                        Store (IOHI, Local0)
                        Store (Local0, IOBH)
                        Store (IOLO, Local0)
                        Store (Local0, IOBL)
                        Store (I2HI, Local0)
                        Store (Local0, I2BH)
                        Store (I2LO, Local0)
                        Store (Local0, I2BL)
                        FindSetRightBit (IRQL, Local0)
                        Decrement (Local0)
                        Store (Local0, IRQX)
                        Store (0x00, MODX)
                        Store (0x56, OPTX)
                        Store (PWCT, Local0)
                        Or (Local0, 0x20, Local0)
                        Store (Local0, PWCT)
                        Store (ACTI, Local0)
                        Or (Local0, 0x01)
                        Store (Local0, ACTI)
                        EXCG ()
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x05)
                        Store (PWCT, Local0)
                        Or (Local0, 0x20, Local0)
                        Store (Local0, PWCT)
                        Store (ACTI, Local0)
                        Or (Local0, 0x01)
                        Store (Local0, ACTI)
                        EXCG ()
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        ENCG ()
                        SDEV (0x05)
                        Store (ACTI, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTI)
                        Store (PWCT, Local0)
                        And (Local0, 0xDF, Local0)
                        Store (Local0, PWCT)
                        EXCG ()
                    }
                }
            }

            Device (IDE)
            {
                Name (_ADR, 0x001F0001)
                OperationRegion (PCI, PCI_Config, 0x40, 0x17)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    ITM0,   16, 
                    ITM1,   16, 
                    SIT0,   4, 
                    SIT1,   4, 
                    Offset (0x08), 
                    UDC0,   2, 
                    UDC1,   2, 
                    Offset (0x0A), 
                    UDT0,   8, 
                    UDT1,   8, 
                    Offset (0x14), 
                    ICF0,   2, 
                    ICF1,   2, 
                        ,   6, 
                    WPPE,   1, 
                    Offset (0x16), 
                        ,   2, 
                    SSIG,   2
                }

                Name (SVT0, Ones)
                Name (SVT1, Ones)
                Name (SVWP, Ones)
                Method (_PS3, 0, NotSerialized)
                {
                    Store (^ITM0, ^SVT0)
                    Store (^ITM1, ^SVT1)
                    Store (0x00, ^SVWP)
                }

                Method (_PS0, 0, NotSerialized)
                {
                    If (LNot (LEqual (^SVWP, Ones)))
                    {
                        And (^SVT0, 0x8044, Local0)
                        And (^ITM0, 0x7FBB, Local1)
                        Or (Local0, Local1, ^ITM0)
                        And (^SVT1, 0x8044, Local0)
                        And (^ITM1, 0x7FBB, Local1)
                        Or (Local0, Local1, ^ITM1)
                    }

                    Store (One, ^SVWP)
                }

                Method (GTM, 5, NotSerialized)
                {
                    Store (Buffer (0x14) {}, Local0)
                    CreateDWordField (Local0, 0x00, PIO0)
                    CreateDWordField (Local0, 0x04, DMA0)
                    CreateDWordField (Local0, 0x08, PIO1)
                    CreateDWordField (Local0, 0x0C, DMA1)
                    CreateDWordField (Local0, 0x10, FLAG)
                    If (LOr (And (Arg0, 0x08), LNot (And (Arg0, 0x01))))
                    {
                        Store (0x0384, PIO0)
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (Arg0, 0x3000), 0x0C), Local1)
                        Multiply (Subtract (0x09, Local1), 0x1E, PIO0)
                    }

                    If (LOr (LAnd (Arg0, 0x4000), LAnd (Arg2, 0x01)))
                    {
                        If (LOr (And (Arg0, 0x80), LNot (And (Arg0, 0x10))))
                        {
                            Store (0x0384, PIO1)
                        }
                        Else
                        {
                            Add (And (Arg1, 0x03), ShiftRight (And (Arg1, 0x0C), 0x02), Local1)
                            Multiply (Subtract (0x09, Local1), 0x1E, PIO1)
                        }
                    }
                    Else
                    {
                        Store (PIO0, PIO1)
                    }

                    If (And (Arg2, 0x01))
                    {
                        Subtract (0x04, And (Arg3, 0x03), Local1)
                        If (And (Arg4, 0x01))
                        {
                            Multiply (Local1, 0x0F, DMA0)
                        }
                        Else
                        {
                            Multiply (Local1, 0x1E, DMA0)
                        }
                    }
                    Else
                    {
                        Store (PIO0, DMA0)
                    }

                    If (LOr (LAnd (Arg0, 0x4000), LAnd (Arg2, 0x01)))
                    {
                        If (And (Arg2, 0x02))
                        {
                            Subtract (0x04, ShiftRight (And (Arg3, 0x30), 0x04), Local1)
                            If (And (Arg4, 0x02))
                            {
                                Multiply (Local1, 0x0F, DMA1)
                            }
                            Else
                            {
                                Multiply (Local1, 0x1E, DMA1)
                            }
                        }
                        Else
                        {
                            Store (PIO1, DMA1)
                        }
                    }
                    Else
                    {
                        Store (DMA0, DMA1)
                    }

                    Store (Zero, FLAG)
                    If (And (Arg0, 0x01))
                    {
                        Or (FLAG, 0x10, FLAG)
                    }

                    If (And (Arg2, 0x01))
                    {
                        Or (FLAG, 0x01, FLAG)
                    }

                    If (And (Arg0, 0x02))
                    {
                        Or (FLAG, 0x02, FLAG)
                    }

                    If (And (Arg2, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                    }

                    If (And (Arg0, 0x20))
                    {
                        Or (FLAG, 0x08, FLAG)
                    }

                    Return (Local0)
                }

                Method (STM, 3, NotSerialized)
                {
                    Store (Buffer (0x14) {}, Local7)
                    CreateDWordField (Local7, 0x00, ITM)
                    CreateDWordField (Local7, 0x04, SIT)
                    CreateDWordField (Local7, 0x08, UDC)
                    CreateDWordField (Local7, 0x0C, UDT)
                    CreateDWordField (Local7, 0x10, ICF)
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Store (FLAG, Local4)
                    Store (0x4000, Local0)
                    If (And (Local4, 0x02))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    If (And (Local4, 0x08))
                    {
                        Or (Local0, 0x20, Local0)
                    }

                    If (LAnd (LLess (DMA0, PIO0), LNot (And (Local4, 0x01))))
                    {
                        Or (Local0, 0x08, Local0)
                    }

                    If (LAnd (LLess (DMA1, PIO1), LNot (And (Local4, 0x04))))
                    {
                        Or (Local0, 0x80, Local0)
                    }

                    If (LLess (PIO0, 0x0384))
                    {
                        Or (Local0, 0x01, Local0)
                    }

                    If (LLess (PIO1, 0x0384))
                    {
                        Or (Local0, 0x10, Local0)
                    }

                    If (And (Local4, 0x01))
                    {
                        Store (PIO0, Local1)
                    }
                    Else
                    {
                        Store (DMA0, Local1)
                    }

                    If (LNot (LGreater (Local1, 0x78)))
                    {
                        Or (Local0, 0x2300, Local0)
                    }
                    Else
                    {
                        If (LNot (LGreater (Local1, 0xB4)))
                        {
                            Or (Local0, 0x2100, Local0)
                        }
                        Else
                        {
                            If (LNot (LGreater (Local1, 0xF0)))
                            {
                                Or (Local0, 0x1000, Local0)
                            }
                        }
                    }

                    Store (Local0, ITM)
                    Store (Zero, Local0)
                    If (And (Local4, 0x04))
                    {
                        Store (PIO1, Local1)
                    }
                    Else
                    {
                        Store (DMA1, Local1)
                    }

                    If (LNot (LGreater (Local1, 0x78)))
                    {
                        Store (0x0B, Local0)
                    }
                    Else
                    {
                        If (LNot (LGreater (Local1, 0xB4)))
                        {
                            Store (0x09, Local0)
                        }
                        Else
                        {
                            If (LNot (LGreater (Local1, 0xF0)))
                            {
                                Store (0x04, Local0)
                            }
                        }
                    }

                    Store (Local0, SIT)
                    Store (0x00, Local0)
                    If (And (Local4, 0x01))
                    {
                        Or (Local0, 0x01, Local0)
                    }

                    If (And (Local4, 0x04))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    Store (Local0, UDC)
                    Store (0x00, Local0)
                    If (And (Local4, 0x01))
                    {
                        If (LLess (DMA0, 0x3C))
                        {
                            Divide (DMA0, 0x0F, , Local1)
                        }
                        Else
                        {
                            Divide (DMA0, 0x1E, , Local1)
                        }

                        Subtract (0x04, Local1, Local0)
                    }

                    If (And (Local4, 0x04))
                    {
                        If (LLess (DMA1, 0x3C))
                        {
                            Divide (DMA1, 0x0F, , Local1)
                        }
                        Else
                        {
                            Divide (DMA1, 0x1E, , Local1)
                        }

                        Subtract (0x04, Local1, Local1)
                        ShiftLeft (Local1, 0x04, Local1)
                        Or (Local0, Local1, Local0)
                    }

                    Store (Local0, UDT)
                    Store (0x00, Local0)
                    If (LLess (DMA0, 0x3C))
                    {
                        Or (Local0, 0x01, Local0)
                    }

                    If (LLess (DMA1, 0x3C))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    Store (Local0, ICF)
                    Return (Local7)
                }

                Method (H15P, 1, NotSerialized)
                {
                    Name (BUFF, Buffer (0x08)
                    {
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                    })
                    Store (Arg0, Local0)
                    Store (BUFF, Local1)
                    Concatenate (Local0, Local1, Local7)
                    CreateWordField (Local7, 0x02, CYL)
                    CreateWordField (Local7, 0x06, HEAD)
                    CreateWordField (Local7, 0x0C, SPT)
                    If (LAnd (LNot (LLess (HEAD, 0x10)), LNot (LLess (CYL, 0x2000))))
                    {
                        Return (SPT)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (GTF0, 6, NotSerialized)
                {
                    Store (Buffer (0x07)
                        {
                            0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                        }, Local7)
                    CreateByteField (Local7, 0x01, MODE)
                    If (And (Arg2, 0x01))
                    {
                        And (Arg3, 0x03, Local0)
                        If (And (Arg4, 0x01))
                        {
                            Add (Local0, 0x02, Local0)
                        }

                        Or (Local0, 0x40, MODE)
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (Arg0, 0x3000), 0x0C), Local0)
                        If (LNot (LLess (Local0, 0x05)))
                        {
                            Store (0x22, MODE)
                        }
                        Else
                        {
                            If (LNot (LLess (Local0, 0x03)))
                            {
                                Store (0x21, MODE)
                            }
                            Else
                            {
                                Store (0x20, MODE)
                            }
                        }
                    }

                    Concatenate (Local7, Local7, Local6)
                    If (LOr (And (Arg0, 0x08), LNot (And (Arg0, 0x01))))
                    {
                        If (And (Arg0, 0x02))
                        {
                            Store (0x00, MODE)
                        }
                        Else
                        {
                            Store (0x01, MODE)
                        }
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (Arg0, 0x3000), 0x0C), Local0)
                        If (LNot (LLess (Local0, 0x05)))
                        {
                            Store (0x0C, MODE)
                        }
                        Else
                        {
                            If (LNot (LLess (Local0, 0x03)))
                            {
                                Store (0x0B, MODE)
                            }
                            Else
                            {
                                Store (0x0A, MODE)
                            }
                        }
                    }

                    Concatenate (Local6, Local7, Local5)
                    If (Arg5)
                    {
                        Store (Buffer (0x07)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00, 0xAE, 0x91
                            }, Local4)
                        CreateByteField (Local4, 0x01, SPT)
                        Store (Arg5, SPT)
                        Concatenate (Local5, Local4, Local6)
                        Return (Local6)
                    }
                    Else
                    {
                        Return (Local5)
                    }
                }

                Method (GTF1, 6, NotSerialized)
                {
                    Store (Buffer (0x07)
                        {
                            0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                        }, Local7)
                    CreateByteField (Local7, 0x01, MODE)
                    If (And (Arg2, 0x02))
                    {
                        ShiftRight (And (Arg3, 0x30), 0x04, Local0)
                        If (And (Arg4, 0x02))
                        {
                            Add (Local0, 0x02, Local0)
                        }

                        Or (Local0, 0x40, MODE)
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg1, 0x03), 0x02), And (Arg1, 0x0C), Local0)
                        If (LNot (LLess (Local0, 0x05)))
                        {
                            Store (0x22, MODE)
                        }
                        Else
                        {
                            If (LNot (LLess (Local0, 0x03)))
                            {
                                Store (0x21, MODE)
                            }
                            Else
                            {
                                Store (0x20, MODE)
                            }
                        }
                    }

                    Concatenate (Local7, Local7, Local6)
                    If (LOr (And (Arg0, 0x80), LNot (And (Arg0, 0x10))))
                    {
                        If (And (Arg0, 0x20))
                        {
                            Store (0x00, MODE)
                        }
                        Else
                        {
                            Store (0x01, MODE)
                        }
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg1, 0x03), 0x02), And (Arg1, 0x0C), Local0)
                        If (LNot (LLess (Local0, 0x05)))
                        {
                            Store (0x0C, MODE)
                        }
                        Else
                        {
                            If (LNot (LLess (Local0, 0x03)))
                            {
                                Store (0x0B, MODE)
                            }
                            Else
                            {
                                Store (0x0A, MODE)
                            }
                        }
                    }

                    Concatenate (Local6, Local7, Local5)
                    If (Arg5)
                    {
                        Store (Buffer (0x07)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00, 0xBE, 0x91
                            }, Local4)
                        CreateByteField (Local4, 0x01, SPT)
                        Store (Arg5, SPT)
                        Concatenate (Local5, Local4, Local6)
                        Return (Local6)
                    }
                    Else
                    {
                        Return (Local5)
                    }
                }

                Device (PRIM)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Store ("GTM - Primary Controller", Debug)
                        Store (^^GTM (^^ITM0, ^^SIT0, ^^UDC0, ^^UDT0, ^^ICF0), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store ("STM - Primary Controller", Debug)
                        Store (^^STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        Or (And (^^ITM0, 0x8044), And (ITM, 0x7FBB), ^^ITM0)
                        Store (SIT, ^^SIT0)
                        Store (UDC, ^^UDC0)
                        Store (UDT, ^^UDT0)
                        Store (ICF, ^^ICF0)
                        Store (^^H15P (Arg1), ^MAST.H15F)
                        Store (^^H15P (Arg2), ^SLAV.H15F)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Primary Master", Debug)
                            Store (^^^GTF0 (^^^ITM0, ^^^SIT0, ^^^UDC0, ^^^UDT0, ^^^ICF0, ^H15F), Local0)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Primary Slave", Debug)
                            Store (^^^GTF1 (^^^ITM0, ^^^SIT0, ^^^UDC0, ^^^UDT0, ^^^ICF0, ^H15F), Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECN)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Store ("GTM - Secondary Controller", Debug)
                        Store (^^GTM (^^ITM1, ^^SIT1, ^^UDC1, ^^UDT1, ^^ICF1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store ("STM - Secondary Controller", Debug)
                        Store (^^STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        Or (And (^^ITM1, 0x8044), And (ITM, 0x7FBB), ^^ITM1)
                        Store (SIT, ^^SIT1)
                        Store (UDC, ^^UDC1)
                        Store (UDT, ^^UDT1)
                        Store (ICF, ^^ICF1)
                        Store (^^H15P (Arg1), ^MAST.H15F)
                        Store (^^H15P (Arg2), ^SLAV.H15F)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Name (H15F, Zero)
                        Name (IBS1, 0x00)
                        Method (_PS0, 0, NotSerialized)
                        {
                            If (LEqual (IBS1, 0x01))
                            {
                                Notify (\_SB.PCI0.IDE.SECN.MAST, 0x00)
                            }

                            Store (0x00, IBS1)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x01, IBS1)
                        }

                        Method (_EJ0, 1, NotSerialized)
                        {
                            Store ("Bay Removed", Debug)
                            If (Arg0)
                            {
                                Store (0x01, SSIG)
                                Sleep (0x32)
                            }
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            Store ("Bay Status", Debug)
                            If (\_SB.PCI0.LPC0.EC0.ECOK)
                            {
                                Store (\_SB.PCI0.LPC0.EC0.Z007, Local0)
                            }
                            Else
                            {
                                Store (SSIG, Local0)
                            }

                            If (LEqual (Local0, 0x01))
                            {
                                Return (0x08)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Secondary Master", Debug)
                            Store (^^^GTF0 (^^^ITM1, ^^^SIT1, ^^^UDC1, ^^^UDT1, ^^^ICF1, ^H15F), Local0)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Secondary Slave", Debug)
                            Store (^^^GTF1 (^^^ITM1, ^^^SIT1, ^^^UDC1, ^^^UDT1, ^^^ICF1, ^H15F), Local0)
                            Return (Local0)
                        }
                    }
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001F0002)
                OperationRegion (USBO, PCI_Config, 0xC4, 0x04)
                Field (USBO, DWordAcc, NoLock, Preserve)
                {
                    Z00N,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x01
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, Z00N)
                    }
                    Else
                    {
                        Store (0x00, Z00N)
                    }
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x001F0004)
                OperationRegion (USBO, PCI_Config, 0xC4, 0x04)
                Field (USBO, DWordAcc, NoLock, Preserve)
                {
                    RSEN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x01
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, RSEN)
                    }
                    Else
                    {
                        Store (0x00, RSEN)
                    }
                }
            }

            Device (AC97)
            {
                Name (_ADR, 0x001F0006)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x01
                })
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.EC0.ECOK)
                {
                    Return (\_SB.PCI0.LPC0.EC0.LIDS)
                }
                Else
                {
                    Return (0x01)
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x17, 
                0x01
            })
        }

        Device (BATA)
        {
            Name (_UID, 0x01)
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Name (_PRW, Package (0x02)
            {
                0x17, 
                0x01
            })
            Method (_STA, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.EC0.ECOK)
                {
                    If (\_SB.PCI0.LPC0.EC0.Z004)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (0x1F)
                    }
                }
                Else
                {
                    Return (0x1F)
                }
            }

            Method (_BIF, 0, NotSerialized)
            {
                Name (STAT, Package (0x0D)
                {
                    0x00, 
                    0x0C80, 
                    0x0C80, 
                    0x01, 
                    0x2AF8, 
                    0x012C, 
                    0x96, 
                    0xDC, 
                    0x01F4, 
                    "TM610", 
                    "Main", 
                    "Lion", 
                    "Acer"
                })
                If (\_SB.PCI0.LPC0.EC0.ECOK)
                {
                    Store (\_SB.PCI0.LPC0.EC0.LFCA, Index (STAT, 0x02))
                }

                Return (STAT)
            }

            Method (_BST, 0, NotSerialized)
            {
                Name (STAT, Package (0x04)
                {
                    0x02, 
                    0x00, 
                    0x0BB8, 
                    0x30CC
                })
                If (\_SB.PCI0.LPC0.EC0.ECOK)
                {
                    Store (0x01, \_SB.INF)
                    Store (0x82, \_SB.BCMD)
                    Store (Zero, \_SB.SMIC)
                    Store (\_SB.Z002, Index (STAT, 0x02))
                    Store (\_SB.PCI0.LPC0.EC0.BSTA, Local0)
                    If (And (LEqual (Local0, 0x00), LEqual (SizeOf (\_OS), 0x27)))
                    {
                        If (LGreater (\_SB.PCI0.LPC0.EC0.BSTB, 0x0F))
                        {
                            If (LLess (\_SB.PCI0.LPC0.EC0.PERA, 0x63))
                            {
                                Store (0x02, Local0)
                            }
                            Else
                            {
                                Store (0x01, Local0)
                            }
                        }
                    }

                    Store (Local0, Index (STAT, 0x00))
                }

                Return (STAT)
            }
        }

        Device (BATB)
        {
            Name (_UID, 0x02)
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Name (_PRW, Package (0x02)
            {
                0x17, 
                0x01
            })
            Method (_STA, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.EC0.ECOK)
                {
                    If (\_SB.PCI0.LPC0.EC0.Z005)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (0x1F)
                    }
                }
                Else
                {
                    Return (0x1F)
                }
            }

            Method (_BIF, 0, NotSerialized)
            {
                Name (STAT, Package (0x0D)
                {
                    0x00, 
                    0x0C80, 
                    0x0C80, 
                    0x01, 
                    0x2AF8, 
                    0x012C, 
                    0x96, 
                    0xDC, 
                    0x01F4, 
                    "TM610", 
                    "Secondary", 
                    "Lion", 
                    "Acer"
                })
                If (\_SB.PCI0.LPC0.EC0.ECOK)
                {
                    Store (\_SB.PCI0.LPC0.EC0.LFCB, Index (STAT, 0x02))
                }

                Return (STAT)
            }

            Method (_BST, 0, NotSerialized)
            {
                Name (STAT, Package (0x04)
                {
                    0x02, 
                    0x00, 
                    0x0BB8, 
                    0x30CC
                })
                If (\_SB.PCI0.LPC0.EC0.ECOK)
                {
                    Store (0x02, \_SB.INF)
                    Store (0x82, \_SB.BCMD)
                    Store (Zero, \_SB.SMIC)
                    Store (\_SB.Z002, Index (STAT, 0x02))
                    Store (\_SB.PCI0.LPC0.EC0.BSTB, Local0)
                    If (And (LEqual (Local0, 0x00), LEqual (SizeOf (\_OS), 0x27)))
                    {
                        If (LGreater (\_SB.PCI0.LPC0.EC0.BSTA, 0x0F))
                        {
                            If (LLess (\_SB.PCI0.LPC0.EC0.PERB, 0x63))
                            {
                                Store (0x02, Local0)
                            }
                            Else
                            {
                                Store (0x01, Local0)
                            }
                        }
                    }

                    Store (Local0, Index (STAT, 0x00))
                }

                Return (STAT)
            }
        }

        Device (AC)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_PSR, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.EC0.ECOK)
                {
                    If (\_SB.PCI0.LPC0.EC0.ACS)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x01)
                    }
                }
                Else
                {
                    Return (0x01)
                }
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
        }
    }
}

