/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20081031
 *
 * Disassembly of 2450, Fri Dec 19 08:16:53 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00005D33 (23859)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0xEB
 *     OEM ID           "Acer"
 *     OEM Table ID     "BONEFISH"
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x0100000E (16777230)
 */
DefinitionBlock ("2450.aml", "DSDT", 1, "Acer", "BONEFISH", 0x06040000)
{
    External (Z00Y)
    External (PDC0)
    External (CFGD)

    Name (Z000, 0x01)
    Name (Z001, 0x02)
    Name (Z002, 0x04)
    Name (Z003, 0x08)
    Name (Z004, 0x00)
    Name (Z005, 0x0F)
    Name (Z006, 0x0D)
    Name (Z007, 0x0B)
    Name (Z008, 0x09)
    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00008010, 0x06) {}
        Processor (CPU1, 0x01, 0x00008010, 0x06) {}
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

    OperationRegion (MNVS, SystemMemory, 0x1BE9CF9C, 0x0020)
    Field (MNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        CSTE,   16, 
        BGU1,   8, 
        BST1,   8, 
        BFC1,   16, 
        WLDV,   8, 
        PTYP,   8, 
        PCMA,   8, 
        SBTH,   8
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

    Name (ECDY, 0x07)
    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, DBGP)
        If (LEqual (Arg0, 0x05))
        {
            Store (Zero, \_SB.PCI0.SMB.PI2E)
            Store (One, \_SB.PCI0.SMB.SLPS)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (Zero, \_SB.PCI0.SMB.PI2E)
            Store (\_SB.PCI0.SMB.RVID, Local1)
            If (LGreaterEqual (Local1, 0x10))
            {
                Store (Zero, \_SB.PCI0.SMB.RSTU)
            }

            Store (One, \_SB.PCI0.SMB.SLPS)
            Store (0x82, \_SB.PCI0.LPC0.BCMD)
            Store (Zero, \_SB.PCI0.LPC0.SMIC)
            \_SB.PCI0.LPC0.PHSS (0x0E)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Zero, \_SB.PCI0.SMB.PI2E)
            Store (\_SB.PCI0.SMB.RVID, Local1)
            If (LGreaterEqual (Local1, 0x80))
            {
                Store (Zero, \_SB.PCI0.SMB.RS3U)
            }

            Store (One, \_SB.PCI0.SMB.SLPS)
            Store (0x82, \_SB.PCI0.LPC0.BCMD)
            Store (Zero, \_SB.PCI0.LPC0.SMIC)
            \_SB.PCI0.LPC0.PHSS (0x10)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (0x81, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (LAnd (And (CFGD, 0x01000000), LGreaterEqual (\_SB.TPOS, 0x08)))
            {
                If (LAnd (And (CFGD, 0xF0), LNot (And (PDC0, 0x10
                    ))))
                {
                    Store (One, \_SB.PCI0.SMB.PI2E)
                    Store (0x49, \_SB.PCI0.LPC0.BCMD)
                    Store (0x01, \_SB.PCI0.LPC0.DID)
                    Store (0x00, \_SB.PCI0.LPC0.SMIC)
                }

                If (LAnd (And (CFGD, 0xF0), And (PDC0, 0x10)))
                {
                    Store (One, \_SB.PCI0.SMB.PI2E)
                    Store (0x49, \_SB.PCI0.LPC0.BCMD)
                    Store (0x00, \_SB.PCI0.LPC0.DID)
                    Store (0x00, \_SB.PCI0.LPC0.SMIC)
                }
            }
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x30, DBGP)
            \_SB.PCI0.LPC0.PHSS (0x11)
        }

        If (LEqual (Arg0, 0x04))
        {
            If (GPIC)
            {
                \_SB.PCI0.LPC0.DSPI ()
            }

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

        Notify (\_SB.PCI0, 0x00)
    }

    Scope (\_SB)
    {
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0x1BE9CF2C, 0x00000001)
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
                Return (\_SB.PCI0.SMB.LIDP)
            }
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
            Name (NTDV, 0x00)
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
                Store (WLDV, AS00)
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
                If (LEqual (BGEF, 0x01))
                {
                    Store (NTDV, Local0)
                    If (LNotEqual (Local0, 0x00))
                    {
                        Store (0x00, NTDV)
                        Return (Local0)
                    }
                }

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
                Store (Arg1, BUFF)
                If (LEqual (Arg0, 0x04))
                {
                    If (And (CFGD, 0x80))
                    {
                        Store (BF00, \_SB.PCI0.SMB.C4C3)
                    }

                    Store (BF00, Index (BCDS, 0x09))
                }
                Else
                {
                    Store (\_SB.PCI0.SMB.C4C3, Index (BCDS, 0x09))
                }
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
                                                            Store (0x01C2, Index (BEDS, 0x10))
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
                                                        Store (0x01C2, Index (BEDS, 0x10))
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
                Store (Arg0, Local0)
                If (LEqual (Local0, 0x01))
                {
                    Store (0x01, BGEF)
                }
                Else
                {
                    Store (0x00, BGEF)
                }

                Store (0x00, Index (BGDS, 0x00))
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

        OperationRegion (SMI2, SystemMemory, 0x1BE9CE2C, 0x00000100)
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

        Mutex (PSMX, 0x00)
        Method (PHWM, 2, NotSerialized)
        {
            Acquire (\_SB.PSMX, 0xFFFF)
            Store (0xE0, WCMD)
            Store (0x57, TPID)
            Store (Arg0, WDID)
            Store (Arg1, DI00)
            Store (Zero, \_SB.PCI0.LPC0.SMIC)
            Store (DI00, Local0)
            Release (\_SB.PSMX)
            Return (Local0)
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
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
                If (LGreaterEqual (TPOS, 0x08))
                {
                    Store (Zero, \_SB.PCI0.SMB.C4C3)
                    Store (0x49, \_SB.PCI0.LPC0.BCMD)
                    Store (0x01, \_SB.PCI0.LPC0.DID)
                    Store (0x00, \_SB.PCI0.LPC0.SMIC)
                }
            }

            OperationRegion (MREG, PCI_Config, 0x92, 0x02)
            Field (MREG, ByteAcc, NoLock, Preserve)
            {
                TOML,   8, 
                TOMH,   8
            }

            Method (TOM, 0, NotSerialized)
            {
                Multiply (TOML, 0x00010000, Local0)
                Multiply (TOMH, 0x01000000, Local1)
                Add (Local0, Local1, Local0)
                Return (Local0)
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
                Store (And (Local0, 0x7F, Local0), MIDX)
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

            OperationRegion (REGS, PCI_Config, 0x59, 0x08)
            Field (REGS, ByteAcc, NoLock, Preserve)
            {
                SR59,   8, 
                SR5A,   8, 
                SR5B,   8, 
                SR5C,   8, 
                SR5D,   8, 
                SR5E,   8, 
                SR5F,   8
            }

            Name (RSRC, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
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
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFFFDFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
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
                If (LEqual (SR5A, 0x01))
                {
                    Store (Zero, C0RW)
                }

                Store (0x4000, C0LN)
                If (And (SR5A, 0x03))
                {
                    Store (0x00, C0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y01._RW, C4RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y01._LEN, C4LN)
                Store (One, C4RW)
                If (LEqual (SR5A, 0x10))
                {
                    Store (Zero, C4RW)
                }

                Store (0x4000, C4LN)
                If (And (SR5A, 0x30))
                {
                    Store (0x00, C4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y02._RW, C8RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y02._LEN, C8LN)
                Store (One, C8RW)
                If (LEqual (SR5B, 0x01))
                {
                    Store (Zero, C8RW)
                }

                Store (0x4000, C8LN)
                If (And (SR5B, 0x03))
                {
                    Store (0x00, C8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y03._RW, CCRW)
                CreateDWordField (RSRC, \_SB.PCI0._Y03._LEN, CCLN)
                Store (One, CCRW)
                If (LEqual (SR5B, 0x10))
                {
                    Store (Zero, CCRW)
                }

                Store (0x4000, CCLN)
                If (And (SR5B, 0x30))
                {
                    Store (0x00, CCLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y04._RW, D0RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y04._LEN, D0LN)
                Store (One, D0RW)
                If (LEqual (SR5C, 0x01))
                {
                    Store (Zero, D0RW)
                }

                Store (0x4000, D0LN)
                If (And (SR5C, 0x03))
                {
                    Store (0x00, D0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y05._RW, D4RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y05._LEN, D4LN)
                Store (One, D4RW)
                If (LEqual (SR5C, 0x10))
                {
                    Store (Zero, D4RW)
                }

                Store (0x4000, D4LN)
                If (And (SR5C, 0x30))
                {
                    Store (0x00, D4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y06._RW, D8RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y06._LEN, D8LN)
                Store (One, D8RW)
                If (LEqual (SR5D, 0x01))
                {
                    Store (Zero, D8RW)
                }

                Store (0x4000, D8LN)
                If (And (SR5D, 0x03))
                {
                    Store (0x00, D8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y07._RW, DCRW)
                CreateDWordField (RSRC, \_SB.PCI0._Y07._LEN, DCLN)
                Store (One, DCRW)
                If (LEqual (SR5D, 0x10))
                {
                    Store (Zero, DCRW)
                }

                Store (0x4000, DCLN)
                If (And (SR5D, 0x30))
                {
                    Store (0x00, DCLN)
                }

                CreateDWordField (RSRC, \_SB.PCI0._Y08._MIN, BTMN)
                CreateDWordField (RSRC, \_SB.PCI0._Y08._MAX, BTMX)
                CreateDWordField (RSRC, \_SB.PCI0._Y08._LEN, BTLN)
                Store (\_SB.PCI0.TOM (), BTMN)
                Subtract (0xFEC00000, BTMN, BTLN)
                Subtract (Add (BTMN, BTLN), 0x01, BTMX)
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
                })
                Method (_CRS, 0, NotSerialized)
                {
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

            OperationRegion (BAR1, PCI_Config, 0x14, 0x7C)
            Field (BAR1, ByteAcc, NoLock, Preserve)
            {
                Z00U,   32, 
                        Offset (0x78), 
                    ,   1, 
                Z00V,   1
            }

            Device (PB2)
            {
                Name (_ADR, 0x00020000)
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

            Device (PB7)
            {
                Name (_ADR, 0x00070000)
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

                OperationRegion (XPEX, SystemMemory, 0xE0038100, 0x0100)
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
                    If (And (VC02, 0x00020000))
                    {
                        Store (Ones, Local0)
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
                    If (LEqual (\_SB.PCI0.GPPM (), 0x02))
                    {
                        Store (0x1010, Local1)
                    }
                    Else
                    {
                        Store (0x2020, Local1)
                    }

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
                        If (\_SB.PCI0.SMB.GVT6)
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

            Scope (\_GPE)
            {
                Method (_L18, 0, NotSerialized)
                {
                    Notify (\_SB.PCI0.PB2, 0x02)
                    Notify (\_SB.PCI0.PB3, 0x02)
                    Notify (\_SB.PCI0.PB6, 0x02)
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
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x01, \_SB.PCI0.LPC0.EC0.UWAK)
                    }
                }
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130001)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x01, \_SB.PCI0.LPC0.EC0.UWAK)
                    }
                }
            }

            Device (EHCI)
            {
                Name (_ADR, 0x00130002)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x01, \_SB.PCI0.LPC0.EC0.UWAK)
                    }
                }
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

                OperationRegion (BAR5, SystemMemory, GBAA (), 0x0200)
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

                OperationRegion (BAR5, SystemMemory, GBAA (), 0x0200)
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

            Scope (\_GPE)
            {
                Method (_L1F, 0, NotSerialized)
                {
                    Sleep (0x07D0)
                    Store (\_SB.PCI0.SATA.BA05, \_SB.PCI0.SATA.BA_5)
                    \_SB.PCI0.SATA.GBAA ()
                    If (\_SB.PCI0.SATA.B5EN)
                    {
                        If (\_SB.PCI0.SATA.STA0)
                        {
                            Notify (\_SB.PCI0.SATA.PRID.P_D0, 0x00)
                            Sleep (0x07D0)
                            Notify (\_SB.PCI0.SATA.PRID, 0x01)
                            Sleep (0x07D0)
                            Store (\_SB.PCI0.SATA.STA0, \_SB.PCI0.SATA.STA0)
                        }

                        If (\_SB.PCI0.SATA.STA1)
                        {
                            Notify (\_SB.PCI0.SATA.SECD.S_D0, 0x00)
                            Sleep (0x07D0)
                            Notify (\_SB.PCI0.SATA.SECD, 0x01)
                            Sleep (0x07D0)
                            Store (\_SB.PCI0.SATA.STA1, \_SB.PCI0.SATA.STA1)
                        }
                    }

                    Store (\_SB.PCI0.SAT2.BA05, \_SB.PCI0.SAT2.BA_5)
                    \_SB.PCI0.SAT2.GBAA ()
                    If (\_SB.PCI0.SAT2.B5EN)
                    {
                        If (\_SB.PCI0.SAT2.STA0)
                        {
                            Notify (\_SB.PCI0.SAT2.PRID.P_D0, 0x00)
                            Sleep (0x07D0)
                            Notify (\_SB.PCI0.SAT2.PRID, 0x01)
                            Sleep (0x07D0)
                            Store (\_SB.PCI0.SAT2.STA0, \_SB.PCI0.SAT2.STA0)
                        }

                        If (\_SB.PCI0.SAT2.STA1)
                        {
                            Notify (\_SB.PCI0.SAT2.SECD.S_D0, 0x00)
                            Sleep (0x07D0)
                            Notify (\_SB.PCI0.SAT2.SECD, 0x01)
                            Sleep (0x07D0)
                            Store (\_SB.PCI0.SAT2.STA1, \_SB.PCI0.SAT2.STA1)
                        }
                    }
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x00140000)
                OperationRegion (Z00W, PCI_Config, 0x08, 0x01)
                Field (Z00W, ByteAcc, NoLock, Preserve)
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
                            Offset (0x3A), 
                        ,   6, 
                    LIDP,   1, 
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
                            Offset (0x86), 
                        ,   1, 
                    TDTY,   3, 
                    TENB,   1, 
                            Offset (0x92), 
                        ,   6, 
                    GE6I,   1
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

                Method (ECOK, 0, NotSerialized)
                {
                    If (LEqual (\_SB.PCI0.LPC0.EC0.Z00X, 0x01))
                    {
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
                    Name (_GPE, 0x13)
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
                        VGAE,   1, 
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
                        THSD,   8, 
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
                                Offset (0xB9), 
                        BRTS,   8, 
                                Offset (0xBB), 
                        WLAT,   1, 
                        BTAT,   1, 
                        WLEX,   1, 
                        BTEX,   1, 
                        KLSW,   1, 
                                Offset (0xBD), 
                        CPUN,   8, 
                                Offset (0xC0), 
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

                    Method (_Q11, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (\_SB.PCI0.LPC0.EC0.BRTS, Local1)
                            Store (\_SB.WMID.LBL0, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, \_SB.WMID.NTDC)
                            Notify (\_SB.WMID, 0x80)
                        }
                    }

                    Method (_Q1C, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.LPC0.EC0.VIDO)
                        {
                            \_SB.PCI0.AGP.VGA.DSSW ()
                            Store (0x00, \_SB.PCI0.LPC0.EC0.VIDO)
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
                        Store (0x37, DBGP)
                        Notify (\_SB.PCI0.LPC0.ACAD, 0x00)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q38, 0, NotSerialized)
                    {
                        Store (0x38, DBGP)
                        Notify (\_SB.PCI0.LPC0.ACAD, 0x01)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q40, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BGEF, 0x01))
                        {
                            If (LEqual (\_SB.PCI0.LPC0.EC0.VGAE, 0x00))
                            {
                                Store (\_SB.WMID.VAPI, Local0)
                            }
                            Else
                            {
                                Store (\_SB.WMID.VAPO, Local0)
                            }

                            Store (Local0, \_SB.WMID.NTDV)
                            Notify (\_SB.WMID, 0x82)
                        }
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
                    Field (ECRM, AnyAcc, Lock, Preserve)
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
                        RFRD,   16
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

                    Method (PCLK, 0, NotSerialized)
                    {
                        Store (PTVL, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Store (0x00, THEN)
                        }
                        Else
                        {
                            Decrement (Local0)
                            Store (Not (Local0), Local1)
                            And (Local1, 0x07, Local1)
                            Store (Local1, DUTY)
                            Store (0x01, THEN)
                        }
                    }
                }

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

                Device (KBC0)
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
                        EisaId ("SYN0700"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
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
                            0xFD60,             // Range Minimum
                            0xFD60,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8100,             // Range Minimum
                            0x81FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic)
                        IO (Decode16,
                            0x8210,             // Range Minimum
                            0x8210,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
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
                            _Y09)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LGreaterEqual (TPOS, 0x04))
                        {
                            CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y09._BAS, BARX)
                            CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y09._LEN, GALN)
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

                OperationRegion (SMI1, SystemMemory, 0x1BE9CE2C, 0x00000100)
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
                    Store (0x80, BCMD)
                    Store (Arg0, DID)
                    Store (Zero, SMIC)
                    Release (PSMX)
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Method (_INI, 0, NotSerialized)
                    {
                    }

                    OperationRegion (SIIO, SystemIO, 0x2E, 0x02)
                    Field (SIIO, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    Mutex (S227, 0x00)
                    Method (ENTR, 0, NotSerialized)
                    {
                        Store (0x55, INDX)
                    }

                    Method (EXIT, 0, NotSerialized)
                    {
                        Store (0xAA, INDX)
                    }

                    Method (RDRG, 1, NotSerialized)
                    {
                        ENTR ()
                        Store (Arg0, INDX)
                        Store (DATA, Local0)
                        EXIT ()
                        Return (Local0)
                    }

                    Method (WRRG, 2, NotSerialized)
                    {
                        ENTR ()
                        Store (Arg0, INDX)
                        Store (Arg1, DATA)
                        EXIT ()
                    }

                    Method (READ, 3, NotSerialized)
                    {
                        Acquire (S227, 0xFFFF)
                        If (LEqual (Arg0, 0x00))
                        {
                            Store (RDRG (Arg1), Local1)
                        }

                        And (Local1, Arg2, Local1)
                        Release (S227)
                        Return (Local1)
                    }

                    Method (WRIT, 3, NotSerialized)
                    {
                        Acquire (S227, 0xFFFF)
                        If (LEqual (Arg0, 0x00))
                        {
                            WRRG (Arg1, Arg2)
                        }

                        Release (S227)
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
                        0x0FA0, 
                        0x0FA0, 
                        0x01, 
                        0x39D0, 
                        0x01A4, 
                        0x9C, 
                        0x0108, 
                        0x0EC4, 
                        Z00Y, 
                        "", 
                        "Lion", 
                        "COMPAL "
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
                            Store (\_SB.PCI0.LPC0.EC0.BMF0, Local1)
                            Sleep (0x14)
                            If (LEqual (Local1, 0x01))
                            {
                                Store ("GC86508SAT0 ", Index (PBIF, 0x09))
                                Store ("SANYO ", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Store ("GC86503SY90 ", Index (PBIF, 0x09))
                                    Store ("SONY ", Index (PBIF, 0x0C))
                                }
                                Else
                                {
                                    If (LEqual (Local1, 0x04))
                                    {
                                        Store ("GC86503PAG0 ", Index (PBIF, 0x09))
                                        Store ("PANASONIC ", Index (PBIF, 0x0C))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x05))
                                        {
                                            Store ("GC86508SM60 ", Index (PBIF, 0x09))
                                            Store ("SAMSUNG ", Index (PBIF, 0x0C))
                                        }
                                        Else
                                        {
                                            Store ("BCL3100LiON ", Index (PBIF, 0x09))
                                            Store ("COMPAL ", Index (PBIF, 0x0C))
                                        }
                                    }
                                }
                            }
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
                                0x0002FFFF, 
                                0x00, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x01, 
                                0x00, 
                                0x17
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
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                0x00, 
                                0x16
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x05)
                        {
                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKH, 
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
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKG, 
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

            Device (AZLA)
            {
                Name (_ADR, 0x00140002)
                Name (_PRW, Package (0x02)
                {
                    0x1B, 
                    0x03
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
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
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
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
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
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
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
                            Store (CADL, Local0)
                            Store (CSTE, Local1)
                            Store (\_SB.PCI0.LPC0.INF, Local2)
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
                                        STBL (0x03)
                                    }

                                    If (LEqual (Local1, 0x02))
                                    {
                                        STBL (0x01)
                                    }

                                    If (LEqual (Local1, 0x03))
                                    {
                                        STBL (0x02)
                                    }
                                }

                                If (LEqual (Local0, 0x05))
                                {
                                    If (LEqual (Local1, 0x01))
                                    {
                                        If (LNotEqual (Local2, 0x00))
                                        {
                                            STBL (0x04)
                                        }
                                        Else
                                        {
                                            STBL (0x05)
                                        }
                                    }

                                    If (LEqual (Local1, 0x04))
                                    {
                                        STBL (0x01)
                                    }

                                    If (LEqual (Local1, 0x05))
                                    {
                                        STBL (0x04)
                                    }
                                }

                                If (LEqual (Local0, 0x07))
                                {
                                    If (LEqual (Local1, 0x01))
                                    {
                                        STBL (0x03)
                                    }

                                    If (LEqual (Local1, 0x02))
                                    {
                                        If (LNotEqual (Local2, 0x00))
                                        {
                                            STBL (0x04)
                                        }
                                        Else
                                        {
                                            STBL (0x05)
                                        }
                                    }

                                    If (LEqual (Local1, 0x03))
                                    {
                                        STBL (0x02)
                                    }

                                    If (LEqual (Local1, 0x04))
                                    {
                                        STBL (0x01)
                                    }

                                    If (LEqual (Local1, 0x05))
                                    {
                                        STBL (0x04)
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

                        If (LEqual (Arg0, 0x04))
                        {
                            Store (Zero, CRTA)
                            Store (Zero, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Store (One, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x06))
                        {
                            If (LEqual (\_SB.PCI0.Z00V, 0x01))
                            {
                                Store (Zero, CRTA)
                                Store (One, LCDA)
                                Store (One, TVAA)
                            }
                            Else
                            {
                                Store (One, CRTA)
                                Store (Zero, LCDA)
                                Store (One, TVAA)
                            }
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x07))
                        {
                            Store (One, CRTA)
                            Store (One, LCDA)
                            Store (One, TVAA)
                        }

                        Notify (\_SB.PCI0.AGP.VGA, 0x80)
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
        }

        Method (_L1B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.AZLA, 0x02)
        }

        Method (_L16, 0, NotSerialized)
        {
            If (LEqual (\_SB.PCI0.SMB.LIDP, 0x01))
            {
                \_SB.PCI0.LPC0.PHSS (0x72)
            }

            Not (\_SB.PCI0.SMB.LIDP, \_SB.PCI0.SMB.LIDP)
            Notify (\_SB.LID, 0x80)
        }
    }
}

