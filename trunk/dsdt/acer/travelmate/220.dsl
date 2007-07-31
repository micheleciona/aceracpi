/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20030918
 *
 * Disassembly of dsdt.dat, Fri Dec 26 03:19:46 2003
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "Acer", "FALCON3M", 4096)
{
    Scope (\)
    {
        Name (LIDS, 0x01)
        Name (LIDF, 0x00)
        Name (DAT4, 0x00)
        Name (PCRD, 0x00)
        Name (USBD, 0x00)
        Name (VGAS, 0x00)
        Name (CRTS, 0x00)
        Name (LCDS, 0x00)
        Name (MLED, 0x00)
        Mutex (ABC, 0x00)
        OperationRegion (PM00, SystemIO, 0xF02C, 0x06)
        Field (PM00, ByteAcc, NoLock, Preserve)
        {
            PM2C,   8, 
            PM2D,   8, 
            PM30,   8
        }

        OperationRegion (MEM1, SystemMemory, 0x04F0, 0x01)
        Field (MEM1, ByteAcc, NoLock, Preserve)
        {
            DAT0,   8
        }

        OperationRegion (MEM2, SystemMemory, 0x04F1, 0x01)
        Field (MEM2, ByteAcc, NoLock, Preserve)
        {
            DAT1,   8
        }

        OperationRegion (MEM3, SystemMemory, 0x04F2, 0x01)
        Field (MEM3, ByteAcc, NoLock, Preserve)
        {
            DAT2,   8
        }

        OperationRegion (MEM4, SystemMemory, 0x04F3, 0x01)
        Field (MEM4, ByteAcc, NoLock, Preserve)
        {
            DAT3,   8
        }

        OperationRegion (MEM5, SystemMemory, 0x04F4, 0x01)
        Field (MEM5, ByteAcc, NoLock, Preserve)
        {
            DAT5,   8
        }

        OperationRegion (MEM6, SystemMemory, 0x04F5, 0x01)
        Field (MEM6, ByteAcc, NoLock, Preserve)
        {
            DAT6,   8
        }

        OperationRegion (MEM7, SystemMemory, 0x04F6, 0x01)
        Field (MEM7, ByteAcc, NoLock, Preserve)
        {
            DAT7,   8
        }
    }

    Scope (\_PR)
    {
        Processor (\_PR.CPU0, 0x01, 0x0000F110, 0x06)
        {
            Method (_CST, 0, NotSerialized)
            {
                Store (0x03, IOB3)
                Store (0x33, IOB2)
                If (LEqual (DAT5, 0x01))
                {
                    Return (Package (0x04)
                    {
                        0x03, 
                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 0x08, 0x00, 0x0000000000000000)
                            }, 

                            0x01, 
                            0x01, 
                            0x03E8
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 0x08, 0x00, 0x000000000000F114)
                            }, 

                            0x02, 
                            0x01, 
                            0x01F4
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 0x08, 0x00, 0x000000000000F115)
                            }, 

                            0x03, 
                            0x50, 
                            0xFA
                        }
                    })
                }
                Else
                {
                    Return (Package (0x05)
                    {
                        0x04, 
                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 0x08, 0x00, 0x0000000000000000)
                            }, 

                            0x01, 
                            0x01, 
                            0x03E8
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 0x08, 0x00, 0x000000000000F114)
                            }, 

                            0x02, 
                            0x01, 
                            0x01F4
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 0x08, 0x00, 0x000000000000F115)
                            }, 

                            0x03, 
                            0x50, 
                            0xFA
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 0x08, 0x00, 0x000000000000F116)
                            }, 

                            0x03, 
                            0xB4, 
                            0x64
                        }
                    })
                }
            }

            Name (XPCT, Package (0x02)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 0x08, 0x00, 0x00000000000000B2)
                }, 

                ResourceTemplate ()
                {
                    Register (SystemIO, 0x08, 0x00, 0x00000000000000B3)
                }
            })
            Method (XPPC, 0, NotSerialized)
            {
                Store (0x03, IOB3)
                Store (0x33, IOB2)
                Return (0x00)
            }

            Name (XPSS, Package (0x02)
            {
                Package (0x06)
                {
                    0x03E8, 
                    0x55F0, 
                    0x01F4, 
                    0x00, 
                    0x83, 
                    0x00
                }, 

                Package (0x06)
                {
                    0x02DD, 
                    0x2710, 
                    0x01F4, 
                    0x00, 
                    0x84, 
                    0x01
                }
            })
        }
    }

    OperationRegion (BDAC, SystemMemory, 0x04EB, 0x02)
    Field (BDAC, ByteAcc, NoLock, Preserve)
    {
        CIND,   8, 
        CDAT,   8
    }

    Name (PMOS, 0x11)
    Name (EXLP, 0x13)
    Name (CS1C, 0x1C)
    Name (CMHI, 0x2E)
    Name (CMLO, 0x2F)
    Name (DMAC, 0x33)
    Name (OBC1, 0x37)
    Name (SMIO, 0x39)
    Name (OBC2, 0x3A)
    Name (LLBW, 0x43)
    Name (EXML, 0x46)
    Name (EXMH, 0x47)
    Name (CS4A, 0x4A)
    Name (FNF4, 0x4C)
    Name (CS58, 0x58)
    Name (IDEP, 0x65)
    Name (IDES, 0x66)
    OperationRegion (CSMI, SystemIO, 0xB1, 0x03)
    Field (CSMI, ByteAcc, NoLock, Preserve)
    {
        IOB1,   8, 
        IOB2,   8, 
        IOB3,   8
    }

    Method (RCMS, 1, NotSerialized)
    {
        Store (Arg0, IOB3)
        Store (0x7B, IOB2)
        Return (IOB3)
    }

    Method (WCMS, 2, NotSerialized)
    {
        Store (Arg1, CDAT)
        Store (Arg0, IOB3)
        Store (0x7C, IOB2)
    }

    OperationRegion (DBG1, SystemIO, 0x80, 0x01)
    Field (DBG1, ByteAcc, NoLock, Preserve)
    {
        PX80,   8
    }

    OperationRegion (DEL0, SystemIO, 0xED, 0x01)
    Field (DEL0, ByteAcc, NoLock, Preserve)
    {
        PXED,   8
    }

    Name (\_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S1, Package (0x04)
    {
        0x02, 
        0x02, 
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
    Method (\_PTS, 1, NotSerialized)
    {
        Store (Arg0, PX80)
        Store (0x01, \LIDF)
        If (LEqual (Arg0, 0x01))
        {
            Or (\_SB.PCI0.PCI1.OZ68.PMES, 0x01, \_SB.PCI0.PCI1.OZ68.PMES)
            Store (0x86, \_SB.PCI0.ICH3.EC0.P55T)
            If (LEqual (SizeOf (\_OS), 0x11))
            {
                Store (0x00, IOB3)
                Store (0x11, PX80)
            }
            Else
            {
                Store (0x03, IOB3)
                Store (0x12, PX80)
            }

            Store (0x32, IOB2)
            Store (0xAA, \DAT6)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x04, IOB3)
            Store (0x32, IOB2)
            Or (\PM30, 0x10, \PM30)
            Store (0x00, IOB3)
            Store (0x37, IOB2)
            If (LOr (LEqual (OSTP, 0x00), LEqual (OSTP, 0x02)))
            {
                Store (0x00, \_SB.PCI0.USB0.U0EN)
                Store (0x00, \_SB.PCI0.USB1.U1EN)
            }
        }

        If (LNot (LGreater (Arg0, 0x03)))
        {
            Store (RCMS (CS4A), Local0)
            And (Local0, 0xDF, Local0)
            WCMS (CS4A, Local0)
        }

        If (LEqual (Arg0, 0x04))
        {
            If (LOr (LEqual (OSTP, 0x00), LEqual (OSTP, 0x02)))
            {
                Store (0x00, \_SB.PCI0.USB0.U0EN)
                Store (0x00, \_SB.PCI0.USB1.U1EN)
            }

            Store (\_SB.PCI0.OBMO.PMES, Local0)
            WCMS (CS58, 0x33)
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0x01, IOB3)
            Store (0x32, IOB2)
        }
    }

    Method (\_WAK, 1, NotSerialized)
    {
        Store (Arg0, PX80)
        If (LNot (LGreater (Arg0, 0x03)))
        {
            Store (RCMS (CS4A), Local0)
            And (Local0, 0x20, Local0)
            If (LNot (LEqual (Local0, 0x20)))
            {
                Notify (\_SB.SLPB, 0x02)
            }
            Else
            {
                If (LEqual (SizeOf (\_OS), 0x11))
                {
                    Notify (\_SB.SLPB, 0x02)
                }
            }
        }

        If (LEqual (Arg0, 0x01))
        {
            If (LNot (LEqual (SizeOf (\_OS), 0x11)))
            {
                Sleep (0x01F4)
            }

            If (LNot (LEqual (SizeOf (\_OS), 0x14)))
            {
                Store (0x01, \_SB.PCI0.PCI1.BME2)
            }

            Store (0x86, \_SB.PCI0.ICH3.EC0.P55T)
            Store (0x02, IOB3)
            Store (0x32, IOB2)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x14, PX80)
            If (OSCP (\_OS, "Microsoft Windows"))
            {
                Store (0x00, OSTP)
            }
            Else
            {
                If (OSCP (\_OS, "Microsoft Windows NT"))
                {
                    Store (0x01, OSTP)
                }
                Else
                {
                    If (OSCP (\_OS, "Microsoft WindowsME: Millennium Edition"))
                    {
                        Store (0x02, OSTP)
                    }
                    Else
                    {
                        Store (0x07, OSTP)
                    }
                }
            }

            If (LNot (LEqual (SizeOf (\_OS), 0x14)))
            {
                Store (0x01, \_SB.PCI0.PCI1.BME2)
                Notify (\_SB.SLPB, 0x02)
            }

            And (\_SB.PCI0.PCI1.OBLN.PMES, 0xFE, \_SB.PCI0.PCI1.OBLN.PMES)
            Store (\_SB.PCI0.PCI1.OBLN.PMES, Local0)
            Store (Local0, \_SB.PCI0.PCI1.OBLN.PMES)
            WCMS (CS58, 0xAA)
            Notify (\_SB.BAT0, 0x81)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x13, PX80)
            Store (0x05, IOB3)
            Store (0x32, IOB2)
            Sleep (0x01F4)
        }
        Else
        {
            If (LEqual (\_SB.PCI0.ICH3.EC0.P54, 0x00))
            {
                Store (0x00, \LIDS)
            }
            Else
            {
                Store (0x01, \LIDS)
            }

            Store (0x00, \LIDF)
        }
    }

    Scope (\_SI)
    {
        Method (_SST, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x00))
            {
                Store (0x02, IOB3)
                Store (0x30, IOB2)
            }

            If (LOr (LEqual (Arg0, 0x01), LEqual (Arg0, 0x02)))
            {
                Store (0x02, IOB3)
                Store (0x30, IOB2)
            }

            If (LEqual (Arg0, 0x03))
            {
                Store (0x00, IOB3)
                Store (0x30, IOB2)
            }

            If (LEqual (Arg0, 0x04))
            {
                Store (0x01, IOB3)
                Store (0x30, IOB2)
            }
        }
    }

    Name (TBUF, Buffer (0x08)
    {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    })
    CreateByteField (TBUF, 0x00, DB00)
    CreateWordField (TBUF, 0x00, DW00)
    CreateWordField (TBUF, 0x02, DW01)
    CreateWordField (TBUF, 0x04, DW02)
    CreateWordField (TBUF, 0x06, DW03)
    OperationRegion (SMB0, SystemIO, 0xF300, 0x01)
    Field (SMB0, ByteAcc, NoLock, Preserve)
    {
        SM00,   8
    }

    OperationRegion (SMB2, SystemIO, 0xF302, 0x01)
    Field (SMB2, ByteAcc, NoLock, Preserve)
    {
        SM02,   8
    }

    OperationRegion (SMB3, SystemIO, 0xF303, 0x01)
    Field (SMB3, ByteAcc, NoLock, Preserve)
    {
        SM03,   8
    }

    OperationRegion (SMB4, SystemIO, 0xF304, 0x01)
    Field (SMB4, ByteAcc, NoLock, Preserve)
    {
        SM04,   8
    }

    OperationRegion (SMB5, SystemIO, 0xF305, 0x01)
    Field (SMB5, ByteAcc, NoLock, Preserve)
    {
        SM05,   8
    }

    OperationRegion (SMB6, SystemIO, 0xF306, 0x01)
    Field (SMB6, ByteAcc, NoLock, Preserve)
    {
        SM06,   8
    }

    Scope (\_TZ)
    {
        ThermalZone (THR1)
        {
            Method (_TMP, 0, NotSerialized)
            {
                Store (0x10, IOB3)
                Store (0x33, IOB2)
                Store (\_SB.PCI0.ICH3.C232, Local1)
                If (LGreater (Local1, 0x64))
                {
                    Store (0x10, IOB3)
                    Store (0x33, IOB2)
                    Store (\_SB.PCI0.ICH3.C232, Local1)
                }

                And (Local1, 0x80, Local2)
                If (LEqual (Local2, 0x80))
                {
                    Store (0x1E, Local1)
                }
                Else
                {
                    If (LNot (LGreater (Local1, 0x10)))
                    {
                        Store (0x11, Local1)
                    }
                }

                Multiply (Local1, 0x0A, DW00)
                Add (DW00, 0x0AAC, DW00)
                Return (DW00)
            }

            Method (_CRT, 0, NotSerialized)
            {
                Store (0x11, IOB3)
                Store (0x33, IOB2)
                Store (\_SB.PCI0.ICH3.C233, Local1)
                Multiply (Local1, 0x0A, DW01)
                Add (DW01, 0x0AAC, DW01)
                Return (DW01)
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x03)
            Name (_TSP, 0x0258)
        }

        ThermalZone (THR2)
        {
            Method (_TMP, 0, NotSerialized)
            {
                Store (0x12, IOB3)
                Store (0x33, IOB2)
                Store (\_SB.PCI0.ICH3.C230, Local1)
                If (LGreater (Local1, 0x55))
                {
                    Store (0x12, IOB3)
                    Store (0x33, IOB2)
                    Store (\_SB.PCI0.ICH3.C230, Local1)
                }

                And (Local1, 0x80, Local2)
                If (LEqual (Local2, 0x80))
                {
                    Store (0x1E, Local1)
                }
                Else
                {
                    If (LNot (LGreater (Local1, 0x10)))
                    {
                        Store (0x11, Local1)
                    }
                }

                Multiply (Local1, 0x0A, DW02)
                Add (DW02, 0x0AAC, DW02)
                Return (DW02)
            }

            Method (_CRT, 0, NotSerialized)
            {
                Store (0x13, IOB3)
                Store (0x33, IOB2)
                Store (\_SB.PCI0.ICH3.C231, Local1)
                Multiply (Local1, 0x0A, DW03)
                Add (DW03, 0x0AAC, DW03)
                Return (DW03)
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x03)
            Name (_TSP, 0x0258)
        }
    }

    Scope (\_GPE)
    {
        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB0, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
        }

        Method (_L0A, 0, NotSerialized)
        {
            Store (0x05, IOB3)
            Store (0x30, IOB2)
            Notify (\_SB.SLPB, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Store (0x0B, PX80)
            And (\_SB.PCI0.PCI1.OZ68.PWRS, 0xFC, \_SB.PCI0.PCI1.OZ68.PWRS)
            Or (\_SB.PCI0.PCI1.OZ68.PMES, 0x80, \_SB.PCI0.PCI1.OZ68.PMES)
            Store (Local0, \_SB.PCI0.PCI1.OBLN.PMES)
            Notify (\_SB.SLPB, 0x02)
        }

        Method (_L18, 0, NotSerialized)
        {
            Store (0x18, PX80)
            Sleep (0x07D0)
            \_SB.PCI0.ICH3.EC0.ECC9 (0x00)
            Store (\_SB.PCI0.ICH3.EC0.DAT1, Local0)
            Store (Local0, PX80)
            If (LEqual (Local0, 0x2E))
            {
                If (LEqual (\_SB.PCI0.ICH3.EC0.P54, 0x00))
                {
                    Store (0x00, \LIDS)
                }
                Else
                {
                    Store (0x88, \_SB.PCI0.ICH3.EC0.P54S)
                    Store (0x80, \_SB.PCI0.ICH3.EC0.P54T)
                    Store (0x01, \LIDS)
                    Store (0x10, IOB3)
                    Store (0x31, IOB2)
                }

                Store (0x00, \LIDF)
                Notify (\_SB.LID, 0x80)
            }
        }
    }

    OperationRegion (OSBT, SystemMemory, 0x04EA, 0x01)
    Field (OSBT, ByteAcc, NoLock, Preserve)
    {
        OSTP,   3
    }

    Method (OSCP, 2, NotSerialized)
    {
        If (LNot (LEqual (SizeOf (Arg0), SizeOf (Arg1))))
        {
            Return (0x00)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (TMB0, Buffer (Local0) {})
        Name (TMB1, Buffer (Local0) {})
        Store (Arg0, TMB0)
        Store (Arg1, TMB1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNot (LEqual (DerefOf (Index (TMB0, Local0)), DerefOf (Index (TMB1, Local0)))))
            {
                Return (0x00)
            }
        }

        Return (0x01)
    }

    Scope (\_SB)
    {
        Device (\_SB.SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            Name (_PRW, Package (0x02)
            {
                0x0B, 
                0x04
            })
        }

        Device (PCI0)
        {
            Method (_INI, 0, NotSerialized)
            {
                If (OSCP (\_OS, "Microsoft Windows"))
                {
                    Store (0x00, OSTP)
                }
                Else
                {
                    If (OSCP (\_OS, "Microsoft Windows NT"))
                    {
                        Store (0x01, OSTP)
                    }
                    Else
                    {
                        If (OSCP (\_OS, "Microsoft WindowsME: Millennium Edition"))
                        {
                            Store (0x02, OSTP)
                        }
                        Else
                        {
                            Store (0x07, OSTP)
                        }
                    }
                }

                Store (OSTP, PX80)
            }

            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            OperationRegion (NB00, PCI_Config, 0x00, 0x0100)
            Field (NB00, ByteAcc, NoLock, Preserve)
            {
                Offset (0x12), 
                    ,   3, 
                IGDE,   1, 
                Offset (0x52), 
                    ,   4, 
                SHRM,   3, 
                Offset (0x63), 
                EADD,   8
            }

            Name (PBRS, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,
                    0x0000,
                    0x00FF,
                    0x0000,
                    0x0100)
                IO (Decode16, 0x0CF8, 0x0CF8, 0x01, 0x08)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,
                    0x0000,
                    0x0CF7,
                    0x0000,
                    0x0CF8)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,
                    0x0D00,
                    0xFFEF,
                    0x0000,
                    0xF2F0)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000A0000,
                    0x000BFFFF,
                    0x00000000,
                    0x00020000)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x000D0000,
                    0x000DFFFF,
                    0x00000000,
                    0x00018000)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,
                    0x02000000,
                    0xFF7FFFFF,
                    0x00000000,
                    0xFDFC0000)
            })
            Method (_CRS, 0, NotSerialized)
            {
                CreateDWordField (PBRS, 0x76, MEML)
                CreateDWordField (PBRS, 0x82, LENM)
                Multiply (\_SB.PCI0.EADD, 0x02000000, Local0)
                Store (\_SB.PCI0.SHRM, Local1)
                If (LEqual (Local1, 0x02))
                {
                    Subtract (Local0, 0x00080000, MEML)
                }
                Else
                {
                    If (LEqual (Local1, 0x03))
                    {
                        Subtract (Local0, 0x00100000, MEML)
                    }
                    Else
                    {
                        If (LEqual (Local1, 0x04))
                        {
                            Subtract (Local0, 0x00800000, MEML)
                        }
                    }
                }

                Subtract (0xFFE00000, MEML, LENM)
                Return (PBRS)
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Device (FIGD)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, 0x01)
                Method (_STA, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSTP, 0x01), LEqual (OSTP, 0x03)))
                    {
                        If (LEqual (IGDE, 0x00))
                        {
                            Return (0x0B)
                        }
                    }

                    Return (0x00)
                }

                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16, 0x07B0, 0x07B0, 0x01, 0x0C)
                    IO (Decode16, 0x07C0, 0x07C0, 0x01, 0x20)
                    IO (Decode16, 0x0BB0, 0x0BB0, 0x01, 0x0C)
                    IO (Decode16, 0x0BC0, 0x0BC0, 0x01, 0x20)
                    IO (Decode16, 0x0FB0, 0x0FB0, 0x01, 0x0C)
                    IO (Decode16, 0x0FC0, 0x0FC0, 0x01, 0x20)
                    IO (Decode16, 0x13B0, 0x13B0, 0x01, 0x0C)
                    IO (Decode16, 0x13C0, 0x13C0, 0x01, 0x20)
                    IO (Decode16, 0x17B0, 0x17B0, 0x01, 0x0C)
                    IO (Decode16, 0x17C0, 0x17C0, 0x01, 0x20)
                    IO (Decode16, 0x1BB0, 0x1BB0, 0x01, 0x0C)
                    IO (Decode16, 0x1BC0, 0x1BC0, 0x01, 0x20)
                    IO (Decode16, 0x1FB0, 0x1FB0, 0x01, 0x0C)
                    IO (Decode16, 0x1FC0, 0x1FC0, 0x01, 0x20)
                    IO (Decode16, 0x23B0, 0x23B0, 0x01, 0x0C)
                    IO (Decode16, 0x23C0, 0x23C0, 0x01, 0x20)
                    IO (Decode16, 0x27B0, 0x27B0, 0x01, 0x0C)
                    IO (Decode16, 0x27C0, 0x27C0, 0x01, 0x20)
                    IO (Decode16, 0x2BB0, 0x2BB0, 0x01, 0x0C)
                    IO (Decode16, 0x2BC0, 0x2BC0, 0x01, 0x20)
                    IO (Decode16, 0x2FB0, 0x2FB0, 0x01, 0x0C)
                    IO (Decode16, 0x2FC0, 0x2FC0, 0x01, 0x20)
                    IO (Decode16, 0x33B0, 0x33B0, 0x01, 0x0C)
                    IO (Decode16, 0x33C0, 0x33C0, 0x01, 0x20)
                    IO (Decode16, 0x37B0, 0x37B0, 0x01, 0x0C)
                    IO (Decode16, 0x37C0, 0x37C0, 0x01, 0x20)
                    IO (Decode16, 0x3BB0, 0x3BB0, 0x01, 0x0C)
                    IO (Decode16, 0x3BC0, 0x3BC0, 0x01, 0x20)
                    IO (Decode16, 0x3FB0, 0x3FB0, 0x01, 0x0C)
                    IO (Decode16, 0x3FC0, 0x3FC0, 0x01, 0x20)
                    IO (Decode16, 0x43B0, 0x43B0, 0x01, 0x0C)
                    IO (Decode16, 0x43C0, 0x43C0, 0x01, 0x20)
                    IO (Decode16, 0x47B0, 0x47B0, 0x01, 0x0C)
                    IO (Decode16, 0x47C0, 0x47C0, 0x01, 0x20)
                    IO (Decode16, 0x4BB0, 0x4BB0, 0x01, 0x0C)
                    IO (Decode16, 0x4BC0, 0x4BC0, 0x01, 0x20)
                    IO (Decode16, 0x4FB0, 0x4FB0, 0x01, 0x0C)
                    IO (Decode16, 0x4FC0, 0x4FC0, 0x01, 0x20)
                    IO (Decode16, 0x53B0, 0x53B0, 0x01, 0x0C)
                    IO (Decode16, 0x53C0, 0x53C0, 0x01, 0x20)
                    IO (Decode16, 0x57B0, 0x57B0, 0x01, 0x0C)
                    IO (Decode16, 0x57C0, 0x57C0, 0x01, 0x20)
                    IO (Decode16, 0x5BB0, 0x5BB0, 0x01, 0x0C)
                    IO (Decode16, 0x5BC0, 0x5BC0, 0x01, 0x20)
                    IO (Decode16, 0x5FB0, 0x5FB0, 0x01, 0x0C)
                    IO (Decode16, 0x5FC0, 0x5FC0, 0x01, 0x20)
                    IO (Decode16, 0x63B0, 0x63B0, 0x01, 0x0C)
                    IO (Decode16, 0x63C0, 0x63C0, 0x01, 0x20)
                    IO (Decode16, 0x67B0, 0x67B0, 0x01, 0x0C)
                    IO (Decode16, 0x67C0, 0x67C0, 0x01, 0x20)
                    IO (Decode16, 0x6BB0, 0x6BB0, 0x01, 0x0C)
                    IO (Decode16, 0x6BC0, 0x6BC0, 0x01, 0x20)
                    IO (Decode16, 0x6FB0, 0x6FB0, 0x01, 0x0C)
                    IO (Decode16, 0x6FC0, 0x6FC0, 0x01, 0x20)
                    IO (Decode16, 0x73B0, 0x73B0, 0x01, 0x0C)
                    IO (Decode16, 0x73C0, 0x73C0, 0x01, 0x20)
                    IO (Decode16, 0x77B0, 0x77B0, 0x01, 0x0C)
                    IO (Decode16, 0x77C0, 0x77C0, 0x01, 0x20)
                    IO (Decode16, 0x7BB0, 0x7BB0, 0x01, 0x0C)
                    IO (Decode16, 0x7BC0, 0x7BC0, 0x01, 0x20)
                    IO (Decode16, 0x7FB0, 0x7FB0, 0x01, 0x0C)
                    IO (Decode16, 0x7FC0, 0x7FC0, 0x01, 0x20)
                    IO (Decode16, 0x83B0, 0x83B0, 0x01, 0x0C)
                    IO (Decode16, 0x83C0, 0x83C0, 0x01, 0x20)
                    IO (Decode16, 0x87B0, 0x87B0, 0x01, 0x0C)
                    IO (Decode16, 0x87C0, 0x87C0, 0x01, 0x20)
                    IO (Decode16, 0x8BB0, 0x8BB0, 0x01, 0x0C)
                    IO (Decode16, 0x8BC0, 0x8BC0, 0x01, 0x20)
                    IO (Decode16, 0x8FB0, 0x8FB0, 0x01, 0x0C)
                    IO (Decode16, 0x8FC0, 0x8FC0, 0x01, 0x20)
                    IO (Decode16, 0x93B0, 0x93B0, 0x01, 0x0C)
                    IO (Decode16, 0x93C0, 0x93C0, 0x01, 0x20)
                    IO (Decode16, 0x97B0, 0x97B0, 0x01, 0x0C)
                    IO (Decode16, 0x97C0, 0x97C0, 0x01, 0x20)
                    IO (Decode16, 0x9BB0, 0x9BB0, 0x01, 0x0C)
                    IO (Decode16, 0x9BC0, 0x9BC0, 0x01, 0x20)
                    IO (Decode16, 0x9FB0, 0x9FB0, 0x01, 0x0C)
                    IO (Decode16, 0x9FC0, 0x9FC0, 0x01, 0x20)
                    IO (Decode16, 0xA3B0, 0xA3B0, 0x01, 0x0C)
                    IO (Decode16, 0xA3C0, 0xA3C0, 0x01, 0x20)
                    IO (Decode16, 0xA7B0, 0xA7B0, 0x01, 0x0C)
                    IO (Decode16, 0xA7C0, 0xA7C0, 0x01, 0x20)
                    IO (Decode16, 0xABB0, 0xABB0, 0x01, 0x0C)
                    IO (Decode16, 0xABC0, 0xABC0, 0x01, 0x20)
                    IO (Decode16, 0xAFB0, 0xAFB0, 0x01, 0x0C)
                    IO (Decode16, 0xAFC0, 0xAFC0, 0x01, 0x20)
                    IO (Decode16, 0xB3B0, 0xB3B0, 0x01, 0x0C)
                    IO (Decode16, 0xB3C0, 0xB3C0, 0x01, 0x20)
                    IO (Decode16, 0xB7B0, 0xB7B0, 0x01, 0x0C)
                    IO (Decode16, 0xB7C0, 0xB7C0, 0x01, 0x20)
                    IO (Decode16, 0xBBB0, 0xBBB0, 0x01, 0x0C)
                    IO (Decode16, 0xBBC0, 0xBBC0, 0x01, 0x20)
                    IO (Decode16, 0xBFB0, 0xBFB0, 0x01, 0x0C)
                    IO (Decode16, 0xBFC0, 0xBFC0, 0x01, 0x20)
                    IO (Decode16, 0xC3B0, 0xC3B0, 0x01, 0x0C)
                    IO (Decode16, 0xC3C0, 0xC3C0, 0x01, 0x20)
                    IO (Decode16, 0xC7B0, 0xC7B0, 0x01, 0x0C)
                    IO (Decode16, 0xC7C0, 0xC7C0, 0x01, 0x20)
                    IO (Decode16, 0xCBB0, 0xCBB0, 0x01, 0x0C)
                    IO (Decode16, 0xCBC0, 0xCBC0, 0x01, 0x20)
                    IO (Decode16, 0xCFB0, 0xCFB0, 0x01, 0x0C)
                    IO (Decode16, 0xCFC0, 0xCFC0, 0x01, 0x20)
                    IO (Decode16, 0xD3B0, 0xD3B0, 0x01, 0x0C)
                    IO (Decode16, 0xD3C0, 0xD3C0, 0x01, 0x20)
                    IO (Decode16, 0xD7B0, 0xD7B0, 0x01, 0x0C)
                    IO (Decode16, 0xD7C0, 0xD7C0, 0x01, 0x20)
                    IO (Decode16, 0xDBB0, 0xDBB0, 0x01, 0x0C)
                    IO (Decode16, 0xDBC0, 0xDBC0, 0x01, 0x20)
                    IO (Decode16, 0xDFB0, 0xDFB0, 0x01, 0x0C)
                    IO (Decode16, 0xDFC0, 0xDFC0, 0x01, 0x20)
                    IO (Decode16, 0xE3B0, 0xE3B0, 0x01, 0x0C)
                    IO (Decode16, 0xE3C0, 0xE3C0, 0x01, 0x20)
                    IO (Decode16, 0xE7B0, 0xE7B0, 0x01, 0x0C)
                    IO (Decode16, 0xE7C0, 0xE7C0, 0x01, 0x20)
                    IO (Decode16, 0xEBB0, 0xEBB0, 0x01, 0x0C)
                    IO (Decode16, 0xEBC0, 0xEBC0, 0x01, 0x20)
                    IO (Decode16, 0xEFB0, 0xEFB0, 0x01, 0x0C)
                    IO (Decode16, 0xEFC0, 0xEFC0, 0x01, 0x20)
                    IO (Decode16, 0xF3B0, 0xF3B0, 0x01, 0x0C)
                    IO (Decode16, 0xF3C0, 0xF3C0, 0x01, 0x20)
                    IO (Decode16, 0xF7B0, 0xF7B0, 0x01, 0x0C)
                    IO (Decode16, 0xF7C0, 0xF7C0, 0x01, 0x20)
                    IO (Decode16, 0xFBB0, 0xFBB0, 0x01, 0x0C)
                    IO (Decode16, 0xFBC0, 0xFBC0, 0x01, 0x20)
                    IO (Decode16, 0xFFB0, 0xFFB0, 0x01, 0x0C)
                    IO (Decode16, 0xFFC0, 0xFFC0, 0x01, 0x20)
                })
            }

            Name (_PRT, Package (0x04)
            {
                Package (0x04)
                {
                    0x0002FFFF, 
                    0x00, 
                    \_SB.PCI0.ICH3.PILA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x00, 
                    \_SB.PCI0.ICH3.PILA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x01, 
                    \_SB.PCI0.ICH3.PILD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    \_SB.PCI0.ICH3.PILB, 
                    0x00
                }
            })
            Device (AGP0)
            {
                Name (_ADR, 0x00010000)
                Name (_PRT, Package (0x01)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.ICH3.PILA, 
                        0x00
                    }
                })
            }

            Device (PCI1)
            {
                Name (_ADR, 0x001E0000)
                OperationRegion (HUBR, PCI_Config, 0x00, 0xC0)
                Field (HUBR, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x04), 
                        ,   2, 
                    BME2,   1
                }

                Name (_PRT, Package (0x02)
                {
                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x00, 
                        \_SB.PCI0.ICH3.PILF, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        0x00, 
                        \_SB.PCI0.ICH3.PILC, 
                        0x00
                    }
                })
                Device (OZ68)
                {
                    Name (_ADR, 0x00090000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                    OperationRegion (SB68, PCI_Config, 0x00, 0xFF)
                    Field (SB68, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA4), 
                        PWRS,   8, 
                        PMES,   8
                    }
                }

                Device (OZ69)
                {
                    Name (_ADR, 0x00090001)
                    OperationRegion (SB69, PCI_Config, 0x00, 0xFF)
                    Field (SB69, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA4), 
                        PWR1,   8, 
                        PM1S,   8
                    }
                }

                Device (OBLN)
                {
                    Name (_ADR, 0x00050000)
                    OperationRegion (SBLN, PCI_Config, 0x00, 0xFF)
                    Field (SBLN, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x55), 
                        PMES,   8
                    }
                }
            }

            Device (OBMO)
            {
                Name (_ADR, 0x001F0006)
                OperationRegion (SBMO, PCI_Config, 0x00, 0xFF)
                Field (SBMO, ByteAcc, NoLock, Preserve)
                {
                    Offset (0xE1), 
                    PMES,   8, 
                    Offset (0xFD), 
                    PM1S,   8
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSTP, 0x01), LEqual (OSTP, 0x03)))
                    {
                        Return (Package (0x02)
                        {
                            0x03, 
                            0x01
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            0x03, 
                            0x04
                        })
                    }
                }

                OperationRegion (UCS0, PCI_Config, 0x00, 0xFF)
                Field (UCS0, ByteAcc, NoLock, Preserve)
                {
                    Offset (0xC4), 
                    U0EN,   2
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0001)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSTP, 0x01), LEqual (OSTP, 0x03)))
                    {
                        Return (Package (0x02)
                        {
                            0x04, 
                            0x01
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            0x04, 
                            0x04
                        })
                    }
                }

                OperationRegion (UCS1, PCI_Config, 0x00, 0xFF)
                Field (UCS1, ByteAcc, NoLock, Preserve)
                {
                    Offset (0xC4), 
                    U1EN,   2
                }
            }

            Device (ICH3)
            {
                Name (_ADR, 0x001F0000)
                OperationRegion (D310, PCI_Config, 0x00, 0xFF)
                Field (D310, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x40), 
                    PMIO,   16, 
                    Offset (0x58), 
                    GPIO,   16, 
                    Offset (0x60), 
                    INTA,   8, 
                    INTB,   8, 
                    INTC,   8, 
                    INTD,   8, 
                    Offset (0x68), 
                    INTE,   8, 
                    INTF,   8, 
                    INTG,   8, 
                    INTH,   8, 
                    Offset (0xC4), 
                    IOML,   8, 
                    IOMH,   8, 
                    Offset (0xCC), 
                    IOKL,   8, 
                    IOKH,   8
                }

                Device (PILA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        And (\_SB.PCI0.ICH3.INTA, 0x80, Local0)
                        If (LEqual (Local0, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {3,4,5,6,7,9,10,11,12,14,15}
                        })
                        Return (BUF0)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (\_SB.PCI0.ICH3.INTA, 0x80, \_SB.PCI0.ICH3.INTA)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {}
                        })
                        CreateWordField (BUF0, 0x01, IRQW)
                        Store (\_SB.PCI0.ICH3.INTA, Local1)
                        And (Local1, 0x80, Local1)
                        If (LNot (LEqual (Local1, 0x80)))
                        {
                            And (\_SB.PCI0.ICH3.INTA, 0x0F, Local0)
                            Store (0x01, Local2)
                            ShiftLeft (Local2, Local0, IRQW)
                        }

                        Return (BUF0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetLeftBit (IRQW, Local0)
                        Decrement (Local0)
                        And (\_SB.PCI0.ICH3.INTA, 0x70, Local1)
                        Or (Local1, Local0, \_SB.PCI0.ICH3.INTA)
                    }
                }

                Device (PILB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_STA, 0, NotSerialized)
                    {
                        And (\_SB.PCI0.ICH3.INTB, 0x80, Local0)
                        If (LEqual (Local0, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {3,4,5,6,7,9,10,11,12,14,15}
                        })
                        Return (BUF0)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (\_SB.PCI0.ICH3.INTB, 0x80, \_SB.PCI0.ICH3.INTB)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {}
                        })
                        CreateWordField (BUF0, 0x01, IRQW)
                        Store (\_SB.PCI0.ICH3.INTB, Local1)
                        And (Local1, 0x80, Local1)
                        If (LNot (LEqual (Local1, 0x80)))
                        {
                            And (\_SB.PCI0.ICH3.INTB, 0x0F, Local0)
                            Store (0x01, Local2)
                            ShiftLeft (Local2, Local0, IRQW)
                        }

                        Return (BUF0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetLeftBit (IRQW, Local0)
                        Decrement (Local0)
                        And (\_SB.PCI0.ICH3.INTB, 0x70, Local1)
                        Or (Local1, Local0, \_SB.PCI0.ICH3.INTB)
                    }
                }

                Device (PILC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_STA, 0, NotSerialized)
                    {
                        And (\_SB.PCI0.ICH3.INTC, 0x80, Local0)
                        If (LEqual (Local0, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {3,4,5,6,7,9,10,11,12,14,15}
                        })
                        Return (BUF0)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (\_SB.PCI0.ICH3.INTC, 0x80, \_SB.PCI0.ICH3.INTC)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {}
                        })
                        CreateWordField (BUF0, 0x01, IRQW)
                        Store (\_SB.PCI0.ICH3.INTC, Local1)
                        And (Local1, 0x80, Local1)
                        If (LNot (LEqual (Local1, 0x80)))
                        {
                            And (\_SB.PCI0.ICH3.INTC, 0x0F, Local0)
                            Store (0x01, Local2)
                            ShiftLeft (Local2, Local0, IRQW)
                        }

                        Return (BUF0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetLeftBit (IRQW, Local0)
                        Decrement (Local0)
                        And (\_SB.PCI0.ICH3.INTC, 0x70, Local1)
                        Or (Local1, Local0, \_SB.PCI0.ICH3.INTC)
                    }
                }

                Device (PILD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_STA, 0, NotSerialized)
                    {
                        And (\_SB.PCI0.ICH3.INTD, 0x80, Local0)
                        If (LEqual (Local0, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {3,4,5,6,7,9,10,11,12,14,15}
                        })
                        Return (BUF0)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (\_SB.PCI0.ICH3.INTD, 0x80, \_SB.PCI0.ICH3.INTD)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {}
                        })
                        CreateWordField (BUF0, 0x01, IRQW)
                        Store (\_SB.PCI0.ICH3.INTD, Local1)
                        And (Local1, 0x80, Local1)
                        If (LNot (LEqual (Local1, 0x80)))
                        {
                            And (\_SB.PCI0.ICH3.INTD, 0x0F, Local0)
                            Store (0x01, Local2)
                            ShiftLeft (Local2, Local0, IRQW)
                        }

                        Return (BUF0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetLeftBit (IRQW, Local0)
                        Decrement (Local0)
                        And (\_SB.PCI0.ICH3.INTD, 0x70, Local1)
                        Or (Local1, Local0, \_SB.PCI0.ICH3.INTD)
                    }
                }

                Device (PILE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_STA, 0, NotSerialized)
                    {
                        And (\_SB.PCI0.ICH3.INTE, 0x80, Local0)
                        If (LEqual (Local0, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {3,4,5,6,7,9,10,11,12,14,15}
                        })
                        Return (BUF0)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (\_SB.PCI0.ICH3.INTE, 0x80, \_SB.PCI0.ICH3.INTE)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {}
                        })
                        CreateWordField (BUF0, 0x01, IRQW)
                        Store (\_SB.PCI0.ICH3.INTE, Local1)
                        And (Local1, 0x80, Local1)
                        If (LNot (LEqual (Local1, 0x80)))
                        {
                            And (\_SB.PCI0.ICH3.INTE, 0x0F, Local0)
                            Store (0x01, Local2)
                            ShiftLeft (Local2, Local0, IRQW)
                        }

                        Return (BUF0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetLeftBit (IRQW, Local0)
                        Decrement (Local0)
                        And (\_SB.PCI0.ICH3.INTE, 0x70, Local1)
                        Or (Local1, Local0, \_SB.PCI0.ICH3.INTE)
                    }
                }

                Device (PILF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_STA, 0, NotSerialized)
                    {
                        And (\_SB.PCI0.ICH3.INTF, 0x80, Local0)
                        If (LEqual (Local0, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {3,4,5,6,7,9,10,11,12,14,15}
                        })
                        Return (BUF0)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (\_SB.PCI0.ICH3.INTF, 0x80, \_SB.PCI0.ICH3.INTF)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {}
                        })
                        CreateWordField (BUF0, 0x01, IRQW)
                        Store (\_SB.PCI0.ICH3.INTF, Local1)
                        And (Local1, 0x80, Local1)
                        If (LNot (LEqual (Local1, 0x80)))
                        {
                            And (\_SB.PCI0.ICH3.INTF, 0x0F, Local0)
                            Store (0x01, Local2)
                            ShiftLeft (Local2, Local0, IRQW)
                        }

                        Return (BUF0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetLeftBit (IRQW, Local0)
                        Decrement (Local0)
                        And (\_SB.PCI0.ICH3.INTF, 0x70, Local1)
                        Or (Local1, Local0, \_SB.PCI0.ICH3.INTF)
                    }
                }

                Device (PILG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_STA, 0, NotSerialized)
                    {
                        And (\_SB.PCI0.ICH3.INTG, 0x80, Local0)
                        If (LEqual (Local0, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {3,4,5,6,7,9,10,11,12,14,15}
                        })
                        Return (BUF0)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (\_SB.PCI0.ICH3.INTG, 0x80, \_SB.PCI0.ICH3.INTG)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {}
                        })
                        CreateWordField (BUF0, 0x01, IRQW)
                        Store (\_SB.PCI0.ICH3.INTG, Local1)
                        And (Local1, 0x80, Local1)
                        If (LNot (LEqual (Local1, 0x80)))
                        {
                            And (\_SB.PCI0.ICH3.INTG, 0x0F, Local0)
                            Store (0x01, Local2)
                            ShiftLeft (Local2, Local0, IRQW)
                        }

                        Return (BUF0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetLeftBit (IRQW, Local0)
                        Decrement (Local0)
                        And (\_SB.PCI0.ICH3.INTG, 0x70, Local1)
                        Or (Local1, Local0, \_SB.PCI0.ICH3.INTG)
                    }
                }

                Device (PILH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_STA, 0, NotSerialized)
                    {
                        And (\_SB.PCI0.ICH3.INTH, 0x80, Local0)
                        If (LEqual (Local0, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {3,4,5,6,7,9,10,11,12,14,15}
                        })
                        Return (BUF0)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (\_SB.PCI0.ICH3.INTH, 0x80, \_SB.PCI0.ICH3.INTH)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared) {}
                        })
                        CreateWordField (BUF0, 0x01, IRQW)
                        Store (\_SB.PCI0.ICH3.INTH, Local1)
                        And (Local1, 0x80, Local1)
                        If (LNot (LEqual (Local1, 0x80)))
                        {
                            And (\_SB.PCI0.ICH3.INTH, 0x0F, Local0)
                            Store (0x01, Local2)
                            ShiftLeft (Local2, Local0, IRQW)
                        }

                        Return (BUF0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQW)
                        FindSetLeftBit (IRQW, Local0)
                        Decrement (Local0)
                        And (\_SB.PCI0.ICH3.INTH, 0x70, Local1)
                        Or (Local1, Local0, \_SB.PCI0.ICH3.INTH)
                    }
                }

                OperationRegion (CMS2, SystemIO, 0x72, 0x02)
                Field (CMS2, ByteAcc, NoLock, Preserve)
                {
                    IND2,   8, 
                    DAT2,   8
                }

                IndexField (IND2, DAT2, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x30), 
                    C230,   8, 
                    C231,   8, 
                    C232,   8, 
                    C233,   8, 
                    Offset (0x40), 
                    C240,   8
                }

                Device (PIC0)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0020, 0x0020, 0x00, 0x02)
                        IO (Decode16, 0x00A0, 0x00A0, 0x00, 0x02)
                        IRQNoFlags () {2}
                    })
                }

                Device (DMA0)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0000, 0x0000, 0x01, 0x10)
                        IO (Decode16, 0x0081, 0x0081, 0x01, 0x0F)
                        IO (Decode16, 0x0094, 0x0094, 0x01, 0x0C)
                        IO (Decode16, 0x00C0, 0x00C0, 0x01, 0x20)
                        DMA (Compatibility, NotBusMaster, Transfer8) {4}
                    })
                }

                Device (TMR0)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0040, 0x0040, 0x01, 0x04)
                        IRQNoFlags () {0}
                    })
                }

                Device (SPK0)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0061, 0x0061, 0x01, 0x01)
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x00F0, 0x00F0, 0x01, 0x10)
                        IRQNoFlags () {13}
                    })
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0070, 0x0070, 0x01, 0x04)
                        IRQNoFlags () {8}
                    })
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0060, 0x0060, 0x00, 0x01)
                        IO (Decode16, 0x0064, 0x0064, 0x00, 0x01)
                        IRQNoFlags () {1}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                OperationRegion (SMC1, SystemIO, 0x4E, 0x02)
                Field (SMC1, ByteAcc, NoLock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                {
                    CR00,   8, 
                    CR01,   8, 
                    CR02,   8, 
                    Offset (0x04), 
                    CR04,   8, 
                    Offset (0x0C), 
                    CR0C,   8, 
                    Offset (0x20), 
                    CR20,   8, 
                    Offset (0x23), 
                    CR23,   8, 
                    CR24,   8, 
                    CR25,   8, 
                    CR26,   8, 
                    CR27,   8, 
                    CR28,   8, 
                    Offset (0x2B), 
                    CR2B,   8, 
                    CR2C,   8
                }

                Method (ENCF, 0, NotSerialized)
                {
                    Store (0x55, INDX)
                }

                Method (EXCF, 0, NotSerialized)
                {
                    Store (0xAA, INDX)
                }

                Device (LPT)
                {
                    Name (_HID, EisaId ("PNP0400"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR04, 0x02, Local0)
                        If (LNot (LEqual (Local0, 0x02)))
                        {
                            And (CR01, 0x04, Local1)
                            If (LEqual (Local1, 0x04))
                            {
                                EXCF ()
                                Return (0x0F)
                            }
                            Else
                            {
                                EXCF ()
                                Return (0x0D)
                            }
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x00)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR01, 0xF3, CR01)
                        EXCF ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16, 0x03BC, 0x03BC, 0x00, 0x04)
                            IRQNoFlags () {7}
                        })
                        CreateWordField (BUF0, 0x02, IOLO)
                        CreateWordField (BUF0, 0x04, IOHI)
                        CreateByteField (BUF0, 0x07, LEN0)
                        CreateWordField (BUF0, 0x09, IRQ0)
                        ENCF ()
                        And (CR01, 0x04, Local1)
                        If (LEqual (Local1, 0x04))
                        {
                            And (CR04, 0x02, Local0)
                            If (LNot (LEqual (Local0, 0x02)))
                            {
                                Store (CR23, Local0)
                                ShiftLeft (Local0, 0x02, Local1)
                                Store (Local1, IOLO)
                                Store (Local1, IOHI)
                                If (LEqual (Local1, 0x03BC))
                                {
                                    Store (0x04, LEN0)
                                }
                                Else
                                {
                                    Store (0x08, LEN0)
                                }

                                And (CR27, 0x0F, Local2)
                                ShiftLeft (0x01, Local2, IRQ0)
                            }
                        }

                        EXCF ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16, 0x0378, 0x0378, 0x00, 0x08)
                            IRQNoFlags () {5,7}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16, 0x0278, 0x0278, 0x00, 0x08)
                            IRQNoFlags () {5,7}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16, 0x03BC, 0x03BC, 0x00, 0x04)
                            IRQNoFlags () {5,7}
                        }
                        /*** Missing EndDependentFunctions descriptor */                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x09, IRQ0)
                        ENCF ()
                        ShiftLeft (IOHI, 0x06, Local0)
                        ShiftRight (IOLO, 0x02, Local1)
                        Or (Local0, Local1, CR23)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        And (CR27, 0xF0, CR27)
                        Or (CR27, Local0, CR27)
                        Store (0x67, CR27)
                        And (CR01, 0xF7, CR01)
                        Or (CR01, 0x04, CR01)
                        EXCF ()
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR04, 0x02, Local0)
                        If (LEqual (Local0, 0x02))
                        {
                            Return (0x03)
                        }

                        And (CR01, 0x04, Local1)
                        If (LEqual (Local1, 0x04))
                        {
                            EXCF ()
                            Return (0x00)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x03)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR01, 0xF7, CR01)
                        Or (CR01, 0x04, CR01)
                        EXCF ()
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR01, 0xF3, CR01)
                        EXCF ()
                    }
                }

                Device (ECP)
                {
                    Name (_HID, EisaId ("PNP0401"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR04, 0x02, Local0)
                        If (LEqual (Local0, 0x02))
                        {
                            And (CR01, 0x04, Local1)
                            If (LEqual (Local1, 0x04))
                            {
                                EXCF ()
                                Return (0x0F)
                            }
                            Else
                            {
                                EXCF ()
                                Return (0x0D)
                            }
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x00)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR01, 0xF3, CR01)
                        EXCF ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16, 0x0378, 0x0378, 0x00, 0x08)
                            IO (Decode16, 0x0778, 0x0778, 0x00, 0x04)
                            IRQNoFlags () {7}
                            DMA (Compatibility, NotBusMaster, Transfer8_16) {1}
                        })
                        CreateWordField (BUF0, 0x02, IOLO)
                        CreateWordField (BUF0, 0x04, IOHI)
                        CreateWordField (BUF0, 0x0A, I2LO)
                        CreateWordField (BUF0, 0x0C, I2HI)
                        CreateByteField (BUF0, 0x07, LEN1)
                        CreateByteField (BUF0, 0x0F, LEN2)
                        CreateWordField (BUF0, 0x11, IRQ0)
                        CreateByteField (BUF0, 0x14, DMA0)
                        ENCF ()
                        And (CR04, 0x02, Local0)
                        And (CR01, 0x04, Local1)
                        If (LAnd (LEqual (Local1, 0x04), LEqual (Local0, 0x02)))
                        {
                            Store (CR23, Local0)
                            ShiftLeft (Local0, 0x02, Local1)
                            Store (Local1, IOLO)
                            Store (Local1, IOHI)
                            Add (Local1, 0x0400, Local2)
                            Store (Local2, I2LO)
                            Store (Local2, I2HI)
                            If (LEqual (Local1, 0x03BC))
                            {
                                Store (0x04, LEN1)
                            }
                            Else
                            {
                                Store (0x08, LEN1)
                            }

                            And (CR27, 0x0F, Local2)
                            ShiftLeft (0x01, Local2, IRQ0)
                            And (CR26, 0x03, Local2)
                            ShiftLeft (0x01, Local2, DMA0)
                        }

                        EXCF ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16, 0x0378, 0x0378, 0x00, 0x08)
                            IO (Decode16, 0x0778, 0x0778, 0x00, 0x04)
                            IRQNoFlags () {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8_16) {1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16, 0x0278, 0x0278, 0x00, 0x08)
                            IO (Decode16, 0x0678, 0x0678, 0x00, 0x04)
                            IRQNoFlags () {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8_16) {1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16, 0x03BC, 0x03BC, 0x00, 0x04)
                            IO (Decode16, 0x07BC, 0x07BC, 0x00, 0x04)
                            IRQNoFlags () {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8_16) {1,3}
                        }
                        /*** Missing EndDependentFunctions descriptor */                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x11, IRQ0)
                        CreateByteField (Arg0, 0x14, DMA0)
                        ENCF ()
                        ShiftLeft (IOHI, 0x06, Local0)
                        ShiftRight (IOLO, 0x02, Local1)
                        Or (Local0, Local1, CR23)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        And (CR27, 0xF0, CR27)
                        Or (CR27, Local0, CR27)
                        Store (0x67, CR27)
                        FindSetRightBit (DMA0, Local0)
                        Decrement (Local0)
                        Store (CR26, Local1)
                        And (Local1, 0xF0, Local1)
                        Or (Local1, Local0, CR26)
                        And (CR04, 0xFC, Local0)
                        Or (Local0, 0x02, CR04)
                        And (CR01, 0xF7, CR01)
                        Or (CR01, 0x04, CR01)
                        EXCF ()
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR04, 0x02, Local0)
                        If (LNot (LEqual (Local0, 0x02)))
                        {
                            Return (0x03)
                        }

                        And (CR01, 0x04, Local1)
                        If (LEqual (Local0, 0x04))
                        {
                            EXCF ()
                            Return (0x00)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x03)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR01, 0xF7, CR01)
                        Or (CR01, 0x04, CR01)
                        EXCF ()
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR01, 0xF3, CR01)
                        EXCF ()
                    }
                }

                Device (FDC0)
                {
                    Name (_HID, EisaId ("PNP0700"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR00, 0x08, Local0)
                        If (LEqual (Local0, 0x08))
                        {
                            EXCF ()
                            Return (0x0F)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x0D)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR00, 0xF7, Local0)
                        Store (Local0, CR00)
                        EXCF ()
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x03F0, 0x03F0, 0x00, 0x06)
                        IO (Decode16, 0x03F7, 0x03F7, 0x00, 0x01)
                        IRQNoFlags () {6}
                        DMA (Compatibility, NotBusMaster, Transfer8_16) {2}
                    })
                    Name (_PRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x03F0, 0x03F0, 0x00, 0x06)
                        IO (Decode16, 0x03F7, 0x03F7, 0x00, 0x01)
                        IRQNoFlags () {6}
                        DMA (Compatibility, NotBusMaster, Transfer8_16) {2}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateByteField (Arg0, 0x11, IRQ0)
                        CreateByteField (Arg0, 0x14, DMA0)
                        ENCF ()
                        ShiftRight (IOLO, 0x02, Local0)
                        ShiftLeft (IOHI, 0x06, Local1)
                        Or (Local1, Local0, Local1)
                        And (Local1, 0xFC, Local1)
                        Store (Local1, CR20)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        ShiftLeft (Local0, 0x04, Local0)
                        And (CR27, 0x0F, CR27)
                        Or (CR27, Local0, CR27)
                        FindSetRightBit (DMA0, Local0)
                        Decrement (Local0)
                        ShiftLeft (Local0, 0x04, Local0)
                        And (CR26, 0x0F, CR26)
                        Or (CR26, Local0, CR26)
                        Or (CR00, 0x08, CR00)
                        EXCF ()
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        ENCF ()
                        If (LAnd (CR00, 0x08))
                        {
                            EXCF ()
                            Return (0x00)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x03)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        ENCF ()
                        Or (CR00, 0x08, CR00)
                        EXCF ()
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR00, 0xF7, CR00)
                        EXCF ()
                    }
                }

                Device (COM1)
                {
                    Name (_HID, EisaId ("PNP0501"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR02, 0x08, Local0)
                        If (LEqual (Local0, 0x08))
                        {
                            EXCF ()
                            Return (0x0F)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x0D)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR02, 0xF7, Local0)
                        Store (Local0, CR02)
                        EXCF ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16, 0x03F8, 0x03F8, 0x00, 0x08)
                            IRQNoFlags () {4}
                        })
                        CreateWordField (BUF0, 0x02, IOLO)
                        CreateWordField (BUF0, 0x04, IOHI)
                        CreateWordField (BUF0, 0x09, IRQ0)
                        ENCF ()
                        And (CR02, 0x08, Local0)
                        If (LEqual (Local0, 0x08))
                        {
                            ShiftRight (CR24, 0x06, Local1)
                            ShiftLeft (CR24, 0x02, Local2)
                            Or (ShiftLeft (Local1, 0x08), Local2, Local3)
                            Store (Local3, IOLO)
                            Store (Local3, IOHI)
                            And (CR28, 0xF0, Local0)
                            ShiftLeft (0x01, ShiftRight (Local0, 0x04), IRQ0)
                        }

                        EXCF ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16, 0x03F8, 0x03F8, 0x00, 0x08)
                            IRQNoFlags () {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16, 0x02F8, 0x02F8, 0x00, 0x08)
                            IRQNoFlags () {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16, 0x03E8, 0x03E8, 0x00, 0x08)
                            IRQNoFlags () {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16, 0x02E8, 0x02E8, 0x00, 0x08)
                            IRQNoFlags () {3,4}
                        }
                        /*** Missing EndDependentFunctions descriptor */                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x09, IRQ0)
                        ENCF ()
                        ShiftLeft (IOHI, 0x06, Local0)
                        ShiftRight (IOLO, 0x02, Local1)
                        Or (Local0, Local1, CR24)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (CR28, Local1)
                        Or (ShiftLeft (Local0, 0x04), And (Local1, 0x0F, Local1), CR28)
                        Or (CR02, 0x08, CR02)
                        EXCF ()
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        ENCF ()
                        And (CR02, 0x08, Local0)
                        If (LEqual (Local0, 0x08))
                        {
                            EXCF ()
                            Return (0x00)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x03)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (CR02, Local0)
                        Or (Local0, 0x08, Local0)
                        Store (Local0, CR02)
                        EXCF ()
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                    }
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags () {12}
                    })
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x1D)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0062, 0x0062, 0x00, 0x01)
                        IO (Decode16, 0x0066, 0x0066, 0x00, 0x01)
                    })
                    OperationRegion (RAM, EmbeddedControl, 0x00, 0x7F)
                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                        Offset (0x01), 
                        SCIC,   8, 
                        Offset (0x04), 
                        CMCD,   8, 
                        DAT1,   8, 
                        DAT2,   8, 
                        DAT3,   8, 
                        Offset (0x43), 
                        P50,    1, 
                            ,   2, 
                        P43,    1, 
                        P54,    1, 
                        P55,    1, 
                        Offset (0x44), 
                        Offset (0x48), 
                        P54S,   8, 
                        P55S,   8, 
                        P50S,   8, 
                        P43S,   8, 
                        P54T,   8, 
                        P55T,   8, 
                        P50T,   8, 
                        P43T,   8, 
                        P60S,   8, 
                        P61S,   8, 
                        P62S,   8, 
                        P63S,   8, 
                        P64S,   8, 
                        Offset (0x57), 
                        P67S,   8, 
                        Offset (0x5F), 
                        P67T,   8, 
                        Offset (0x78), 
                        P60,    1, 
                        P61,    1, 
                        P62,    1, 
                        P63,    1, 
                        P64,    1, 
                        P65,    1, 
                        P66,    1, 
                        P67,    1
                    }

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

                    Method (_Q01, 0, NotSerialized)
                    {
                        Store (0xF1, PX80)
                        Store (0x00, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (_Q02, 0, NotSerialized)
                    {
                        Store (0xF2, PX80)
                        Store (0x01, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (_Q0C, 0, NotSerialized)
                    {
                        Store (0xF3, PX80)
                        Store (0x07, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (_Q03, 0, NotSerialized)
                    {
                        Store (0xF4, PX80)
                        Store (0x02, IOB3)
                        Store (0x31, IOB2)
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q04, 0, NotSerialized)
                    {
                        If (LOr (LEqual (SizeOf (\_OS), 0x11), LEqual (SizeOf (\_OS), 0x27)))
                        {
                            Store (0xF5, PX80)
                            Store (0x03, IOB3)
                            Store (0x31, IOB2)
                            Notify (\_SB.PCI0.VGA0, 0x81)
                        }
                        Else
                        {
                            Store (0x00, Local2)
                            If (CondRefOf (_OSI, Local0))
                            {
                                If (\_OSI ("Windows 2001"))
                                {
                                    Store (0x03, Local2)
                                }
                            }

                            If (LEqual (Local2, 0x03))
                            {
                                Notify (\_SB.PCI0, 0x00)
                                Sleep (0x03E8)
                                Notify (\_SB.PCI0.VGA0, 0x80)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.VGA0, 0x00)
                                Sleep (0x03E8)
                                Notify (\_SB.PCI0.VGA0, 0x80)
                            }
                        }
                    }

                    Method (_Q0F, 0, NotSerialized)
                    {
                        Store (0xF6, PX80)
                        Store (0x04, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (_Q10, 0, NotSerialized)
                    {
                        Store (0xF7, PX80)
                        Store (0x05, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store (0xF8, PX80)
                        Store (0x06, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (_Q31, 0, NotSerialized)
                    {
                        Sleep (0xC8)
                        Store (0x31, PX80)
                        Store (0x08, IOB3)
                        Store (0x31, IOB2)
                        If (LEqual (\_SB.PCI0.ICH3.EC0.P61, 0x01))
                        {
                            Store (0x80, \_SB.PCI0.ICH3.EC0.P61S)
                        }
                        Else
                        {
                            Store (0x90, \_SB.PCI0.ICH3.EC0.P61S)
                        }

                        Notify (\_SB.AC, 0x80)
                        Notify (\_SB.BAT0, 0x80)
                        Acquire (ABC, 0xFFFF)
                        Notify (\_PR.CPU0, 0x80)
                        Release (ABC)
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Sleep (0xC8)
                        Store (0x32, PX80)
                        Store (0x02, IOB3)
                        Store (0x31, IOB2)
                        Store (0x18, IOB3)
                        Store (0x31, IOB2)
                        If (LEqual (\_SB.PCI0.ICH3.EC0.P62, 0x01))
                        {
                            Store (0x32, PX80)
                            Store (0x80, \_SB.PCI0.ICH3.EC0.P62S)
                        }
                        Else
                        {
                            Store (0x42, PX80)
                            Store (0x90, \_SB.PCI0.ICH3.EC0.P62S)
                        }

                        Store (0x04, IOB3)
                        Store (0x33, IOB2)
                        Sleep (0x0FA0)
                        Notify (\_SB.BAT0, 0x81)
                        Notify (\_SB.BAT0, 0x81)
                        Notify (\_PR.CPU0, 0x80)
                        Store (0x35, IOB2)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x63, PX80)
                        Store (0x4B, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x64, PX80)
                        Store (0x49, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (_Q35, 0, NotSerialized)
                    {
                        Store (0x65, PX80)
                        Store (0x48, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (_Q36, 0, NotSerialized)
                    {
                        Store (0x66, PX80)
                        Store (0x47, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (_Q2E, 0, NotSerialized)
                    {
                        Store (0x2E, PX80)
                        If (LEqual (\_SB.PCI0.ICH3.EC0.P54, 0x00))
                        {
                            Store (0x98, \_SB.PCI0.ICH3.EC0.P54S)
                            Store (0x86, \_SB.PCI0.ICH3.EC0.P54T)
                            Store (0x00, \LIDS)
                            Store (0x04, IOB3)
                            Store (0x31, IOB2)
                        }
                        Else
                        {
                            Store (0x01, \LIDS)
                        }

                        Store (0x35, IOB2)
                        Notify (\_SB.LID, 0x80)
                    }

                    Method (_Q2F, 0, NotSerialized)
                    {
                        Store (0x2F, PX80)
                        Store (0x50, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (_Q41, 0, NotSerialized)
                    {
                        Store (0xA0, PX80)
                        If (LOr (LEqual (SizeOf (\_OS), 0x11), LEqual (SizeOf (\_OS), 0x27)))
                        {
                            Store (0x07, PX80)
                        }
                        Else
                        {
                            Store (0x17, PX80)
                            Notify (\_SB.PCI0.VGA0, 0x80)
                        }
                    }

                    Method (_Q77, 0, NotSerialized)
                    {
                        Store (0x77, PX80)
                        Sleep (0xC8)
                        Store (0x34, IOB2)
                        If (LEqual (SizeOf (\_OS), 0x11)) {}
                        Else
                        {
                            Notify (\_TZ.THR1, 0x80)
                            Notify (\_TZ.THR2, 0x80)
                        }
                    }

                    Method (_Q78, 0, NotSerialized)
                    {
                        Store (0x78, PX80)
                        Sleep (0xC8)
                        Store (0x36, IOB2)
                        If (LEqual (SizeOf (\_OS), 0x11)) {}
                        Else
                        {
                            Notify (\_TZ.THR1, 0x80)
                            Notify (\_TZ.THR2, 0x80)
                        }
                    }

                    Method (_Q79, 0, NotSerialized)
                    {
                        Store (0x79, PX80)
                        Sleep (0x03E8)
                        If (LEqual (SizeOf (\_OS), 0x11)) {}
                        Else
                        {
                            Notify (\_TZ.THR1, 0x80)
                            Notify (\_TZ.THR2, 0x80)
                        }
                    }

                    Method (_Q7F, 0, NotSerialized)
                    {
                        Store (0x7F, PX80)
                        Store (0x10, IOB3)
                        Store (0x31, IOB2)
                    }

                    Method (ECC5, 1, NotSerialized)
                    {
                        Store (Arg0, \_SB.PCI0.ICH3.EC0.DAT1)
                        Store (0xC5, \_SB.PCI0.ICH3.EC0.CMCD)
                    }

                    Method (ECC9, 1, NotSerialized)
                    {
                        Store (Arg0, \_SB.PCI0.ICH3.EC0.DAT1)
                        Store (0xC9, \_SB.PCI0.ICH3.EC0.CMCD)
                    }

                    Method (ECBB, 3, NotSerialized)
                    {
                        Store (Arg0, \_SB.PCI0.ICH3.EC0.DAT1)
                        Store (Arg1, \_SB.PCI0.ICH3.EC0.DAT2)
                        Store (Arg2, \_SB.PCI0.ICH3.EC0.DAT3)
                        Store (0xBB, \_SB.PCI0.ICH3.EC0.CMCD)
                    }
                }
            }

            Device (IDE)
            {
                Name (_ADR, 0x001F0001)
                OperationRegion (IDEC, PCI_Config, 0x40, 0x18)
                Field (IDEC, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                    Offset (0x08), 
                    SDMA,   4, 
                    Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                    Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                    Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4
                }

                OperationRegion (PCI, PCI_Config, 0x00, 0x58)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x56), 
                    PSIG,   2, 
                    SSIG,   2
                }

                Device (PRIM)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (PBUF, Buffer (0x14)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            0x00, 0x00, 0x00, 0x00
                        })
                        CreateDWordField (PBUF, 0x00, PIO0)
                        CreateDWordField (PBUF, 0x04, DMA0)
                        CreateDWordField (PBUF, 0x08, PIO1)
                        CreateDWordField (PBUF, 0x0C, DMA1)
                        CreateDWordField (PBUF, 0x10, FLAG)
                        Store (GETP (PRIT), PIO0)
                        Store (GETD (And (SDMA, 0x01), And (ICR3, 0x01), And (ICR0, 0x01), SDT0), DMA0)
                        If (LEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (PIO0, DMA0)
                        }

                        If (And (PRIT, 0x4000))
                        {
                            If (LEqual (And (PRIT, 0x90), 0x80))
                            {
                                Store (0x0384, PIO1)
                            }
                            Else
                            {
                                Store (GETT (PSIT), PIO1)
                            }
                        }
                        Else
                        {
                            Store (0xFFFFFFFF, PIO1)
                        }

                        Store (GETD (And (SDMA, 0x02), And (ICR3, 0x02), And (ICR0, 0x02), SDT1), DMA1)
                        If (LEqual (DMA1, 0xFFFFFFFF))
                        {
                            Store (PIO1, DMA1)
                        }

                        Store (GETF (And (SDMA, 0x01), And (SDMA, 0x02), PRIT), FLAG)
                        Return (PBUF)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        CreateDWordField (Arg0, 0x00, PIO0)
                        CreateDWordField (Arg0, 0x04, DMA0)
                        CreateDWordField (Arg0, 0x08, PIO1)
                        CreateDWordField (Arg0, 0x0C, DMA1)
                        CreateDWordField (Arg0, 0x10, FLAG)
                        Store (0x04, ICR2)
                        If (LEqual (SizeOf (Arg1), 0x0200))
                        {
                            And (PRIT, 0x40F0, PRIT)
                            And (SDMA, 0x0E, SDMA)
                            Store (0x00, SDT0)
                            And (ICR0, 0x0E, ICR0)
                            And (ICR1, 0x0E, ICR1)
                            And (ICR3, 0x0E, ICR3)
                            And (ICR5, 0x0E, ICR5)
                            CreateWordField (Arg1, 0x62, W490)
                            CreateWordField (Arg1, 0x6A, W530)
                            CreateWordField (Arg1, 0x7E, W630)
                            CreateWordField (Arg1, 0x80, W640)
                            CreateWordField (Arg1, 0xB0, W880)
                            Or (PRIT, 0x8004, PRIT)
                            If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                            {
                                Or (PRIT, 0x02, PRIT)
                            }

                            Or (PRIT, SETP (PIO0, W530, W640), PRIT)
                            If (And (FLAG, 0x01))
                            {
                                Or (SDMA, 0x01, SDMA)
                                Store (SETD (DMA0), SDT0)
                                If (And (W880, 0x20))
                                {
                                    Or (ICR5, 0x01, ICR5)
                                }

                                If (And (W880, 0x10))
                                {
                                    Or (ICR1, 0x01, ICR1)
                                }

                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x01, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x01, ICR0)
                                }
                            }
                        }

                        If (LEqual (SizeOf (Arg2), 0x0200))
                        {
                            And (PRIT, 0x3F0F, PRIT)
                            Store (0x00, PSIT)
                            And (SDMA, 0x0D, SDMA)
                            Store (0x00, SDT1)
                            And (ICR0, 0x0D, ICR0)
                            And (ICR1, 0x0D, ICR1)
                            And (ICR3, 0x0D, ICR3)
                            And (ICR5, 0x0D, ICR5)
                            CreateWordField (Arg2, 0x62, W491)
                            CreateWordField (Arg2, 0x6A, W531)
                            CreateWordField (Arg2, 0x7E, W631)
                            CreateWordField (Arg2, 0x80, W641)
                            CreateWordField (Arg2, 0xB0, W881)
                            Or (PRIT, 0x8040, PRIT)
                            If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                            {
                                Or (PRIT, 0x20, PRIT)
                            }

                            If (And (FLAG, 0x10))
                            {
                                Or (PRIT, 0x4000, PRIT)
                                If (LGreater (PIO1, 0xF0))
                                {
                                    Or (PRIT, 0x80, PRIT)
                                }
                                Else
                                {
                                    Or (PRIT, 0x10, PRIT)
                                    Store (SETT (PIO1, W531, W641), PSIT)
                                }
                            }

                            If (And (FLAG, 0x04))
                            {
                                Or (SDMA, 0x02, SDMA)
                                Store (SETD (DMA1), SDT1)
                                If (And (W881, 0x20))
                                {
                                    Or (ICR5, 0x02, ICR5)
                                }

                                If (And (W881, 0x10))
                                {
                                    Or (ICR1, 0x02, ICR1)
                                }

                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x02, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x02, ICR0)
                                }
                            }
                        }
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB0, Buffer (0x0E)
                            {
                                0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                            })
                            CreateByteField (PIB0, 0x01, PMD0)
                            CreateByteField (PIB0, 0x08, DMD0)
                            If (And (PRIT, 0x02))
                            {
                                If (LEqual (And (PRIT, 0x09), 0x08))
                                {
                                    Store (0x08, PMD0)
                                }
                                Else
                                {
                                    Store (0x0A, PMD0)
                                    ShiftRight (And (PRIT, 0x0300), 0x08, Local0)
                                    ShiftRight (And (PRIT, 0x3000), 0x0C, Local1)
                                    Add (Local0, Local1, Local2)
                                    If (LEqual (0x03, Local2))
                                    {
                                        Store (0x0B, PMD0)
                                    }

                                    If (LEqual (0x05, Local2))
                                    {
                                        Store (0x0C, PMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD0)
                            }

                            If (And (SDMA, 0x01))
                            {
                                Store (Or (SDT0, 0x40), DMD0)
                                If (And (ICR0, 0x01))
                                {
                                    Add (DMD0, 0x02, DMD0)
                                }

                                If (And (ICR3, 0x01))
                                {
                                    Store (0x45, DMD0)
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                            }

                            Return (PIB0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB1, Buffer (0x0E)
                            {
                                0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                            })
                            CreateByteField (PIB1, 0x01, PMD1)
                            CreateByteField (PIB1, 0x08, DMD1)
                            If (And (PRIT, 0x20))
                            {
                                If (LEqual (And (PRIT, 0x90), 0x80))
                                {
                                    Store (0x08, PMD1)
                                }
                                Else
                                {
                                    Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 0x02), Local0)
                                    If (LEqual (0x05, Local0))
                                    {
                                        Store (0x0C, PMD1)
                                    }
                                    Else
                                    {
                                        If (LEqual (0x03, Local0))
                                        {
                                            Store (0x0B, PMD1)
                                        }
                                        Else
                                        {
                                            Store (0x0A, PMD1)
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD1)
                            }

                            If (And (SDMA, 0x02))
                            {
                                Store (Or (SDT1, 0x40), DMD1)
                                If (And (ICR0, 0x02))
                                {
                                    Add (DMD1, 0x02, DMD1)
                                }

                                If (And (ICR3, 0x02))
                                {
                                    Store (0x45, DMD1)
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                            }

                            Return (PIB1)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                    }
                }

                Device (SECN)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (SBUF, Buffer (0x14)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            0x00, 0x00, 0x00, 0x00
                        })
                        CreateDWordField (SBUF, 0x00, PIO0)
                        CreateDWordField (SBUF, 0x04, DMA0)
                        CreateDWordField (SBUF, 0x08, PIO1)
                        CreateDWordField (SBUF, 0x0C, DMA1)
                        CreateDWordField (SBUF, 0x10, FLAG)
                        Store (GETP (SECT), PIO0)
                        Store (GETD (And (SDMA, 0x04), And (ICR3, 0x04), And (ICR0, 0x04), SDT2), DMA0)
                        If (LEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (PIO0, DMA0)
                        }

                        If (And (SECT, 0x4000))
                        {
                            If (LEqual (And (SECT, 0x90), 0x80))
                            {
                                Store (0x0384, PIO1)
                            }
                            Else
                            {
                                Store (GETT (SSIT), PIO1)
                            }
                        }
                        Else
                        {
                            Store (0xFFFFFFFF, PIO1)
                        }

                        Store (GETD (And (SDMA, 0x08), And (ICR3, 0x08), And (ICR0, 0x08), SDT3), DMA1)
                        If (LEqual (DMA1, 0xFFFFFFFF))
                        {
                            Store (PIO1, DMA1)
                        }

                        Store (GETF (And (SDMA, 0x04), And (SDMA, 0x08), SECT), FLAG)
                        Return (SBUF)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        CreateDWordField (Arg0, 0x00, PIO0)
                        CreateDWordField (Arg0, 0x04, DMA0)
                        CreateDWordField (Arg0, 0x08, PIO1)
                        CreateDWordField (Arg0, 0x0C, DMA1)
                        CreateDWordField (Arg0, 0x10, FLAG)
                        Store (0x04, ICR2)
                        If (LEqual (SizeOf (Arg1), 0x0200))
                        {
                            And (SECT, 0x40F0, SECT)
                            And (SDMA, 0x0B, SDMA)
                            Store (0x00, SDT2)
                            And (ICR0, 0x0B, ICR0)
                            And (ICR1, 0x0B, ICR1)
                            And (ICR3, 0x0B, ICR3)
                            And (ICR5, 0x0B, ICR5)
                            CreateWordField (Arg1, 0x62, W490)
                            CreateWordField (Arg1, 0x6A, W530)
                            CreateWordField (Arg1, 0x7E, W630)
                            CreateWordField (Arg1, 0x80, W640)
                            CreateWordField (Arg1, 0xB0, W880)
                            Or (SECT, 0x8004, SECT)
                            If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                            {
                                Or (SECT, 0x02, SECT)
                            }

                            Or (SECT, SETP (PIO0, W530, W640), SECT)
                            If (And (FLAG, 0x01))
                            {
                                Or (SDMA, 0x04, SDMA)
                                Store (SETD (DMA0), SDT2)
                                If (And (W880, 0x20))
                                {
                                    Or (ICR5, 0x04, ICR5)
                                }

                                If (And (W880, 0x10))
                                {
                                    Or (ICR1, 0x04, ICR1)
                                }

                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x04, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x04, ICR0)
                                }
                            }
                        }

                        If (LEqual (SizeOf (Arg2), 0x0200))
                        {
                            And (SECT, 0x3F0F, SECT)
                            Store (0x00, SSIT)
                            And (SDMA, 0x07, SDMA)
                            Store (0x00, SDT3)
                            And (ICR0, 0x07, ICR0)
                            And (ICR1, 0x07, ICR1)
                            And (ICR3, 0x07, ICR3)
                            And (ICR5, 0x07, ICR5)
                            CreateWordField (Arg2, 0x62, W491)
                            CreateWordField (Arg2, 0x6A, W531)
                            CreateWordField (Arg2, 0x7E, W631)
                            CreateWordField (Arg2, 0x80, W641)
                            CreateWordField (Arg2, 0xB0, W881)
                            Or (SECT, 0x8040, SECT)
                            If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                            {
                                Or (SECT, 0x20, SECT)
                            }

                            If (And (FLAG, 0x10))
                            {
                                Or (SECT, 0x4000, SECT)
                                If (LGreater (PIO1, 0xF0))
                                {
                                    Or (SECT, 0x80, SECT)
                                }
                                Else
                                {
                                    Or (SECT, 0x10, SECT)
                                    Store (SETT (PIO1, W531, W641), SSIT)
                                }
                            }

                            If (And (FLAG, 0x04))
                            {
                                Or (SDMA, 0x08, SDMA)
                                Store (SETD (DMA1), SDT3)
                                If (And (W881, 0x20))
                                {
                                    Or (ICR5, 0x08, ICR5)
                                }

                                If (And (W881, 0x10))
                                {
                                    Or (ICR1, 0x08, ICR1)
                                }

                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x08, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x08, ICR0)
                                }
                            }
                        }
                    }

                    Device (CDRM)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (SIB0, Buffer (0x0E)
                            {
                                0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                            })
                            CreateByteField (SIB0, 0x01, PMD0)
                            CreateByteField (SIB0, 0x08, DMD0)
                            If (And (SECT, 0x02))
                            {
                                If (LEqual (And (SECT, 0x09), 0x08))
                                {
                                    Store (0x08, PMD0)
                                }
                                Else
                                {
                                    Store (0x0A, PMD0)
                                    ShiftRight (And (SECT, 0x0300), 0x08, Local0)
                                    ShiftRight (And (SECT, 0x3000), 0x0C, Local1)
                                    Add (Local0, Local1, Local2)
                                    If (LEqual (0x03, Local2))
                                    {
                                        Store (0x0B, PMD0)
                                    }

                                    If (LEqual (0x05, Local2))
                                    {
                                        Store (0x0C, PMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD0)
                            }

                            If (And (SDMA, 0x04))
                            {
                                Store (Or (SDT2, 0x40), DMD0)
                                If (And (ICR0, 0x04))
                                {
                                    Add (DMD0, 0x02, DMD0)
                                }

                                If (And (ICR3, 0x04))
                                {
                                    Store (0x45, DMD0)
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                            }

                            Return (SIB0)
                        }
                    }

                    Device (SALV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (SIB1, Buffer (0x0E)
                            {
                                0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                            })
                            CreateByteField (SIB1, 0x01, PMD1)
                            CreateByteField (SIB1, 0x08, DMD1)
                            If (And (SECT, 0x20))
                            {
                                If (LEqual (And (SECT, 0x90), 0x80))
                                {
                                    Store (0x08, PMD1)
                                }
                                Else
                                {
                                    Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 0x02), Local0)
                                    If (LEqual (0x05, Local0))
                                    {
                                        Store (0x0C, PMD1)
                                    }
                                    Else
                                    {
                                        If (LEqual (0x03, Local0))
                                        {
                                            Store (0x0B, PMD1)
                                        }
                                        Else
                                        {
                                            Store (0x0A, PMD1)
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD1)
                            }

                            If (And (SDMA, 0x08))
                            {
                                Store (Or (SDT3, 0x40), DMD1)
                                If (And (ICR0, 0x08))
                                {
                                    Add (DMD1, 0x02, DMD1)
                                }

                                If (And (ICR3, 0x08))
                                {
                                    Store (0x45, DMD1)
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                            }

                            Return (SIB1)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                    }
                }

                Method (GETP, 1, NotSerialized)
                {
                    If (LEqual (And (Arg0, 0x09), 0x00))
                    {
                        Return (0xFFFFFFFF)
                    }

                    If (LEqual (And (Arg0, 0x09), 0x08))
                    {
                        Return (0x0384)
                    }

                    ShiftRight (And (Arg0, 0x0300), 0x08, Local0)
                    ShiftRight (And (Arg0, 0x3000), 0x0C, Local1)
                    Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))))
                }

                Method (GETD, 4, NotSerialized)
                {
                    If (Arg0)
                    {
                        If (Arg1)
                        {
                            Return (0x14)
                        }

                        If (Arg2)
                        {
                            Return (Multiply (Subtract (0x04, Arg3), 0x0F))
                        }

                        Return (Multiply (Subtract (0x04, Arg3), 0x1E))
                    }

                    Return (0xFFFFFFFF)
                }

                Method (GETT, 1, NotSerialized)
                {
                    Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02), 0x03), And (Arg0, 0x03)))))
                }

                Method (GETF, 3, NotSerialized)
                {
                    Name (TMPF, 0x00)
                    If (Arg0)
                    {
                        Or (TMPF, 0x01, TMPF)
                    }

                    If (And (Arg2, 0x02))
                    {
                        Or (TMPF, 0x02, TMPF)
                    }

                    If (Arg1)
                    {
                        Or (TMPF, 0x04, TMPF)
                    }

                    If (And (Arg2, 0x20))
                    {
                        Or (TMPF, 0x08, TMPF)
                    }

                    If (And (Arg2, 0x4000))
                    {
                        Or (TMPF, 0x10, TMPF)
                    }

                    Return (TMPF)
                }

                Method (SETP, 3, NotSerialized)
                {
                    If (LNot (LLess (Arg0, 0xF0)))
                    {
                        Return (0x08)
                    }
                    Else
                    {
                        If (And (Arg1, 0x02))
                        {
                            If (LAnd (LNot (LGreater (Arg0, 0x78)), And (Arg2, 0x02)))
                            {
                                Return (0x2301)
                            }

                            If (LAnd (LNot (LGreater (Arg0, 0xB4)), And (Arg2, 0x01)))
                            {
                                Return (0x2101)
                            }
                        }

                        Return (0x1001)
                    }
                }

                Method (SETD, 1, NotSerialized)
                {
                    If (LNot (LGreater (Arg0, 0x17)))
                    {
                        Return (0x01)
                    }

                    If (LNot (LGreater (Arg0, 0x1E)))
                    {
                        Return (0x02)
                    }

                    If (LNot (LGreater (Arg0, 0x2D)))
                    {
                        Return (0x01)
                    }

                    If (LNot (LGreater (Arg0, 0x3C)))
                    {
                        Return (0x02)
                    }

                    If (LNot (LGreater (Arg0, 0x5A)))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SETT, 3, NotSerialized)
                {
                    If (And (Arg1, 0x02))
                    {
                        If (LAnd (LNot (LGreater (Arg0, 0x78)), And (Arg2, 0x02)))
                        {
                            Return (0x0B)
                        }

                        If (LAnd (LNot (LGreater (Arg0, 0xB4)), And (Arg2, 0x01)))
                        {
                            Return (0x09)
                        }
                    }

                    Return (0x04)
                }
            }

            Device (VGA0)
            {
                Name (_ADR, 0x00020000)
                Method (_DOD, 0, NotSerialized)
                {
                    If (LEqual (VGAS, 0x00))
                    {
                        Store (0x02, CRTS)
                        Store (0x01, LCDS)
                        Store (0x01, VGAS)
                    }

                    Return (Package (0x03)
                    {
                        0x00010100, 
                        0x00010400, 
                        0x0200
                    })
                }

                Device (CRT0)
                {
                    Method (_ADR, 0, NotSerialized)
                    {
                        Return (0x0100)
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Return (0x1F)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Divide (CRTS, 0x03, Local0, Local1)
                        Add (CRTS, 0x01, CRTS)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x01)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            Return (0x00)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            Return (0x01)
                        }
                    }
                }

                Device (LCD0)
                {
                    Method (_ADR, 0, NotSerialized)
                    {
                        Return (0x0400)
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Return (0x1F)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Divide (LCDS, 0x03, Local0, Local1)
                        Add (LCDS, 0x01, LCDS)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x01)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            Return (0x01)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            Return (0x00)
                        }
                    }

                    Method (_DDC, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Return (\_SB.PCI0.VGA0.DDC4)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Concatenate (\_SB.PCI0.VGA0.DDC4, \_SB.PCI0.VGA0.DDC0, Local0)
                            Return (Local0)
                        }

                        Return (0x00)
                    }
                }

                Device (GTV0)
                {
                    Method (_ADR, 0, NotSerialized)
                    {
                        Return (0x0200)
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Return (0x1F)
                    }

                    Method (_DDC, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Return (\_SB.PCI0.VGA0.DDC3)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Concatenate (\_SB.PCI0.VGA0.DDC3, \_SB.PCI0.VGA0.DDC0, Local0)
                            Return (Local0)
                        }

                        Return (0x00)
                    }
                }

                Name (DDC0, Buffer (0x80)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DDC3, Buffer (0x80)
                {
                    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                    0x41, 0xD0, 0xFE, 0x09, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x21, 0x08, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD3
                })
                Name (DDC4, Buffer (0x80)
                {
                    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                    0x36, 0x7F, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x02, 0x00, 0x01, 0x28, 0x1E, 0x00, 
                    0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x21, 0x08, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEC
                })
            }
        }

        Device (MBRS)
        {
            Name (_HID, EisaId ("PNP0C02"))
            Name (MSBF, ResourceTemplate ()
            {
                IO (Decode16, 0xF100, 0xF100, 0x01, 0x70)
                IO (Decode16, 0xF178, 0xF178, 0x01, 0x08)
                IO (Decode16, 0xF200, 0xF200, 0x01, 0x40)
                IO (Decode16, 0x0380, 0x0380, 0x01, 0x10)
                IO (Decode16, 0x04D0, 0x04D0, 0x01, 0x02)
                IO (Decode16, 0x0580, 0x0580, 0x01, 0x08)
                Memory24 (ReadWrite, 0x0000, 0x0000, 0x0001, 0x0A00)
                Memory24 (ReadWrite, 0x0E00, 0x0E00, 0x0001, 0x0200)
                Memory32 (ReadOnly, 0xFF800000, 0xFF800000, 0x00000001, 0x00800000)
                Memory32 (ReadOnly, 0x00100000, 0x00100000, 0x00000001, 0x00000000)
                Memory32 (ReadOnly, 0x00000000, 0x00000000, 0x00000001, 0x00000000)
                Memory32Fixed (ReadWrite, 0xFEBFFC00, 0x00000400)
            })
            Method (_CRS, 0, NotSerialized)
            {
                CreateDWordField (MSBF, 0x6C, MEM1)
                And (RCMS (SMIO), 0x01, Local1)
                If (LEqual (Local1, 0x00))
                {
                    Store (0x00F00000, MEM1)
                }
                Else
                {
                    Store (0x00E00000, MEM1)
                }

                CreateDWordField (MSBF, 0x74, MS00)
                CreateDWordField (MSBF, 0x78, MS01)
                CreateDWordField (MSBF, 0x80, MEM2)
                Store (RCMS (EXMH), Local1)
                Add (ShiftLeft (Local1, 0x08), RCMS (EXML), Local1)
                ShiftRight (Local1, 0x02, Local1)
                If (LGreater (Local1, 0x10))
                {
                    Subtract (Local1, 0x0F, Local1)
                    ShiftLeft (Local1, 0x14, Local1)
                    Store (Local1, MEM2)
                    Store (0x01000000, MS00)
                    Store (MS00, MS01)
                }

                Return (MSBF)
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (LEqual (\LIDS, 0x00))
                {
                    Store (0x00, \LIDF)
                    Return (0x00)
                }
                Else
                {
                    If (LEqual (\LIDF, 0x01))
                    {
                        Store (0x00, \LIDF)
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x01)
                    }
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x18, 
                0x04
            })
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
                Store (0x03, IOB3)
                Store (0x33, IOB2)
                If (LEqual (DAT5, 0x01))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)
            {
                Store (0x00, IOB3)
                Store (0x33, IOB2)
                If (LEqual (DAT1, 0x01))
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
                Store (0x04, IOB3)
                Store (0x33, IOB2)
                And (DAT7, 0x01, Local7)
                If (LEqual (Local7, 0x00))
                {
                    Store (0x0FA0, Local0)
                    Store (0x0FA0, Local1)
                }
                Else
                {
                    Store (0x1194, Local0)
                    Store (0x1194, Local1)
                }

                Name (BUF0, Package (0x0D) {})
                Store (0x01, Index (BUF0, 0x00))
                Store (Local0, Index (BUF0, 0x01))
                Store (Local0, Index (BUF0, 0x02))
                Store (0x01, Index (BUF0, 0x03))
                If (LEqual (Local7, 0x00))
                {
                    Store (0x39D0, Index (BUF0, 0x04))
                }
                Else
                {
                    Store (0x2580, Index (BUF0, 0x04))
                }

                Divide (Local0, 0x0A, Local1, Local2)
                Store (Local2, Index (BUF0, 0x05))
                Divide (Local0, 0x14, Local1, Local3)
                Store (Local3, Index (BUF0, 0x06))
                Subtract (Local2, Local3, Local4)
                Store (Local4, Index (BUF0, 0x07))
                Subtract (Local0, Local2, Local4)
                Store (Local4, Index (BUF0, 0x08))
                Name (MDL, Buffer (0x04)
                {
                    "ANA"
                })
                Store (MDL, Index (BUF0, 0x09))
                Name (SRLN, Buffer (0x04)
                {
                    "110"
                })
                Store (SRLN, Index (BUF0, 0x0A))
                If (LEqual (Local7, 0x00))
                {
                    Name (BTYP, Buffer (0x05)
                    {
                        "LION"
                    })
                    Store (BTYP, Index (BUF0, 0x0B))
                    Store (0x00, Index (BUF0, 0x0C))
                    Return (BUF0)
                }
                Else
                {
                    Name (BTY2, Buffer (0x05)
                    {
                        "NiMH"
                    })
                    Store (BTY2, Index (BUF0, 0x0B))
                    Store (0x00, Index (BUF0, 0x0C))
                    Return (BUF0)
                }
            }

            Method (_BST, 0, NotSerialized)
            {
                Name (BUF0, Package (0x04) {})
                Store (0x01, IOB3)
                Store (0x33, IOB2)
                Store (0x03, IOB3)
                Store (0x33, IOB2)
                Store (0x04, IOB3)
                Store (0x33, IOB2)
                And (DAT7, 0x01, Local7)
                If (LEqual (DAT5, 0x01))
                {
                    Store (0x00, IOB3)
                    Store (0x33, IOB2)
                    If (LEqual (DAT1, 0x01))
                    {
                        Store (0x02, IOB3)
                        Store (0x33, IOB2)
                        And (DAT3, 0x20, Local1)
                        If (LEqual (Local1, 0x20))
                        {
                            Store (0x01, Index (BUF0, 0x00))
                        }
                        Else
                        {
                            Store (0x02, Index (BUF0, 0x00))
                        }
                    }
                    Else
                    {
                        Store (0x00, Index (BUF0, 0x00))
                        Store (0xFFFFFFFF, Index (BUF0, 0x01))
                        Store (0xFFFFFFFF, Index (BUF0, 0x02))
                        Store (0xFFFFFFFF, Index (BUF0, 0x03))
                        Return (BUF0)
                    }
                }
                Else
                {
                    If (LNot (LGreater (DAT2, 0x05)))
                    {
                        Store (0x05, Index (BUF0, 0x00))
                    }
                    Else
                    {
                        Store (0x01, Index (BUF0, 0x00))
                    }
                }

                If (LEqual (Local7, 0x00))
                {
                    Multiply (DAT2, 0x28, Local2)
                    Store (0x03E8, Index (BUF0, 0x01))
                    Store (Local2, Index (BUF0, 0x02))
                    Store (0x03E8, Index (BUF0, 0x03))
                }
                Else
                {
                    Multiply (DAT2, 0x2D, Local2)
                    Store (0x05DC, Index (BUF0, 0x01))
                    Store (Local2, Index (BUF0, 0x02))
                    Store (0x05DC, Index (BUF0, 0x03))
                }

                Return (BUF0)
            }
        }
    }
}

