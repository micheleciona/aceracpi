/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080213
 *
 * Disassembly of 3100, Sat Mar 29 11:25:29 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00007FD6 (32726)
 *     Revision         0x01
 *     Checksum         0x57
 *     OEM ID           "Acer"
 *     OEM Table ID     "Navarro"
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x03000000 (50331648)
 */
DefinitionBlock ("3100.aml", "DSDT", 1, "Acer", "Navarro", 0x06040000)
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
    OperationRegion (MNVT, SystemMemory, 0x1BE9AF4B, 0x21)
    Field (MNVT, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SBTH,   8, 
        CMBP,   8, 
        FDCP,   8, 
        LPTP,   8, 
        BTEN,   8, 
        THRT,   8, 
        BRAD,   8, 
        BGTL,   8, 
        CADL,   16, 
        CSTE,   16, 
        BGU1,   8, 
        BST1,   8, 
        PTYP,   8, 
        PCMS,   8, 
        CPUS,   8, 
        UMAS,   8, 
        KBTP,   8
    }

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
    Method (_PTS, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x05))
        {
            Store (One, \_SB.PCI0.SMB.SLPS)
        }

        If (LEqual (Arg0, 0x04))
        {
            \_SB.PCI0.LPC0.PHSS (0x0E)
            Store (Zero, \_SB.PCI0.SMB.RSTU)
            Store (One, \_SB.PCI0.SMB.SLPS)
        }

        If (LEqual (Arg0, 0x03))
        {
            \_SB.PCI0.LPC0.EC0.CLCK (0x00)
            \_SB.PCI0.LPC0.PHSS (0x80)
            Store (Zero, \_SB.PCI0.SMB.RS3U)
            Store (One, \_SB.PCI0.SMB.SLPS)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        \_GPE._L19 ()
        Store (0x81, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        Store (0x30, DBGP)
        If (LEqual (Arg0, 0x03))
        {
            \_SB.PCI0.LPC0.PHSS (0x81)
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
            \_SB.PCI0.LPC0.PHSS (0x0F)
            Notify (\_SB.PWRB, 0x02)
        }

        If (LEqual (Arg0, 0x01))
        {
            And (PST1, 0x04, Local0)
            If (LEqual (Local0, 0x00))
            {
                Notify (\_SB.PWRB, 0x02)
            }
        }
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
        OperationRegion (OSTY, SystemMemory, 0x1BE9AEDB, 0x00000001)
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
        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (\_SB.PCI0.SMB.GM2C)
                {
                    Return (0x00)
                }

                Return (0x01)
            }

            Name (_PRW, Package (0x02)
            {
                0x15, 
                0x03
            })
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (WMID)
        {
            Name (_HID, "PNP0C14")
            Name (_UID, 0x00)
            Name (ERRD, 0x00010000)
            Name (BUFF, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateByteField (BUFF, 0x00, BF00)
            CreateByteField (BUFF, 0x01, BF01)
            CreateByteField (BUFF, 0x02, BF02)
            CreateByteField (BUFF, 0x03, BF03)
            Name (BUF1, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            Name (AADS, Buffer (0x04)
            {
                0x00
            })
            CreateField (AADS, 0x00, 0x04, AS00)
            CreateField (AADS, 0x04, 0x01, AS01)
            CreateField (AADS, 0x05, 0x01, AS02)
            CreateField (AADS, 0x10, 0x10, AS03)
            Name (BAEF, 0x00)
            Name (BADF, 0x00)
            Name (BADG, Package (0x03)
            {
                0x01, 
                0x01, 
                0x00
            })
            Name (BADS, Package (0x04)
            {
                0x00, 
                0x00, 
                0x00, 
                0x00
            })
            Name (WLDS, 0x00)
            Name (WLED, 0x00)
            Name (BTDS, 0x00)
            Name (BTED, 0x00)
            Name (BLDS, 0x00)
            Name (BLED, 0x00)
            Name (NTDC, 0x00)
            Name (WLSD, 0x0100)
            Name (WLSE, 0x0101)
            Name (BLTD, 0x0200)
            Name (BLTE, 0x0201)
            Name (LBL0, 0x0300)
            Name (LBL1, 0x0301)
            Name (LBL2, 0x0302)
            Name (LBL3, 0x0303)
            Name (LBL4, 0x0304)
            Name (LBL5, 0x0305)
            Name (LBL6, 0x0306)
            Name (LBL7, 0x0307)
            Name (LBL8, 0x0308)
            Name (LBL9, 0x0309)
            Name (LBLA, 0x030A)
            Name (LBLB, 0x030B)
            Name (LBLC, 0x030C)
            Name (LBLD, 0x030D)
            Name (LBLE, 0x030E)
            Name (LBLF, 0x030F)
            Name (VAPO, 0x0600)
            Name (VAPI, 0x0601)
            Name (CADI, 0x0401)
            Name (CADO, 0x0400)
            Name (GSEE, 0x0501)
            Name (GSED, 0x0502)
            Name (BBSB, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (BBSB, 0x00, 0x10, BBD0)
            CreateField (BBSB, 0x10, 0x10, BBD1)
            Name (TLS0, 0x00)
            Name (TLS1, 0x01)
            Name (TLS2, 0x02)
            Name (TLS3, 0x03)
            Name (TLS4, 0x04)
            Name (TLS5, 0x05)
            Name (TLS6, 0x06)
            Name (TLS7, 0x07)
            Name (BCDS, Package (0x0D)
            {
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000
            })
            Name (BDDS, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (BDDS, 0x00, 0x10, BDD0)
            CreateField (BDDS, 0x10, 0x10, BDD1)
            Name (DSY0, Buffer (0x28)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY1, Buffer (0x18)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY2, Buffer (0x10)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY3, Buffer (0x18)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY4, Buffer (0x10)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY5, Buffer (0x28)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            CreateField (DSY0, 0x00, 0x40, DY00)
            CreateField (DSY0, 0x40, 0x40, DY01)
            CreateField (DSY0, 0x80, 0x40, DY02)
            CreateField (DSY0, 0xC0, 0x40, DY03)
            CreateField (DSY0, 0x0100, 0x40, DY04)
            CreateField (DSY1, 0x00, 0x40, DY10)
            CreateField (DSY1, 0x40, 0x40, DY11)
            CreateField (DSY1, 0x80, 0x40, DY12)
            CreateField (DSY2, 0x00, 0x40, DY20)
            CreateField (DSY2, 0x40, 0x10, DY21)
            CreateField (DSY2, 0x50, 0x10, DY22)
            CreateField (DSY0, 0x00, 0xC0, DSX4)
            Name (BEDS, Package (0x12)
            {
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000
            })
            Name (WIT0, 0x00)
            Name (DSY6, Buffer (0x14)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00
            })
            CreateField (DSY6, 0x00, 0x20, DY60)
            CreateField (DSY6, 0x20, 0x20, DY61)
            CreateField (DSY6, 0x40, 0x20, DY62)
            CreateField (DSY6, 0x60, 0x20, DY63)
            CreateField (DSY6, 0x80, 0x20, DY64)
            Name (WPRW, Buffer (0x14)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00
            })
            CreateField (WPRW, 0x00, 0x08, WWD0)
            CreateField (WPRW, 0x08, 0x08, WWD1)
            CreateField (WPRW, 0x10, 0x08, WWD2)
            CreateField (WPRW, 0x18, 0x08, WWD3)
            CreateField (WPRW, 0x20, 0x08, WWD4)
            CreateField (WPRW, 0x28, 0x20, WWD5)
            Name (WPCI, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (WPCI, 0x00, 0x08, WPIR)
            CreateField (WPCI, 0x08, 0x03, WPIF)
            CreateField (WPCI, 0x0B, 0x05, WPID)
            CreateField (WPCI, 0x10, 0x08, WPIB)
            Name (BFDS, Package (0x04)
            {
                0x02, 
                0x02, 
                0x02, 
                0x02
            })
            Name (GSTS, 0x00)
            Name (BFEF, 0x00)
            Name (BGEF, 0x00)
            Name (BGDS, Package (0x01)
            {
                0x01
            })
            Method (AAF1, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPC0.EC0.WLEX, AS00)
                Store (\_SB.PCI0.LPC0.EC0.BTEX, AS01)
                Store (0x01, AS02)
                Store (0x00, AS03)
            }

            Method (Z009, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPC0.EC0.WLAT, Local0)
                Store (Local0, Index (BADG, 0x00))
                Store (\_SB.PCI0.LPC0.EC0.BTAT, Local0)
                Store (Local0, Index (BADG, 0x01))
                Store (\_SB.PCI0.LPC0.EC0.BRTS, Local0)
                Store (Local0, Index (BADG, 0x02))
            }

            Method (Z00A, 2, NotSerialized)
            {
                Store (Arg1, BUFF)
                Store (Arg0, Local0)
                Store (BF00, Local1)
                Store (Local0, Debug)
                Store (Local1, Debug)
                Store (0x00, Local2)
                If (LEqual (Local1, 0x00))
                {
                    If (LEqual (Local0, 0x04))
                    {
                        Store (0x00, \_SB.PCI0.LPC0.EC0.WLAT)
                    }
                    Else
                    {
                        If (LEqual (Local0, 0x05))
                        {
                            Store (0x00, \_SB.PCI0.LPC0.EC0.BTAT)
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x06))
                            {
                                Store (0x00, \_SB.PCI0.LPC0.EC0.BRTS)
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x07))
                                {
                                    Store (0x00, BAEF)
                                }
                                Else
                                {
                                    Store (0x01, Local2)
                                }
                            }
                        }
                    }
                }
                Else
                {
                    If (LEqual (Local0, 0x04))
                    {
                        Store (0x01, \_SB.PCI0.LPC0.EC0.WLAT)
                        Store (0x00, Index (BADS, 0x00))
                    }
                    Else
                    {
                        If (LEqual (Local0, 0x05))
                        {
                            Store (0x01, \_SB.PCI0.LPC0.EC0.BTAT)
                            Store (0x00, Index (BADS, 0x01))
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x06))
                            {
                                Store (Local1, \_SB.PCI0.LPC0.EC0.BRTS)
                                Store (0x00, Index (BADS, 0x02))
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x07))
                                {
                                    Store (0x01, BAEF)
                                    Store (0x00, Index (BADS, 0x03))
                                }
                                Else
                                {
                                    Store (0x01, Local2)
                                }
                            }
                        }
                    }
                }

                If (LEqual (Local2, 0x01))
                {
                    If (LEqual (Local0, 0x04))
                    {
                        Store (0x02, Index (BADS, 0x00))
                    }
                    Else
                    {
                        If (LEqual (Local0, 0x05))
                        {
                            Store (0x03, Index (BADS, 0x00))
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x06))
                            {
                                Store (0x04, Index (BADS, 0x00))
                            }
                        }
                    }
                }
            }

            Method (Z00B, 0, NotSerialized)
            {
                If (LEqual (BAEF, 0x01))
                {
                    Store (NTDC, Local0)
                    If (LNotEqual (Local0, 0x00))
                    {
                        Store (0x00, NTDC)
                        Return (Local0)
                    }
                }

                If (LEqual (BFEF, 0x01)) {}
                If (LEqual (BGEF, 0x01)) {}
            }

            Method (Z00C, 2, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (Arg1, BUFF)
                Store (0x00, BBSB)
                If (LEqual (Local0, 0x01))
                {
                    Store (SBTH, BBD0)
                }
                Else
                {
                    If (LEqual (Local0, 0x02))
                    {
                        Store (BF00, SBTH)
                    }
                    Else
                    {
                        Store (ERRD, BBSB)
                    }
                }
            }

            Method (Z00D, 2, NotSerialized)
            {
                Store (Arg1, BUFF)
                Store (ERRD, Index (BCDS, BF00))
            }

            Method (Z00E, 1, NotSerialized)
            {
                Store (DSY5, DSY0)
                Store (Arg0, Local0)
                Store (\_SB.PHWM (0x00, Arg0), Local2)
                Store (Local2, DSY6)
                Store (DY60, DY00)
                Store (DY61, DY01)
                Store (DY62, DY02)
                Store (DY63, DY03)
            }

            Method (Z00F, 1, NotSerialized)
            {
                Store (DSY3, DSY1)
                Store (Arg0, DY00)
                Store (\_SB.PHWM (0x01, Arg0), Local2)
                Store (Local2, DSY6)
                Store (DY60, DY10)
                Store (DY61, DY11)
                Store (0x00, WIT0)
                Store (WIT0, DY12)
            }

            Method (Z00G, 1, NotSerialized)
            {
                Store (DSY3, DSY1)
                Store (\_SB.PHWM (0x02, Arg0), Local2)
                Store (Local2, DSY6)
                Store (DY60, DY10)
                Store (DY61, DY11)
                Store (0x00, WIT0)
                Store (WIT0, DY12)
            }

            Method (Z00H, 2, NotSerialized)
            {
                Store (0x00010000, Index (BCDS, 0x09))
            }

            Method (Z00I, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPC0.EC0.THFN, Local0)
                Multiply (Local0, 0x64, Local1)
                Store (Local1, Index (BCDS, 0x0A))
            }

            Method (Z00J, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPC0.EC0.CTMP, Index (BCDS, 0x0B))
            }

            Method (Z00K, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (\_SB.PHWM (0x03, Arg0), Local2)
                Store (Local2, DY20)
                Store (Local2, DSY6)
                Store (DSY4, DSY2)
                Store (DY60, DY20)
            }

            Method (Z00L, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (Arg0, DY20)
                Store (\_SB.PHWM (0x04, Arg0), Local2)
                Store (Local2, DSY6)
                Store (DY61, BUFF)
            }

            Method (Z00M, 0, NotSerialized)
            {
                Store (\_SB.PHWM (0x05, 0x00), Local2)
                Store (Local2, BUFF)
                Store (BUFF, Index (BCDS, 0x0C))
            }

            Method (Z00N, 2, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (Arg1, BUFF)
                If (LEqual (Local0, 0x0D))
                {
                    Store (BF02, BF00)
                    Store (BF01, Local1)
                    Store (BF02, BF00)
                    Store (BF01, Local1)
                }

                If (LEqual (Local0, 0x0E))
                {
                    If (LEqual (BF00, 0x00))
                    {
                        Store (0xFF, BF00)
                    }
                    Else
                    {
                        Store (BF00, Local1)
                        Store (0x01, BF00)
                    }

                    If (LEqual (BF00, 0x00))
                    {
                        Store (0xFF, BF00)
                    }
                    Else
                    {
                        Store (BF00, Local1)
                        Store (0x01, BF00)
                    }
                }

                If (LEqual (BF00, 0x01))
                {
                    If (LEqual (\_SB.PCI0.LPC0.EC0.BDC0, 0x00))
                    {
                        Store (0x00020000, Local1)
                        Decrement (Local0)
                        Store (Local1, Index (BEDS, Local0))
                    }
                    Else
                    {
                        If (LLessEqual (Local0, 0x05))
                        {
                            If (LEqual (Local0, 0x01))
                            {
                                Store (0x00, Index (BEDS, 0x00))
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x02))
                                {
                                    Store (\_SB.PCI0.LPC0.EC0.BPTC, Index (BEDS, 0x01))
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x03))
                                    {
                                        Store (\_SB.PCI0.LPC0.EC0.BPV0, Index (BEDS, 0x02))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local0, 0x04))
                                        {
                                            Store (\_SB.PCI0.LPC0.EC0.BSCU, Index (BEDS, 0x03))
                                        }
                                        Else
                                        {
                                            If (LEqual (Local0, 0x05))
                                            {
                                                Store (\_SB.PCI0.LPC0.EC0.BRC0, Index (BEDS, 0x04))
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Else
                        {
                            If (LGreaterEqual (Local0, 0x0B))
                            {
                                If (LEqual (Local0, 0x0B))
                                {
                                    Store (\_SB.PCI0.LPC0.EC0.BSN0, Index (BEDS, 0x0A))
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x0C))
                                    {
                                        If (LEqual (\_SB.PCI0.LPC0.EC0.ACIS, 0x01))
                                        {
                                            Store (0x00, \_SB.PCI0.LPC0.EC0.PSRC)
                                            Store (0x01, Index (BEDS, 0x0B))
                                        }
                                        Else
                                        {
                                            Store (0x00020000, Index (BEDS, 0x0B))
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Local0, 0x0D))
                                        {
                                            Store (Local1, \_SB.PCI0.LPC0.EC0.BTMA)
                                            Store (0x01, \_SB.PCI0.LPC0.EC0.SCCF)
                                            Store (0x01, Index (BEDS, 0x0C))
                                        }
                                        Else
                                        {
                                            If (LEqual (Local0, 0x0E))
                                            {
                                                Store (Local1, \_SB.PCI0.LPC0.EC0.BTPV)
                                                Store (0x00, \_SB.PCI0.LPC0.EC0.SCHG)
                                                Store (0x01, \_SB.PCI0.LPC0.EC0.SCPF)
                                                Store (0x01, Index (BEDS, 0x0D))
                                            }
                                            Else
                                            {
                                                If (LEqual (Local0, 0x0F))
                                                {
                                                    Store (\_SB.PCI0.LPC0.EC0.BDFC, Index (BEDS, 0x0E))
                                                }
                                                Else
                                                {
                                                    If (LEqual (Local0, 0x10))
                                                    {
                                                        Store (\_SB.PCI0.LPC0.EC0.BDME, Index (BEDS, 0x0F))
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (Local0, 0x11))
                                                        {
                                                            If (UMAS)
                                                            {
                                                                Store (0x0258, Index (BEDS, 0x10))
                                                            }
                                                            Else
                                                            {
                                                                Store (0x0384, Index (BEDS, 0x10))
                                                            }
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (Local0, 0x12))
                                                            {
                                                                Store (0x00, Index (BEDS, 0x11))
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x06))
                                {
                                    Store (\_SB.PCI0.LPC0.EC0.BFC0, Index (BEDS, 0x05))
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x07))
                                    {
                                        Store (\_SB.PCI0.LPC0.EC0.BSCY, Index (BEDS, 0x06))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local0, 0x08))
                                        {
                                            Store (\_SB.PCI0.LPC0.EC0.BDC0, Index (BEDS, 0x07))
                                        }
                                        Else
                                        {
                                            If (LEqual (Local0, 0x09))
                                            {
                                                Store (\_SB.PCI0.LPC0.EC0.BDV0, Index (BEDS, 0x08))
                                            }
                                            Else
                                            {
                                                If (LEqual (Local0, 0x0A))
                                                {
                                                    Store (\_SB.PCI0.LPC0.EC0.BDAD, Index (BEDS, 0x09))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Else
                {
                    If (LLessEqual (Local0, 0x05))
                    {
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x00020000, Index (BEDS, 0x00))
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x02))
                            {
                                Store (0x00020000, Index (BEDS, 0x01))
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x03))
                                {
                                    Store (0x00020000, Index (BEDS, 0x02))
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x04))
                                    {
                                        Store (0x00020000, Index (BEDS, 0x03))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local0, 0x05))
                                        {
                                            Store (0x00020000, Index (BEDS, 0x04))
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Else
                    {
                        If (LGreaterEqual (Local0, 0x0B))
                        {
                            If (LEqual (Local0, 0x0B))
                            {
                                Store (0x00020000, Index (BEDS, 0x0A))
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x0C))
                                {
                                    If (LEqual (\_SB.PCI0.LPC0.EC0.BDC0, 0x00))
                                    {
                                        Store (0x00030000, Index (BEDS, 0x0B))
                                    }
                                    Else
                                    {
                                        Store (0x01, \_SB.PCI0.LPC0.EC0.PSRC)
                                        Store (0x01, Index (BEDS, 0x0B))
                                    }
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x0D))
                                    {
                                        Store (0x00020000, Index (BEDS, 0x0C))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local0, 0x0E))
                                        {
                                            Store (0x01, \_SB.PCI0.LPC0.EC0.SCHG)
                                            Store (0x01, \_SB.PCI0.LPC0.EC0.SCPF)
                                            Store (0x01, Index (BEDS, 0x0D))
                                        }
                                        Else
                                        {
                                            If (LEqual (Local0, 0x0F))
                                            {
                                                Store (0x00020000, Index (BEDS, 0x0E))
                                            }
                                            Else
                                            {
                                                If (LEqual (Local0, 0x10))
                                                {
                                                    Store (0x00020000, Index (BEDS, 0x0F))
                                                }
                                                Else
                                                {
                                                    If (LEqual (Local0, 0x11))
                                                    {
                                                        If (UMAS)
                                                        {
                                                            Store (0x0258, Index (BEDS, 0x10))
                                                        }
                                                        Else
                                                        {
                                                            Store (0x0384, Index (BEDS, 0x10))
                                                        }
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (Local0, 0x12))
                                                        {
                                                            Store (0x00, Index (BEDS, 0x11))
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x06))
                            {
                                Store (0x00020000, Index (BEDS, 0x05))
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x07))
                                {
                                    Store (0x00020000, Index (BEDS, 0x06))
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x08))
                                    {
                                        Store (0x00020000, Index (BEDS, 0x07))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local0, 0x09))
                                        {
                                            Store (0x00020000, Index (BEDS, 0x08))
                                        }
                                        Else
                                        {
                                            If (LEqual (Local0, 0x0A))
                                            {
                                                Store (0x00020000, Index (BEDS, 0x09))
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Method (Z00O, 0, NotSerialized)
            {
                Store (0x01, GSTS)
                Return (GSTS)
            }

            Method (Z00P, 1, NotSerialized)
            {
            }

            Method (Z00Q, 1, NotSerialized)
            {
            }

            Method (Z00R, 1, NotSerialized)
            {
            }

            Method (Z00S, 1, NotSerialized)
            {
            }

            Method (Z00T, 1, NotSerialized)
            {
            }

            Name (_WDG, Buffer (0xDC)
            {
                /* 0000 */    0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E, 
                /* 0008 */    0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A, 
                /* 0010 */    0x41, 0x41, 0x01, 0x01, 0x58, 0xF2, 0xF4, 0x6A, 
                /* 0018 */    0x01, 0xB4, 0xFD, 0x42, 0xBE, 0x91, 0x3D, 0x4A, 
                /* 0020 */    0xC2, 0xD7, 0xC0, 0xD3, 0x42, 0x41, 0x01, 0x02, 
                /* 0028 */    0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41, 
                /* 0030 */    0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5, 
                /* 0038 */    0x80, 0x00, 0x01, 0x08, 0x53, 0x44, 0x8C, 0xE7, 
                /* 0040 */    0x27, 0x02, 0x61, 0x48, 0x9E, 0xDE, 0xF5, 0x60, 
                /* 0048 */    0x0B, 0x4A, 0x3D, 0x39, 0x42, 0x42, 0x01, 0x02, 
                /* 0050 */    0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48, 
                /* 0058 */    0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B, 
                /* 0060 */    0x42, 0x43, 0x01, 0x02, 0x79, 0x4C, 0xF9, 0xCF, 
                /* 0068 */    0x77, 0x6C, 0xF7, 0x4A, 0xAC, 0x56, 0x7D, 0xD0, 
                /* 0070 */    0xCE, 0x01, 0xC9, 0x97, 0x42, 0x44, 0x01, 0x02, 
                /* 0078 */    0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B, 
                /* 0080 */    0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9, 
                /* 0088 */    0x42, 0x45, 0x01, 0x02, 0xB7, 0xA0, 0xC9, 0xA7, 
                /* 0090 */    0x9D, 0x4C, 0x72, 0x4C, 0x83, 0xBB, 0x53, 0xA3, 
                /* 0098 */    0x45, 0x91, 0x71, 0xDF, 0x42, 0x46, 0x01, 0x02, 
                /* 00A0 */    0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48, 
                /* 00A8 */    0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82, 
                /* 00B0 */    0x42, 0x47, 0x01, 0x02, 0xA7, 0xB1, 0x85, 0xDB, 
                /* 00B8 */    0x9A, 0x06, 0xBB, 0x4A, 0xA2, 0xB5, 0xD1, 0x86, 
                /* 00C0 */    0xA2, 0x1B, 0x80, 0xF1, 0x81, 0x00, 0x01, 0x08, 
                /* 00C8 */    0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45, 
                /* 00D0 */    0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D, 
                /* 00D8 */    0x82, 0x00, 0x01, 0x08
            })
            Method (WQAA, 1, NotSerialized)
            {
                AAF1 ()
                Store (AADS, BUFF)
                Return (BUFF)
            }

            Method (WMBA, 3, NotSerialized)
            {
                If (LLess (Arg1, 0x04))
                {
                    Z009 ()
                    Store (DerefOf (Index (BADG, Subtract (Arg1, 0x01))), BUFF)
                    Return (BUFF)
                }
                Else
                {
                    If (LEqual (Arg1, 0x07))
                    {
                        Store (Arg2, BUFF)
                        If (BF00)
                        {
                            Store (0x01, BAEF)
                        }
                    }

                    Z00A (Arg1, Arg2)
                    Store (DerefOf (Index (BADS, Subtract (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }
            }

            Method (_WED, 1, NotSerialized)
            {
                If (LGreaterEqual (Arg0, 0x80))
                {
                    If (LLess (Arg0, 0x83))
                    {
                        Return (Z00B ())
                    }
                }
            }

            Method (WMBB, 3, NotSerialized)
            {
                Z00C (Arg1, Arg2)
                If (LEqual (Arg1, 0x01))
                {
                    Store (BBSB, BUFF)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (BBD1, BUFF)
                }

                Return (BUFF)
            }

            Method (WMBC, 3, NotSerialized)
            {
                Z00D (Arg1, Arg2)
                If (LLess (Arg1, 0x0A))
                {
                    Subtract (Arg1, 0x01, Local0)
                    Store (DerefOf (Index (BCDS, Subtract (Arg1, 0x01))), BUFF)
                }
                Else
                {
                    ShiftRight (DerefOf (Index (BCDS, Subtract (Arg1, 0x0A))), 0x10, 
                        BUFF)
                }

                Return (BUFF)
            }

            Method (WMBD, 3, NotSerialized)
            {
                If (LEqual (Arg1, 0x01))
                {
                    Store (Arg2, BUFF)
                    Store (BUFF, Local0)
                    Store (Arg2, WIT0)
                    Z00E (WIT0)
                    Return (DSY0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (Arg2, Local0)
                    Z00F (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (Arg2, Local0)
                    Z00G (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x04))
                {
                    Z00H (Arg1, Arg2)
                    ShiftRight (DerefOf (Index (BCDS, Add (Arg1, 0x05))), 0x10, 
                        BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x05))
                {
                    Z00H (Arg1, Arg2)
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x06))
                {
                    Z00I ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x07))
                {
                    Z00J ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x08))
                {
                    Store (Arg2, WPRW)
                    Store (WWD1, WPIR)
                    Store (WWD2, WPIF)
                    Store (WWD3, WPID)
                    Store (WWD4, WPIB)
                    Concatenate (WPCI, WWD0, Local0)
                    Z00K (Local0)
                    Return (DSY2)
                }

                If (LEqual (Arg1, 0x09))
                {
                    Store (Arg2, DSY6)
                    Store (DY60, Local0)
                    Store (Arg2, DSY0)
                    Store (DY01, WPRW)
                    Store (WWD1, WPIR)
                    Store (WWD2, WPIF)
                    Store (WWD3, WPID)
                    Store (WWD4, WPIB)
                    Store (WPCI, Local1)
                    Concatenate (DY60, WPCI, Local0)
                    Concatenate (Local0, WWD0, Local1)
                    Z00L (Local1)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x0A))
                {
                    Z00M ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x02))), BUFF)
                    Return (BUFF)
                }
            }

            Method (WMBE, 3, NotSerialized)
            {
                Z00N (Arg1, Arg2)
                Store (BUFF, Debug)
                Store (BEDS, Debug)
                Store (DerefOf (Index (BEDS, Subtract (Arg1, 0x01))), BUFF)
                Store (BUFF, Debug)
                Return (BUFF)
            }

            Method (WMBF, 3, NotSerialized)
            {
                If (LGreater (Arg1, 0x04))
                {
                    Store (0x02, BF00)
                    Store (0x00, BF01)
                    Store (0x00, BF02)
                    Store (0x00, BF03)
                    Return (BUFF)
                }

                If (Z00O ())
                {
                    Store (Arg2, BUFF)
                    If (LEqual (Arg1, 0x01))
                    {
                        Z00P (BF00)
                    }
                    Else
                    {
                        If (LEqual (Arg1, 0x02))
                        {
                            Z00Q (BF00)
                        }
                        Else
                        {
                            If (LEqual (Arg1, 0x03))
                            {
                                Z00R (BF00)
                            }
                            Else
                            {
                                Z00S (BF00)
                            }
                        }
                    }

                    Store (DerefOf (Index (BFDS, Subtract (Arg1, 0x01))), BUFF)
                    Store (BUFF, Debug)
                }
                Else
                {
                    Store (0x03, BF00)
                    Store (0x00, BF01)
                    Store (0x00, BF02)
                    Store (0x00, BF03)
                }

                Return (BUFF)
            }

            Method (WMBG, 3, NotSerialized)
            {
                Store (Arg2, BUFF)
                Z00T (BF00)
                Store (DerefOf (Index (BGDS, Subtract (Arg1, 0x01))), BUFF)
                Store (BUFF, Debug)
                Return (BUFF)
            }
        }

        OperationRegion (SMI2, SystemMemory, 0x1BE9ADBB, 0x00000120)
        Field (SMI2, AnyAcc, NoLock, Preserve)
        {
            WCMD,   8, 
            WDID,   32, 
            TPID,   8, 
            DI00,   320
        }

        Field (SMI2, AnyAcc, NoLock, Preserve)
        {
                    Offset (0x06), 
            D000,   32, 
            D001,   32, 
            D002,   32, 
            D003,   32, 
            D004,   32
        }

        Method (PHWM, 2, NotSerialized)
        {
            Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
            Store (0xE0, WCMD)
            Store (0x57, TPID)
            Store (Arg0, WDID)
            Store (Arg1, DI00)
            Store (Zero, \_SB.PCI0.LPC0.SMIC)
            Store (DI00, Local0)
            Release (\_SB.PCI0.LPC0.PSMX)
            Return (Local0)
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
                \_GPE._L19 ()
            }

            OperationRegion (NBRV, PCI_Config, 0x08, 0x01)
            Field (NBRV, ByteAcc, NoLock, Preserve)
            {
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

            OperationRegion (NBMS, PCI_Config, 0x60, 0x08)
            Field (NBMS, DWordAcc, NoLock, Preserve)
            {
                MIDX,   32, 
                MIDR,   32
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
                Store (0x7F, MIDX)
                Release (NBMM)
            }

            OperationRegion (NBXP, PCI_Config, 0xE0, 0x08)
            Field (NBXP, DWordAcc, NoLock, Preserve)
            {
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

            OperationRegion (K8ST, SystemMemory, 0x1BE9AF74, 0x00000048)
            Field (K8ST, AnyAcc, NoLock, Preserve)
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
                    0xDFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xD300,             // Length
                    0x00,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0xE030,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x1FD0,             // Length
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
                    Return (Package (0x07)
                    {
                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x00, 
                            0x00, 
                            0x17
                        }, 

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
                    Return (Package (0x07)
                    {
                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKH, 
                            0x00
                        }, 

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
                Z00U,   32
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
                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                            Offset (0x1A), 
                    SLST,   16
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (XPEX, SystemMemory, 0xE0020100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x40), 
                    ECPH,   32, 
                            Offset (0x58), 
                    VC02,   32, 
                    VC0S,   32
                }

                Name (_SEG, 0x01)
                OperationRegion (PCBA, SystemMemory, 0x1BE9AF6C, 0x00000008)
                Field (PCBA, AnyAcc, NoLock, Preserve)
                {
                    CBAO,   8
                }

                Method (_CBA, 0, NotSerialized)
                {
                    Return (CBAO)
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
                    Store (0x1010, Local1)
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
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.SMB.GM4C)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
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
                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                            Offset (0x1A), 
                    SLST,   16
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (XPEX, SystemMemory, 0xE0028100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x40), 
                    ECPH,   32, 
                            Offset (0x58), 
                    VC02,   32, 
                    VC0S,   32
                }

                Name (_SEG, 0x01)
                OperationRegion (PCBA, SystemMemory, 0x1BE9AF6C, 0x00000008)
                Field (PCBA, AnyAcc, NoLock, Preserve)
                {
                    CBAO,   8
                }

                Method (_CBA, 0, NotSerialized)
                {
                    Return (CBAO)
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
                    Store (0x1010, Local1)
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
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.SMB.GM4C)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
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

            Device (PB7)
            {
                Name (_ADR, 0x00070000)
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

            Device (BB4)
            {
                Name (_ADR, 0x00040000)
                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                            Offset (0x1A), 
                    SLST,   16
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (XPEX, SystemMemory, 0xE0020100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
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
                    Store (0x1010, Local1)
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
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.SMB.GM4C)
                        {
                            Return (0xFF)
                        }
                        Else
                        {
                            Return (0x00)
                        }
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

            Device (BB5)
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

            Scope (\_GPE)
            {
                Method (_L18, 0, NotSerialized)
                {
                    Notify (\_SB.PCI0.PB3, 0x02)
                    Notify (\_SB.PCI0.PB6, 0x02)
                    Notify (\_SB.PCI0.PB7, 0x02)
                }

                Method (_L06, 0, NotSerialized)
                {
                    Notify (\_SB.PCI0.PB4, 0x02)
                    Notify (\_SB.PCI0.PB5, 0x02)
                }

                Method (BL18, 0, NotSerialized)
                {
                    Notify (\_SB.PCI0.PB3, 0x02)
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

            Device (EHCI)
            {
                Name (_ADR, 0x00130002)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (SAT0)
            {
                Name (_ADR, 0x00120000)
                OperationRegion (SAP1, PCI_Config, 0x00, 0x44)
                Field (SAP1, WordAcc, NoLock, Preserve)
                {
                            Offset (0x08), 
                    CLCD,   32, 
                            Offset (0x10), 
                    P1F0,   16, 
                            Offset (0x14), 
                    P3F4,   16, 
                            Offset (0x18), 
                    P170,   16, 
                            Offset (0x1C), 
                    P1F4,   16, 
                            Offset (0x40), 
                    CNFG,   8
                }

                Method (FBWK, 0, NotSerialized)
                {
                    And (CNFG, 0xF7, CNFG)
                    Sleep (0x0A)
                    And (CNFG, 0xEF, CNFG)
                }

                Device (PRID)
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
                        If (LEqual (TPOS, 0x40))
                        {
                            \_SB.PCI0.SMB.SAPW ()
                        }
                    }

                    Name (S12P, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        If (LEqual (TPOS, 0x40))
                        {
                            Store (0x28, Local0)
                            OperationRegion (SAI1, SystemIO, P3F4, 0x04)
                            Field (SAI1, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY0,   1
                            }

                            While (LAnd (LEqual (BSY0, 0x01), Local0))
                            {
                                Store (Local0, DBGP)
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

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local5)
                            Return (Local5)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0xA0, Local1)
                            OperationRegion (SAI1, SystemIO, P3F4, 0x04)
                            Field (SAI1, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY0,   1
                            }

                            While (LAnd (LEqual (BSY0, 0x01), Local1))
                            {
                                Store (Local1, DBGP)
                                Sleep (0xFA)
                                Decrement (Local1)
                                Decrement (Local1)
                                Decrement (Local1)
                                Decrement (Local1)
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
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local6)
                            Return (Local6)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x00)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
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
                        \_SB.PCI0.SMB.SAPW ()
                    }

                    Name (S12S, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        If (LEqual (TPOS, 0x40))
                        {
                            Store (0x28, Local2)
                            OperationRegion (SAI2, SystemIO, P1F4, 0x04)
                            Field (SAI2, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY1,   1
                            }

                            While (LAnd (LEqual (BSY1, 0x01), Local2))
                            {
                                Sleep (0xFA)
                                Store (Local2, DBGP)
                                Decrement (Local2)
                            }
                        }

                        Store (0x00, S12S)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, S12S)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        Return (S12S)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local7)
                            Return (Local7)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0xA0, Local3)
                            OperationRegion (SAI2, SystemIO, P1F4, 0x04)
                            Field (SAI2, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY1,   1
                            }

                            While (LAnd (LEqual (BSY1, 0x01), Local3))
                            {
                                Sleep (0xFA)
                                Store (Local3, DBGP)
                                Decrement (Local3)
                                Decrement (Local3)
                                Decrement (Local3)
                                Decrement (Local3)
                            }

                            Store (0x00, S12S)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, S12S)
                        }

                        Method (_PSC, 0, NotSerialized)
                        {
                            Return (S12S)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local7)
                            Return (Local7)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x00)
                        }
                    }
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x00110000)
                OperationRegion (SAP1, PCI_Config, 0x00, 0x44)
                Field (SAP1, WordAcc, NoLock, Preserve)
                {
                            Offset (0x08), 
                    CLCD,   32, 
                            Offset (0x10), 
                    P1F0,   16, 
                            Offset (0x14), 
                    P3F4,   16, 
                            Offset (0x18), 
                    P170,   16, 
                            Offset (0x1C), 
                    P1F4,   16, 
                            Offset (0x40), 
                    CNFG,   8
                }

                Method (FBWK, 0, NotSerialized)
                {
                    And (CNFG, 0xF7, CNFG)
                    Sleep (0x0A)
                    And (CNFG, 0xEF, CNFG)
                }

                Device (PRID)
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
                        \_SB.PCI0.SMB.SAPW ()
                    }

                    Name (S12P, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        If (LEqual (TPOS, 0x40))
                        {
                            Store (0x28, Local0)
                            OperationRegion (SAI1, SystemIO, P3F4, 0x04)
                            Field (SAI1, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY0,   1
                            }

                            While (LAnd (LEqual (BSY0, 0x01), Local0))
                            {
                                Store (Local0, DBGP)
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

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local5)
                            Return (Local5)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0xA0, Local1)
                            OperationRegion (SAI1, SystemIO, P3F4, 0x04)
                            Field (SAI1, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY0,   1
                            }

                            While (LAnd (LEqual (BSY0, 0x01), Local1))
                            {
                                Store (Local1, DBGP)
                                Sleep (0xFA)
                                Decrement (Local1)
                                Decrement (Local1)
                                Decrement (Local1)
                                Decrement (Local1)
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
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local6)
                            Return (Local6)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x00)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
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
                        \_SB.PCI0.SMB.SAPW ()
                    }

                    Name (S12S, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        If (LEqual (TPOS, 0x40))
                        {
                            Store (0x28, Local2)
                            OperationRegion (SAI2, SystemIO, P1F4, 0x04)
                            Field (SAI2, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY1,   1
                            }

                            While (LAnd (LEqual (BSY1, 0x01), Local2))
                            {
                                Sleep (0xFA)
                                Store (Local2, DBGP)
                                Decrement (Local2)
                            }
                        }

                        Store (0x00, S12S)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, S12S)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        Return (S12S)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local7)
                            Return (Local7)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0xA0, Local3)
                            OperationRegion (SAI2, SystemIO, P1F4, 0x04)
                            Field (SAI2, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY1,   1
                            }

                            While (LAnd (LEqual (BSY1, 0x01), Local3))
                            {
                                Sleep (0xFA)
                                Store (Local3, DBGP)
                                Decrement (Local3)
                                Decrement (Local3)
                                Decrement (Local3)
                                Decrement (Local3)
                            }

                            Store (0x00, S12S)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, S12S)
                        }

                        Method (_PSC, 0, NotSerialized)
                        {
                            Return (S12S)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local7)
                            Return (Local7)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x00)
                        }
                    }
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x00140000)
                OperationRegion (Z00V, PCI_Config, 0x08, 0x0100)
                Field (Z00V, ByteAcc, NoLock, Preserve)
                {
                    RVID,   8, 
                            Offset (0xA5), 
                    Z00W,   8, 
                            Offset (0xF0), 
                    EIDX,   8, 
                            Offset (0xF4), 
                    EDAT,   32
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
                            Offset (0x65), 
                        ,   4, 
                    RS3U,   1, 
                    RSTU,   1, 
                            Offset (0x68), 
                        ,   3, 
                    TPDE,   1, 
                        ,   1, 
                            Offset (0x92), 
                        ,   6, 
                    GE6S,   1, 
                    GE7S,   1
                }

                OperationRegion (GPIO, PCI_Config, 0x00, 0x0100)
                Field (GPIO, AnyAcc, NoLock, Preserve)
                {
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

                Mutex (SAPM, 0x00)
                Method (SAPW, 0, NotSerialized)
                {
                    Acquire (SAPM, 0xFFFF)
                    Store (Z00W, Local0)
                    And (Local0, 0x01, Local1)
                    If (Local1)
                    {
                        \_SB.PCI0.SAT0.FBWK ()
                        Or (Z00W, 0x20, Z00W)
                    }

                    And (Local0, 0x10, Local1)
                    If (Local1)
                    {
                        \_SB.PCI0.SAT1.FBWK ()
                        Or (Z00W, 0x40, Z00W)
                    }

                    Release (SAPM)
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
                        Store (0x56, DBGP)
                        Sleep (0x02EE)
                        If (And (UDCX, 0x02))
                        {
                            Or (FLAG, 0x04, FLAG)
                            Store (DerefOf (Index (^UDMT, ShiftRight (UDMX, 0x04))), DMA1)
                        }

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

            Device (HDA)
            {
                Name (_ADR, 0x00140002)
                Name (_PRW, Package (0x02)
                {
                    0x1B, 
                    0x03
                })
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)
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
                            Offset (0x06), 
                    PIRU,   8, 
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
                    Store (0x09, PIRS)
                    Store (0x00, PIRU)
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

                Device (LNKU)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRU)
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
                        Return (UPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (UPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRU, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRU)
                        Store (0x89, \_SB.PCI0.LPC0.BCMD)
                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                    }
                }

                OperationRegion (LCLM, SystemIO, 0x0C50, 0x03)
                Field (LCLM, ByteAcc, NoLock, Preserve)
                {
                    CLMI,   8, 
                    CLMD,   8, 
                    CLGP,   8
                }

                IndexField (CLMI, CLMD, ByteAcc, NoLock, Preserve)
                {
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

                OperationRegion (LPCR, PCI_Config, 0x00, 0x7F)
                Field (LPCR, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x44), 
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
                    CMB7,   1, 
                            Offset (0x48), 
                        ,   2, 
                    ENIO,   1, 
                            Offset (0x64), 
                    IOBS,   16
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

                Device (KBC0)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (KBTP, 0x4A))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

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
                    Name (_PRW, Package (0x02)
                    {
                        0x04, 
                        0x03
                    })
                    Method (_PSW, 1, NotSerialized)
                    {
                        Acquire (PSMX, 0xFFFF)
                        If (ECOK ())
                        {
                            Store (Arg0, \_SB.PCI0.LPC0.EC0.INKB)
                        }

                        Release (PSMX)
                    }
                }

                Device (KBCJ)
                {
                    Name (_HID, EisaId ("PNP0320"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (KBTP, 0x4A))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

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
                    Name (_PRW, Package (0x02)
                    {
                        0x04, 
                        0x03
                    })
                    Method (_PSW, 1, NotSerialized)
                    {
                        Acquire (PSMX, 0xFFFF)
                        If (ECOK ())
                        {
                            Store (Arg0, \_SB.PCI0.LPC0.EC0.INKB)
                        }

                        Release (PSMX)
                    }
                }

                Device (MSE0)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreater (PTYP, 0x01))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                    Method (_PSW, 1, NotSerialized)
                    {
                        Acquire (PSMX, 0xFFFF)
                        If (ECOK ())
                        {
                            Store (Arg0, \_SB.PCI0.LPC0.EC0.TPAD)
                        }

                        Release (PSMX)
                    }
                }

                Device (MSS0)
                {
                    Name (_HID, EisaId ("SYN0701"))
                    Name (_CID, Package (0x03)
                    {
                        0x00072E4F, 
                        0x02002E4F, 
                        0x130FD041
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreater (PTYP, 0x01))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                    Method (_PSW, 1, NotSerialized)
                    {
                        Acquire (PSMX, 0xFFFF)
                        If (ECOK ())
                        {
                            Store (Arg0, \_SB.PCI0.LPC0.EC0.TPAD)
                        }

                        Release (PSMX)
                    }
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
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
                        IO (Decode16,
                            0x0F40,             // Range Minimum
                            0x0F40,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0280,             // Range Minimum
                            0x0280,             // Range Maximum
                            0x01,               // Alignment
                            0x14,               // Length
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
                            _Y1B)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LGreaterEqual (TPOS, 0x04))
                        {
                            CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1B._BAS, BARX)
                            CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1B._LEN, GALN)
                            Store (0x1000, GALN)
                            Store (\_SB.PCI0.Z00U, Local0)
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

                OperationRegion (SMI1, SystemMemory, 0x1BE9ADBB, 0x00000120)
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
                    INF1,   32
                }

                Method (PHSS, 1, NotSerialized)
                {
                    Acquire (PSMX, 0xFFFF)
                    Store (0xA0, BCMD)
                    Store (Arg0, DID)
                    Store (Zero, SMIC)
                    Release (PSMX)
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Mutex (S1K, 0x00)
                    OperationRegion (SMSC, SystemIO, 0x4E, 0x02)
                    Field (SMSC, ByteAcc, Lock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, AnyAcc, NoLock, Preserve)
                    {
                                AccessAs (ByteAcc, 0x00), 
                                Offset (0x01), 
                            ,   2, 
                        LPD,    1, 
                        LMD,    1, 
                                Offset (0x02), 
                            ,   7, 
                        U2PD,   1, 
                                Offset (0x04), 
                        LEMD,   2, 
                                Offset (0x05), 
                                Offset (0x0A), 
                            ,   6, 
                        IROM,   2, 
                                Offset (0x0C), 
                            ,   3, 
                        U2MD,   3, 
                                Offset (0x0D), 
                        CR0D,   8, 
                                Offset (0x23), 
                        CR23,   8, 
                                Offset (0x25), 
                        CR25,   8, 
                        LDMA,   8, 
                        LIRQ,   8, 
                        CR28,   8, 
                                Offset (0x2B), 
                        CR2B,   8, 
                        CR2C,   8
                    }

                    Method (ENFG, 0, NotSerialized)
                    {
                        Store (0x55, INDX)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Store (0xAA, INDX)
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("SMCF020"))
                        Name (_CID, 0x1005D041)
                        Method (_STA, 0, NotSerialized)
                        {
                            Acquire (S1K, 0xFFFF)
                            ENFG ()
                            If (Or (LEqual (U2MD, 0x07), LEqual (CR2B, 0x00)))
                            {
                                Store (0x00, Local1)
                            }
                            Else
                            {
                                If (LNotEqual (U2PD, 0x00))
                                {
                                    Store (0x0F, Local1)
                                }
                                Else
                                {
                                    Store (0x0D, Local1)
                                }
                            }

                            EXFG ()
                            Release (S1K)
                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            Acquire (S1K, 0xFFFF)
                            ENFG ()
                            Store (0x00, U2PD)
                            Store (0x00, CR25)
                            Store (CR28, Local0)
                            And (Local0, 0xF0, Local0)
                            Store (Local0, CR28)
                            EXFG ()
                            Release (S1K)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y1C)
                                IO (Decode16,
                                    0x0228,             // Range Minimum
                                    0x0228,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y1D)
                                IRQNoFlags (_Y1E)
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, _Y1F)
                                    {3}
                            })
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._CRS._Y1C._MIN, IOLO)
                            CreateByteField (BUF0, 0x03, IOHI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._CRS._Y1C._MAX, IORL)
                            CreateByteField (BUF0, 0x05, IORH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._CRS._Y1D._MIN, I2LO)
                            CreateByteField (BUF0, 0x0B, I2HI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._CRS._Y1D._MAX, I2RL)
                            CreateByteField (BUF0, 0x0D, I2RH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._CRS._Y1E._INT, IRQV)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._CRS._Y1F._DMA, DMAC)
                            Acquire (S1K, 0xFFFF)
                            ENFG ()
                            If (LEqual (U2MD, 0x01))
                            {
                                If (LNotEqual (CR2B, 0x00))
                                {
                                    Store (CR25, Local0)
                                    Store (Local0, Local1)
                                    And (Local1, 0xC0, Local1)
                                    ShiftRight (Local1, 0x06, Local1)
                                    ShiftLeft (Local0, 0x02, Local0)
                                    And (Local0, 0xFF, Local0)
                                    Store (Local0, IOLO)
                                    Store (Local1, IOHI)
                                    Store (IOLO, IORL)
                                    Store (IOHI, IORH)
                                    Store (IOHI, Local0)
                                    Store (IOLO, Local1)
                                    If (LEqual (Local0, 0x02))
                                    {
                                        If (LEqual (Local1, 0xF8))
                                        {
                                            Subtract (Local1, 0xD0, Local1)
                                            Store (Local1, I2LO)
                                            Store (Local1, I2RL)
                                        }

                                        If (LEqual (Local1, 0xE8))
                                        {
                                            Subtract (Local1, 0xC0, Local1)
                                            Store (Local1, I2LO)
                                            Store (Local1, I2RL)
                                        }
                                    }

                                    If (LEqual (Local0, 0x03))
                                    {
                                        If (LEqual (Local1, 0xF8))
                                        {
                                            Subtract (Local1, 0xC0, Local1)
                                            Store (Local1, I2LO)
                                            Store (Local1, I2RL)
                                        }

                                        If (LEqual (Local1, 0xE8))
                                        {
                                            Subtract (Local0, 0x01, Local0)
                                            Store (Local0, I2HI)
                                            Store (Local0, I2RH)
                                            Subtract (Local1, 0xB0, Local1)
                                            Store (Local1, I2LO)
                                            Store (Local1, I2RL)
                                        }
                                    }

                                    Store (0x01, Local0)
                                    And (CR28, 0x0F, Local1)
                                    ShiftLeft (Local0, Local1, IRQV)
                                    And (CR2C, 0x0F, Local0)
                                    Store (0x01, Local1)
                                    ShiftLeft (Local1, Local0, DMAC)
                                }
                            }

                            EXFG ()
                            Release (S1K)
                            Return (BUF0)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0228,             // Range Minimum
                                    0x0228,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0338,             // Range Minimum
                                    0x0338,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0220,             // Range Minimum
                                    0x0220,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0238,             // Range Minimum
                                    0x0238,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            EndDependentFn ()
                        })
                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateByteField (Arg0, 0x0A, I2LO)
                            CreateByteField (Arg0, 0x0B, I2HI)
                            CreateByteField (Arg0, 0x11, IRQV)
                            CreateByteField (Arg0, 0x14, DMAC)
                            Acquire (S1K, 0xFFFF)
                            ENFG ()
                            Store (IOLO, Local0)
                            ShiftRight (Local0, 0x02, Local0)
                            And (Local0, 0xFE, Local0)
                            Store (IOHI, Local1)
                            ShiftLeft (Local1, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            Store (Local0, CR25)
                            Store (I2LO, Local0)
                            ShiftRight (Local0, 0x03, Local0)
                            Store (I2HI, Local1)
                            ShiftLeft (Local1, 0x05, Local1)
                            Or (Local0, Local1, Local0)
                            Store (Local0, CR2B)
                            FindSetRightBit (IRQV, Local0)
                            Subtract (Local0, 0x01, Local0)
                            And (CR28, 0xF0, Local1)
                            Or (Local0, Local1, CR28)
                            FindSetRightBit (DMAC, Local0)
                            Subtract (Local0, 0x01, Local0)
                            And (CR2C, 0xF0, Local1)
                            Or (Local0, Local1, CR2C)
                            Store (0x01, U2PD)
                            Store (0x01, U2MD)
                            Store (0x01, IROM)
                            EXFG ()
                            Release (S1K)
                        }
                    }
                }

                Method (ECOK, 0, NotSerialized)
                {
                    Store (0xE02C, \_SB.PCI0.LPC0.IOBS)
                    Store (0x01, \_SB.PCI0.LPC0.ENIO)
                    If (LEqual (\_SB.PCI0.LPC0.EC0.Z00X, 0x01))
                    {
                        If (LEqual (OSYS, 0x40))
                        {
                            Store (0x01, \_SB.PCI0.LPC0.EC0.OSIF)
                        }
                        Else
                        {
                            Store (0x00, \_SB.PCI0.LPC0.EC0.OSIF)
                        }

                        Return (0x01)
                    }
                    Else
                    {
                        Return (0x00)
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x10)
                    Name (Z00X, Zero)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Z00X)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x02), 
                        MCER,   8, 
                                Offset (0x20), 
                            ,   4, 
                        BMF1,   3, 
                        BTY1,   1, 
                        BST1,   8, 
                        BRC1,   16, 
                        BSTM,   16, 
                        BPV1,   16, 
                        BDV1,   16, 
                        BDC1,   16, 
                        BSME,   16, 
                        GAU1,   8, 
                                Offset (0x60), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   256, 
                        BCNT,   8, 
                        SMAA,   8, 
                                Offset (0x90), 
                        REC1,   8, 
                        REC2,   8, 
                        WEC1,   8, 
                        WEC2,   8, 
                        CHGC,   16, 
                        CHGV,   8, 
                        SHKM,   8, 
                        CHGA,   16, 
                        BAL0,   1, 
                        BAL1,   1, 
                        BAL2,   1, 
                        BAL3,   1, 
                                Offset (0x9C), 
                        BEEP,   1, 
                        FAN1,   1, 
                        FAN2,   1, 
                        CRT,    1, 
                        EXFD,   1, 
                        PHDD,   1, 
                        SHDD,   1, 
                        FDD,    1, 
                        SBTN,   1, 
                        VIDO,   1, 
                        VOLD,   1, 
                        VOLU,   1, 
                        MUTE,   1, 
                        CONT,   1, 
                        BRGT,   1, 
                        HBTN,   1, 
                        S4S,    1, 
                        SKEY,   1, 
                        BKEY,   1, 
                            ,   1, 
                        LIDA,   1, 
                        LIDF,   1, 
                        DIGM,   1, 
                        UWAK,   1, 
                            ,   1, 
                        SCHG,   1, 
                        SCCF,   1, 
                        SCPF,   1, 
                        ACIS,   1, 
                            ,   1, 
                        SKU0,   1, 
                                Offset (0xA3), 
                        S1LD,   1, 
                        S3LD,   1, 
                        VGAQ,   1, 
                        PCMQ,   1, 
                        PCMR,   1, 
                        ADPT,   1, 
                        SYS6,   1, 
                        SYS7,   1, 
                        PWAK,   1, 
                        MWAK,   1, 
                        LWAK,   1, 
                            ,   3, 
                        INKB,   1, 
                        TPAD,   1, 
                            ,   3, 
                        PSRC,   1, 
                                Offset (0xA6), 
                        TST1,   8, 
                        THFN,   8, 
                                Offset (0xA9), 
                        THEM,   8, 
                        TST5,   8, 
                        TST6,   8, 
                        TST7,   8, 
                                Offset (0xB0), 
                        CTMP,   8, 
                                Offset (0xB2), 
                        SKTA,   8, 
                        BTMA,   8, 
                        BTPV,   8, 
                                Offset (0xB8), 
                        BTDT,   1, 
                        BTPW,   1, 
                        BTDS,   1, 
                        BTPS,   1, 
                        BTSW,   1, 
                            ,   2, 
                        OSIF,   1, 
                        BRTS,   8, 
                                Offset (0xBB), 
                        WLAT,   1, 
                        BTAT,   1, 
                        WLEX,   1, 
                        BTEX,   1, 
                        KLSW,   1, 
                                Offset (0xBD), 
                        CPUN,   8, 
                        THON,   8, 
                        THSD,   8, 
                            ,   4, 
                        BMF0,   3, 
                        BTY0,   1, 
                        BST0,   8, 
                        BRC0,   16, 
                        BSN0,   16, 
                        BPV0,   16, 
                        BDV0,   16, 
                        BDC0,   16, 
                        BFC0,   16, 
                        GAU0,   8, 
                        BSCY,   8, 
                        BSCU,   16, 
                        BAC0,   16, 
                        BPTC,   8, 
                        BTW0,   16, 
                        BDN0,   8, 
                                Offset (0xDA), 
                        BDFC,   16, 
                        BDAD,   16, 
                        BDME,   8, 
                                Offset (0xE3), 
                        BSC1,   16, 
                        BSC2,   16, 
                        BSC3,   16, 
                        BSC4,   16
                    }

                    Method (PCLK, 0, NotSerialized)
                    {
                        Store (PTVL, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Store (0x00, THEN)
                        }
                        Else
                        {
                            Not (Local0, Local0)
                            Add (Local0, 0x01, Local0)
                            And (Local0, 0x07, Local0)
                            Store (Local0, DUTY)
                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x00, THEN)
                            }
                            Else
                            {
                                Store (0x01, THEN)
                            }
                        }
                    }

                    Method (_Q1D, 0, NotSerialized)
                    {
                        \_SB.PCI0.LPC0.EC0.PCLK ()
                    }

                    Method (_Q22, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x81)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q27, 0, NotSerialized)
                    {
                        Notify (\_TZ.THRM, 0x80)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (\_SB.PCI0.LPC0.EC0.BTAT, Local1)
                            Store (\_SB.WMID.BLTD, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, \_SB.WMID.NTDC)
                            Notify (\_SB.WMID, 0x80)
                        }
                    }

                    Method (_Q37, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC0.ACAD, 0x80)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q38, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC0.ACAD, 0x80)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q60, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (\_SB.PCI0.LPC0.EC0.WLAT, Local1)
                            Store (\_SB.WMID.WLSD, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, \_SB.WMID.NTDC)
                            Notify (\_SB.WMID, 0x80)
                        }
                    }

                    Method (_Q43, 0, NotSerialized)
                    {
                    }

                    OperationRegion (CCLK, SystemIO, 0x8010, 0x04)
                    Field (CCLK, DWordAcc, NoLock, Preserve)
                    {
                            ,   1, 
                        DUTY,   3, 
                        THEN,   1, 
                                Offset (0x01), 
                            ,   9, 
                        TSTS,   1
                    }

                    OperationRegion (ECRM, EmbeddedControl, 0x00, 0xFF)
                    Field (ECRM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x94), 
                        ERIB,   16, 
                        ERBD,   8, 
                                Offset (0xAC), 
                        SDTM,   8, 
                        FSSN,   4, 
                        FANU,   4, 
                        PTVL,   3, 
                            ,   4, 
                        TTHR,   1, 
                                Offset (0xBC), 
                        PJID,   8, 
                                Offset (0xBE), 
                                Offset (0xF9), 
                        RFRD,   8, 
                                Offset (0xFB)
                    }

                    Mutex (FAMX, 0x00)
                    Method (FANG, 1, NotSerialized)
                    {
                        Acquire (FAMX, 0xFFFF)
                        Store (Arg0, ERIB)
                        Store (ERBD, Local0)
                        Release (FAMX)
                        Return (Local0)
                    }

                    Method (FANW, 2, NotSerialized)
                    {
                        Acquire (FAMX, 0xFFFF)
                        Store (Arg0, ERIB)
                        Store (Arg1, ERBD)
                        Release (FAMX)
                        Return (Arg1)
                    }

                    Method (TUVR, 1, NotSerialized)
                    {
                        Return (0x03)
                    }

                    Method (THRO, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Return (THEN)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (DUTY)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x02))
                                {
                                    Return (TTHR)
                                }
                                Else
                                {
                                    Return (0xFF)
                                }
                            }
                        }
                    }

                    Method (CLCK, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Store (0x00, THEN)
                        }
                        Else
                        {
                            Store (Arg0, DUTY)
                            Store (0x01, THEN)
                        }

                        Return (THEN)
                    }
                }

                Device (BAT1)
                {
                    Name (_HID, EisaId ("PNP0C0A"))
                    Name (_UID, 0x01)
                    Name (_PCL, Package (0x01)
                    {
                        \_SB
                    })
                    Name (PBIF, Package (0x0D)
                    {
                        0x01, 
                        0x19C8, 
                        0x19C8, 
                        0x01, 
                        0x39D0, 
                        0x0294, 
                        0xC6, 
                        0x0108, 
                        0x0EC4, 
                        "Primary ", 
                        "", 
                        "Lion", 
                        "ACER"
                    })
                    Name (PBST, Package (0x04)
                    {
                        0x01, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0x39D0
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            If (\_SB.PCI0.LPC0.EC0.BAL0)
                            {
                                Sleep (0x14)
                                Return (0x1F)
                            }
                            Else
                            {
                                Sleep (0x14)
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            Sleep (0x14)
                            Return (0x1F)
                        }
                    }

                    Method (_BIF, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BDC0, Index (PBIF, 0x01))
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BFC0, Index (PBIF, 0x02))
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BDV0, Index (PBIF, 0x04))
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BDC0, Local2)
                            Divide (Local2, 0x64, Local6, Local2)
                            Multiply (Local2, 0x05, Local3)
                            Store (Local3, Index (PBIF, 0x05))
                            Multiply (Local2, 0x03, Local4)
                            Store (Local4, Index (PBIF, 0x06))
                        }

                        Return (PBIF)
                    }

                    Method (_BST, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BST0, Local0)
                            And (Local0, 0x07, Local0)
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.GAU0, Local2)
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BPV0, Local3)
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BFC0, Local1)
                            If (Local2)
                            {
                                Multiply (Local2, Local1, Local2)
                                Divide (Local2, 0x64, Local6, Local2)
                                If (Local6)
                                {
                                    Increment (Local2)
                                }
                            }

                            Store (\_SB.PCI0.LPC0.EC0.BAC0, Local1)
                            If (And (Local1, 0x8000, Local1))
                            {
                                Store (\_SB.PCI0.LPC0.EC0.BAC0, Local1)
                                Subtract (0xFFFF, Local1, Local1)
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            Store (Local0, Index (PBST, 0x00))
                            Store (Local1, Index (PBST, 0x01))
                            Store (Local2, Index (PBST, 0x02))
                            Store (Local3, Index (PBST, 0x03))
                        }

                        Return (PBST)
                    }
                }

                Device (ACAD)
                {
                    Name (_HID, "ACPI0003")
                    Name (_PCL, Package (0x01)
                    {
                        \_SB
                    })
                    Method (_PSR, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            Return (\_SB.PCI0.LPC0.EC0.ADPT)
                        }

                        Return (0x01)
                    }
                }
            }

            Device (P2P)
            {
                Name (_ADR, 0x00140004)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x05)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x00, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x00, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                0x00, 
                                0x17
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x05)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKH, 
                                0x00
                            }
                        })
                    }
                }

                Device (V394)
                {
                    Name (_ADR, 0x00)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (ELAN)
                {
                    Name (_ADR, 0x00010000)
                    Name (_PRW, Package (0x02)
                    {
                        0x04, 
                        0x04
                    })
                    Name (LANP, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Sleep (0x05DC)
                        Store (0x00, LANP)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, LANP)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        Return (LANP)
                    }
                }

                Device (MIN1)
                {
                    Name (_ADR, 0x00020000)
                    OperationRegion (MIDS, PCI_Config, 0x00, 0xC8)
                    Field (MIDS, DWordAcc, NoLock, Preserve)
                    {
                        MOID,   32, 
                                Offset (0xC4), 
                                Offset (0xC5), 
                        MPME,   1, 
                            ,   6, 
                        MPMS,   1
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (MOID, 0xFFFFFFFF))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (CB1)
                {
                    Name (_ADR, 0x00040000)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Method (_S1D, 0, NotSerialized)
                    {
                        Return (0x01)
                    }

                    Method (_S3D, 0, NotSerialized)
                    {
                        Return (0x03)
                    }

                    Method (_S4D, 0, NotSerialized)
                    {
                        Return (0x03)
                    }
                }
            }

            Device (AUDO)
            {
                Name (_ADR, 0x00140005)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x04
                })
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
                    Name (CRTA, 0x01)
                    Name (LCDA, 0x01)
                    Name (TVAA, 0x01)
                    Name (VLDF, 0x01)
                    OperationRegion (VIDS, PCI_Config, 0x00, 0xC8)
                    Field (VIDS, DWordAcc, NoLock, Preserve)
                    {
                        VDID,   32
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    Method (_PS1, 0, NotSerialized)
                    {
                        Store (0x01, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (And (Arg0, 0x03), SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200
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
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x02, Local0)
                            And (Local1, 0x02, Local1)
                            If (Local0)
                            {
                                Store (0x01, CRTA)
                            }
                            Else
                            {
                                Store (0x00, CRTA)
                            }

                            If (CRTA)
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
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
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0110)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x01, Local0)
                            And (Local1, 0x01, Local1)
                            If (Local0)
                            {
                                Store (0x01, LCDA)
                            }
                            Else
                            {
                                Store (0x00, LCDA)
                            }

                            If (LCDA)
                            {
                                If (LEqual (Local1, 0x01))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x01))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
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

                    Device (TV)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0200)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x04, Local0)
                            And (Local1, 0x04, Local1)
                            If (Local0)
                            {
                                Store (0x01, TVAA)
                            }
                            Else
                            {
                                Store (0x00, TVAA)
                            }

                            If (TVAA)
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (TVAA)
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

                    Method (DSSW, 0, NotSerialized)
                    {
                        If (LEqual (SWIT, 0x00))
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local1, 0x07, Local1)
                            Store (\_SB.PCI0.LPC0.INF, Local2)
                            Store (\_SB.PCI0.LPC0.INF1, Local3)
                            And (Local3, 0x0800, Local3)
                            If (LGreater (Local1, 0x01))
                            {
                                And (Local0, Local1, VLDF)
                                And (VLDF, 0xFE, VLDF)
                            }

                            If (VLDF)
                            {
                                If (LEqual (Local0, 0x03))
                                {
                                    If (LEqual (Local1, 0x01))
                                    {
                                        STBL (0x02)
                                    }

                                    If (LEqual (Local1, 0x02))
                                    {
                                        STBL (0x03)
                                    }

                                    If (LEqual (Local1, 0x03))
                                    {
                                        STBL (0x01)
                                    }
                                }

                                If (LEqual (Local0, 0x05))
                                {
                                    If (LEqual (Local3, 0x0800))
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x05)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x01)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                }

                                If (LEqual (Local0, 0x07))
                                {
                                    If (LEqual (Local3, 0x0800))
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x02)
                                        }

                                        If (LEqual (Local1, 0x02))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x03))
                                        {
                                            STBL (0x05)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x03)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x02)
                                        }

                                        If (LEqual (Local1, 0x02))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x03))
                                        {
                                            STBL (0x01)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x03)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, VLDF)
                                STBL (0x01)
                            }
                        }
                        Else
                        {
                            If (LEqual (SWIT, 0x01))
                            {
                                \_SB.PCI0.LPC0.PHSS (0x01)
                            }
                        }
                    }

                    Method (STBL, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Store (One, CRTA)
                            Store (Zero, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Store (One, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            Store (Zero, CRTA)
                            Store (Zero, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (One, TVAA)
                        }

                        Notify (\_SB.PCI0.AGP.VGA, 0x80)
                    }
                }
            }

            Device (PEG)
            {
                Name (_ADR, 0x00020000)
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
                    Name (CRTA, 0x01)
                    Name (LCDA, 0x01)
                    Name (TVAA, 0x01)
                    Name (VLDF, 0x01)
                    OperationRegion (VIDS, PCI_Config, 0x00, 0xC8)
                    Field (VIDS, DWordAcc, NoLock, Preserve)
                    {
                        VDID,   32
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    Method (_PS1, 0, NotSerialized)
                    {
                        Store (0x01, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (And (Arg0, 0x03), SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200
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
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x02, Local0)
                            And (Local1, 0x02, Local1)
                            If (Local0)
                            {
                                Store (0x01, CRTA)
                            }
                            Else
                            {
                                Store (0x00, CRTA)
                            }

                            If (CRTA)
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
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
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0110)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x01, Local0)
                            And (Local1, 0x01, Local1)
                            If (Local0)
                            {
                                Store (0x01, LCDA)
                            }
                            Else
                            {
                                Store (0x00, LCDA)
                            }

                            If (LCDA)
                            {
                                If (LEqual (Local1, 0x01))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x01))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
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

                    Device (TV)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0200)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x04, Local0)
                            And (Local1, 0x04, Local1)
                            If (Local0)
                            {
                                Store (0x01, TVAA)
                            }
                            Else
                            {
                                Store (0x00, TVAA)
                            }

                            If (TVAA)
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (TVAA)
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

                    Method (DSSW, 0, NotSerialized)
                    {
                        If (LEqual (SWIT, 0x00))
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local1, 0x07, Local1)
                            Store (\_SB.PCI0.LPC0.INF, Local2)
                            Store (\_SB.PCI0.LPC0.INF1, Local3)
                            And (Local3, 0x0800, Local3)
                            If (LGreater (Local1, 0x01))
                            {
                                And (Local0, Local1, VLDF)
                                And (VLDF, 0xFE, VLDF)
                            }

                            If (VLDF)
                            {
                                If (LEqual (Local0, 0x03))
                                {
                                    If (LEqual (Local1, 0x01))
                                    {
                                        STBL (0x02)
                                    }

                                    If (LEqual (Local1, 0x02))
                                    {
                                        STBL (0x03)
                                    }

                                    If (LEqual (Local1, 0x03))
                                    {
                                        STBL (0x01)
                                    }
                                }

                                If (LEqual (Local0, 0x05))
                                {
                                    If (LEqual (Local3, 0x0800))
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x05)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x01)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                }

                                If (LEqual (Local0, 0x07))
                                {
                                    If (LEqual (Local3, 0x0800))
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x02)
                                        }

                                        If (LEqual (Local1, 0x02))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x03))
                                        {
                                            STBL (0x05)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x03)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x02)
                                        }

                                        If (LEqual (Local1, 0x02))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x03))
                                        {
                                            STBL (0x01)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x03)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, VLDF)
                                STBL (0x01)
                            }
                        }
                        Else
                        {
                            If (LEqual (SWIT, 0x01))
                            {
                                \_SB.PCI0.LPC0.PHSS (0x01)
                            }
                        }
                    }

                    Method (STBL, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Store (One, CRTA)
                            Store (Zero, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Store (One, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            Store (Zero, CRTA)
                            Store (Zero, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (One, TVAA)
                        }

                        Notify (\_SB.PCI0.PEG.VGA, 0x80)
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

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MODM, 0x02)
            Notify (\_SB.PCI0.AUDO, 0x02)
        }

        Method (_L15, 0, NotSerialized)
        {
            Not (\_SB.PCI0.SMB.GM2C, \_SB.PCI0.SMB.GM2C)
            Notify (\_SB.LID, 0x80)
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
                    Store (0x08, \_SB.PCI0.PB4.SLST)
                    Store (0x08, \_SB.PCI0.PB5.SLST)
                    Store (\_SB.PCI0.PB4.NCRD.DVID, Local7)
                    Store (\_SB.PCI0.PB5.NCRD.DVID, Local7)
                    Sleep (0x0A)
                    Store (0x01, Local4)
                    Store (0x05, Local5)
                    While (LAnd (Local4, Local5))
                    {
                        Store (\_SB.PCI0.PB4.XPRD (0xA5), Local6)
                        And (Local6, 0x3F, Local6)
                        If (LLessEqual (Local6, 0x04))
                        {
                            Store (0x00, Local4)
                        }
                        Else
                        {
                            Store (\_SB.PCI0.PB4.NCRD.DVID, Local7)
                            Sleep (0x05)
                            Decrement (Local5)
                        }

                        Store (\_SB.PCI0.PB5.XPRD (0xA5), Local6)
                        And (Local6, 0x3F, Local6)
                        If (LLessEqual (Local6, 0x04))
                        {
                            Store (0x00, Local4)
                        }
                        Else
                        {
                            Store (\_SB.PCI0.PB5.NCRD.DVID, Local7)
                            Sleep (0x05)
                            Decrement (Local5)
                        }
                    }

                    \_SB.PCI0.XPTR (0x06, 0x00)
                    \_SB.PCI0.PB4.XPLP (0x00)
                    \_SB.PCI0.PB5.XPLP (0x00)
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
                    \_SB.PCI0.PB4.XPLP (0x01)
                    \_SB.PCI0.PB5.XPLP (0x01)
                    Sleep (0xC8)
                    \_SB.PCI0.XPTR (0x06, 0x01)
                    Sleep (0x14)
                    Store (0x00, Local2)
                    While (LLess (Local2, 0x0F))
                    {
                        Store (\_SB.PCI0.PB4.SLST, Local1)
                        If (And (Local1, 0x08))
                        {
                            Store (0x08, \_SB.PCI0.PB4.SLST)
                            Store (0x01, Local3)
                            Store (0xC8, Local4)
                            While (LAnd (Local3, Local4))
                            {
                                Store (\_SB.PCI0.PB4.SLST, Local1)
                                If (And (Local1, 0x40))
                                {
                                    Store ("HotPlug:06: PresenceDetect=1", Debug)
                                    Store (0x00, Local3)
                                }
                                Else
                                {
                                    Sleep (0x01)
                                    Decrement (Local4)
                                }
                            }

                            If (LNot (Local3))
                            {
                                Store (0x01, Local4)
                                Store (0xC8, Local5)
                                While (LAnd (Local4, Local5))
                                {
                                    Store (\_SB.PCI0.PB4.XPRD (0xA5), Local6)
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
                                    Store (\_SB.PCI0.PB4.XPDL (), Local5)
                                    If (Local5)
                                    {
                                        Store ("HotPlug:06: Retraining Link", Debug)
                                        \_SB.PCI0.PB4.XPRT ()
                                        Sleep (0x05)
                                        Increment (Local2)
                                    }
                                    Else
                                    {
                                        Store ("HotPlug:06: Device OK", Debug)
                                        Store (0x30, \_SB.PCI0.LPC0.INFO)
                                        Store (0x87, \_SB.PCI0.LPC0.BCMD)
                                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                                        If (LEqual (\_SB.PCI0.PB4.XPR2 (), Ones))
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
                            Else
                            {
                                Store ("HotPlug:06: PresenceDetect Timeout", Debug)
                                Store (0x10, Local2)
                            }
                        }
                        Else
                        {
                            Store ("HotPlug:06 Presence Detect Change not Set", Debug)
                            Store (0x10, Local2)
                        }

                        Store (\_SB.PCI0.PB5.SLST, Local1)
                        If (And (Local1, 0x08))
                        {
                            Store (0x08, \_SB.PCI0.PB5.SLST)
                            Store (0x01, Local3)
                            Store (0xC8, Local4)
                            While (LAnd (Local3, Local4))
                            {
                                Store (\_SB.PCI0.PB5.SLST, Local1)
                                If (And (Local1, 0x40))
                                {
                                    Store ("HotPlug:06: PresenceDetect=1", Debug)
                                    Store (0x00, Local3)
                                }
                                Else
                                {
                                    Sleep (0x01)
                                    Decrement (Local4)
                                }
                            }

                            If (LNot (Local3))
                            {
                                Store (0x01, Local4)
                                Store (0xC8, Local5)
                                While (LAnd (Local4, Local5))
                                {
                                    Store (\_SB.PCI0.PB5.XPRD (0xA5), Local6)
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
                                    Store (\_SB.PCI0.PB5.XPDL (), Local5)
                                    If (Local5)
                                    {
                                        Store ("HotPlug:06: Retraining Link", Debug)
                                        \_SB.PCI0.PB5.XPRT ()
                                        Sleep (0x05)
                                        Increment (Local2)
                                    }
                                    Else
                                    {
                                        Store ("HotPlug:06: Device OK", Debug)
                                        Store (0x30, \_SB.PCI0.LPC0.INFO)
                                        Store (0x87, \_SB.PCI0.LPC0.BCMD)
                                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                                        If (LEqual (\_SB.PCI0.PB5.XPR2 (), Ones))
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
                            Else
                            {
                                Store ("HotPlug:06: PresenceDetect Timeout", Debug)
                                Store (0x10, Local2)
                            }
                        }
                        Else
                        {
                            Store ("HotPlug:06 Presence Detect Change not Set", Debug)
                            Store (0x10, Local2)
                        }
                    }

                    If (LNot (HPOK))
                    {
                        Store ("HotPlug:06: Insertion Failed: Disable Training & PowerDown", Debug)
                        Store (\_SB.PCI0.PB4.NCRD.DVID, Local7)
                        Store (\_SB.PCI0.PB5.NCRD.DVID, Local7)
                        Sleep (0x0A)
                        Store (0x01, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (\_SB.PCI0.PB4.XPRD (0xA5), Local6)
                            And (Local6, 0x3F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Store (\_SB.PCI0.PB4.NCRD.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }

                            Store (\_SB.PCI0.PB5.XPRD (0xA5), Local6)
                            And (Local6, 0x3F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Store (\_SB.PCI0.PB5.NCRD.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        \_SB.PCI0.XPTR (0x06, 0x00)
                        \_SB.PCI0.PB4.XPLP (0x00)
                        \_SB.PCI0.PB5.XPLP (0x00)
                    }
                }
            }

            If (HPOK)
            {
                Notify (\_SB.PCI0.PB4, 0x00)
                Notify (\_SB.PCI0.PB5, 0x00)
                Store (0x86, \_SB.PCI0.LPC0.BCMD)
                Store (Zero, \_SB.PCI0.LPC0.SMIC)
            }
        }

        Method (_L1B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.HDA, 0x02)
        }
    }

    Scope (_TZ)
    {
        Name (DTMP, 0x0BBA)
        Name (DAC0, 0x0CA0)
        Name (DPSV, 0x0E30)
        Name (TBSE, 0x0AAC)
        Name (DCRT, 0x0E62)
        ThermalZone (THRM)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.ECOK ())
                {
                    If (LGreater (\_SB.PCI0.LPC0.EC0.THEM, \_SB.PCI0.LPC0.EC0.CTMP))
                    {
                        Multiply (\_SB.PCI0.LPC0.EC0.THEM, 0x0A, Local0)
                    }
                    Else
                    {
                        Multiply (\_SB.PCI0.LPC0.EC0.CTMP, 0x0A, Local0)
                    }

                    Add (Local0, 0x0AAC, Local0)
                    Return (Local0)
                }

                Return (DTMP)
            }

            Method (_AC0, 0, NotSerialized)
            {
                Return (DAC0)
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.ECOK ())
                {
                    Multiply (\_SB.PCI0.LPC0.EC0.THSD, 0x0A, Local0)
                    Add (Local0, 0x0AAC, Local0)
                    Return (Local0)
                }

                Return (DCRT)
            }

            Method (_PSV, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.ECOK ())
                {
                    Multiply (\_SB.PCI0.LPC0.EC0.THON, 0x0A, Local0)
                    Add (Local0, 0x0AAC, Local0)
                    Return (Local0)
                }

                Return (DPSV)
            }

            Method (_PSL, 0, NotSerialized)
            {
                If (CPUS)
                {
                    Return (Package (0x01)
                    {
                        \_PR.CPU0
                    })
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1
                    })
                }
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x05)
            Name (_TSP, 0x96)
        }
    }
}

