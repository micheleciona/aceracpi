/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of 7520, Sun Nov 18 01:07:56 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000066C5 (26309)
 *     Revision         0x01
 *     OEM ID           "NVIDIA"
 *     OEM Table ID     "MCP67"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x03000000 (50331648)
 */
DefinitionBlock ("7520.aml", "DSDT", 1, "NVIDIA", "MCP67", 0x06040000)
{
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
    Name (SX, 0x00)
    Name (CRTS, 0x00)
    OperationRegion (MNVT, SystemMemory, 0x2FF65F9B, 0x21)
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
        TPTP,   8, 
        PCMS,   8, 
        CPUS,   8, 
        UMAS,   8, 
        MIRS,   8, 
        KBTP,   8
    }

    Method (\_PTS, 1, NotSerialized)
    {
        Store (Arg0, DBUG)
        If (LEqual (Arg0, 0x03))
        {
            \_SB.PHSS (0x80)
            \_SB.PHSS (0x85)
        }

        If (LEqual (Arg0, 0x04))
        {
            \_SB.PHSS (0x0E)
            Store (0xBB, \_SB.PCI0.LPC0.EC0.S4FG)
        }

        If (LEqual (Arg0, 0x05))
        {
            \_SB.PHSS (0x85)
        }
    }

    Method (\_WAK, 1, NotSerialized)
    {
        Or (Arg0, 0x50, DBUG)
        Notify (\_SB.PWRB, 0x02)
        Store (0x62, DBUG)
        \_GPE._L14 ()
        If (LEqual (Arg0, 0x03))
        {
            \_SB.PHSS (0x81)
            Store (0x63, DBUG)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0xBC, \_SB.PCI0.LPC0.EC0.S4FG)
            Store (0x64, DBUG)
        }
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00001010, 0x06) {}
        Processor (CPU1, 0x01, 0x00000000, 0x00) {}
        Processor (CPU2, 0x02, 0x00000000, 0x00) {}
        Processor (CPU3, 0x03, 0x00000000, 0x00) {}
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
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MAC0, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB0, 0x02)
        }

        Method (_L10, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.LPC0.KBC0, 0x02)
        }

        Method (_L11, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.XVR0, 0x02)
            Notify (\_SB.PCI0.XVR1, 0x02)
        }

        Method (_L12, 0, NotSerialized)
        {
            If (LEqual (\_SB.WMID.BGEF, 0x01))
            {
                If (LNotEqual (CRTS, 0x01))
                {
                    Store (0x01, CRTS)
                    Store (\_SB.WMID.VAPI, Local0)
                }
                Else
                {
                    Store (0x00, CRTS)
                    Store (\_SB.WMID.VAPO, Local0)
                }

                Store (Local0, \_SB.WMID.NTDV)
                Notify (\_SB.WMID, 0x82)
            }
        }

        Method (_L14, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.XVR1, 0x00)
        }

        Method (_L15, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.AZA0, 0x02)
        }

        Method (_L17, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.Z000, 0x02)
        }

        Method (_L18, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.Z001, 0x02)
        }
    }

    Scope (\_SB)
    {
        Scope (\_SB)
        {
            Name (OSTB, Ones)
            OperationRegion (OSTY, SystemMemory, 0x2FF65F2B, 0x00000001)
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
                        If (\_OSI ("Windows 2006"))
                        {
                            Store (0x40, ^OSTB)
                            Store (0x40, ^TPOS)
                            Store (0x40, OSYS)
                        }
                        Else
                        {
                            If (\_OSI ("Windows 2001.1"))
                            {
                                Store (0x20, ^OSTB)
                                Store (0x20, ^TPOS)
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
                                    If (\_OSI ("Windows 2001 SP1"))
                                    {
                                        Store (0x10, ^OSTB)
                                        Store (0x10, ^TPOS)
                                    }
                                    Else
                                    {
                                        Store (0x00, ^OSTB)
                                        Store (0x00, ^TPOS)
                                    }
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
                \_SB.PHS1 (0x48)
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

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.ECOK ())
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
                0x15, 
                0x03
            })
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
        Field (SMI0, AnyAcc, NoLock, Preserve)
        {
            SMIC,   8
        }

        OperationRegion (SSMI, SystemIO, 0x142E, 0x02)
        Field (SSMI, AnyAcc, NoLock, Preserve)
        {
            SCMD,   8, 
            SDID,   8
        }

        OperationRegion (SMI1, SystemMemory, 0x2FF65E9B, 0x00000090)
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
            INFB,   8
        }

        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
                    Offset (0x05), 
            INFD,   32
        }

        Mutex (PSMX, 0x00)
        Method (PHS1, 1, NotSerialized)
        {
            Acquire (PSMX, 0xFFFF)
            Store (0x00, DID)
            Store (Arg0, BCMD)
            Store (Zero, SMIC)
            Store (INFD, Local0)
            Release (PSMX)
            Return (Local0)
        }

        Method (PHS2, 2, NotSerialized)
        {
            Acquire (PSMX, 0xFFFF)
            Store (0x00, DID)
            Store (Arg1, INFD)
            Store (Arg0, BCMD)
            Store (Zero, SMIC)
            Store (INFD, Local0)
            Release (PSMX)
            Return (Local0)
        }

        Method (PHSS, 1, NotSerialized)
        {
            Acquire (PSMX, 0xFFFF)
            Store (Arg0, SDID)
            Store (0x80, SCMD)
            Release (PSMX)
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
            Name (BADG, Package (0x0D)
            {
                0x01, 
                0x01, 
                0x00, 
                0x00, 
                0x00, 
                0x00, 
                0x00, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000
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
            Name (LDOF, 0x0A00)
            Name (LDON, 0x0A01)
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
                Store (0x00, AS02)
                Store (0x00, AS03)
            }

            Method (Z002, 1, NotSerialized)
            {
                Store (\_SB.PCI0.LPC0.EC0.WLAT, Local0)
                Store (Local0, Index (BADG, 0x00))
                Store (\_SB.PCI0.LPC0.EC0.BTAT, Local0)
                Store (Local0, Index (BADG, 0x01))
                Store (\_SB.PCI0.LPC0.EC0.BRTS, Local0)
                Store (Local0, Index (BADG, 0x02))
                Store (0x01, Local0)
                Store (Local0, Index (BADG, 0x07))
                Store (0x00, Local0)
                Store (Local0, Index (BADG, 0x08))
                Store (\_SB.PCI0.LPC0.EC0.LCDS, Local0)
                Store (Local0, Index (BADG, 0x0C))
            }

            Method (Z003, 2, NotSerialized)
            {
                Store (Arg1, BUFF)
                Store (Arg0, Local0)
                Store (BF00, Local1)
                Store (Local0, Debug)
                Store (Local1, Debug)
                Store (0x00, Local2)
                While (One)
                {
                    Name (_T_0, 0x00)
                    Store (Local1, _T_0)
                    If (LEqual (_T_0, 0x00))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)
                            Store (Local0, _T_1)
                            If (LEqual (_T_1, 0x04))
                            {
                                Store (0x00, \_SB.PCI0.LPC0.EC0.WLAT)
                            }
                            Else
                            {
                                If (LEqual (_T_1, 0x05))
                                {
                                    Store (0x00, \_SB.PCI0.LPC0.EC0.BTAT)
                                }
                                Else
                                {
                                    If (LEqual (_T_1, 0x06))
                                    {
                                        Store (0x00, \_SB.PCI0.LPC0.EC0.BRTS)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_1, 0x07))
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

                            Break
                        }
                    }
                    Else
                    {
                        While (One)
                        {
                            Name (_T_2, 0x00)
                            Store (Local0, _T_2)
                            If (LEqual (_T_2, 0x04))
                            {
                                Store (0x01, \_SB.PCI0.LPC0.EC0.WLAT)
                                Store (0x00, Index (BADG, 0x00))
                            }
                            Else
                            {
                                If (LEqual (_T_2, 0x05))
                                {
                                    Store (0x01, \_SB.PCI0.LPC0.EC0.BTAT)
                                    Store (0x00, Index (BADG, 0x01))
                                }
                                Else
                                {
                                    If (LEqual (_T_2, 0x06))
                                    {
                                        Store (Local1, \_SB.PCI0.LPC0.EC0.BRTS)
                                        Store (0x00, Index (BADG, 0x02))
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_2, 0x07))
                                        {
                                            Store (0x01, BAEF)
                                            Store (0x00, Index (BADG, 0x03))
                                        }
                                        Else
                                        {
                                            Store (0x01, Local2)
                                        }
                                    }
                                }
                            }

                            Break
                        }
                    }

                    Break
                }

                If (LEqual (Local2, 0x01))
                {
                    While (One)
                    {
                        Name (_T_3, 0x00)
                        Store (Local0, _T_3)
                        If (LEqual (_T_3, 0x04))
                        {
                            Store (0x02, Index (BADG, 0x00))
                        }
                        Else
                        {
                            If (LEqual (_T_3, 0x05))
                            {
                                Store (0x03, Index (BADG, 0x00))
                            }
                            Else
                            {
                                If (LEqual (_T_3, 0x06))
                                {
                                    Store (0x04, Index (BADG, 0x00))
                                }
                            }
                        }

                        Break
                    }
                }
            }

            Method (Z004, 0, NotSerialized)
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

            Method (Z005, 2, NotSerialized)
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

            Method (Z006, 2, NotSerialized)
            {
                Store (Arg1, BUFF)
                Store (ERRD, Index (BCDS, BF00))
            }

            Method (Z007, 1, NotSerialized)
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

            Method (Z008, 1, NotSerialized)
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

            Method (Z009, 1, NotSerialized)
            {
                Store (DSY3, DSY1)
                Store (\_SB.PHWM (0x02, Arg0), Local2)
                Store (Local2, DSY6)
                Store (DY60, DY10)
                Store (DY61, DY11)
                Store (0x00, WIT0)
                Store (WIT0, DY12)
            }

            Method (Z00A, 2, NotSerialized)
            {
                Store (0x00010000, Index (BCDS, 0x09))
            }

            Method (Z00B, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPC0.EC0.THFN, Local0)
                Multiply (Local0, 0x64, Local1)
                Store (Local1, Index (BCDS, 0x0A))
            }

            Method (Z00C, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPC0.EC0.CTMP, Index (BCDS, 0x0B))
            }

            Method (Z00D, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (\_SB.PHWM (0x03, Arg0), Local2)
                Store (Local2, DY20)
                Store (Local2, DSY6)
                Store (DSY4, DSY2)
                Store (DY60, DY20)
            }

            Method (Z00E, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (Arg0, DY20)
                Store (\_SB.PHWM (0x04, Arg0), Local2)
                Store (Local2, DSY6)
                Store (DY61, BUFF)
            }

            Method (Z00F, 0, NotSerialized)
            {
                Store (\_SB.PHWM (0x05, 0x00), Local2)
                Store (Local2, BUFF)
                Store (BUFF, Index (BCDS, 0x0C))
            }

            Method (PCID, 1, NotSerialized)
            {
                Store (Arg0, DSY6)
                Store (DY61, BUFF)
                Store (DY60, Local1)
                Store (0x00, DY60)
                Store (0x00, DY61)
                Store (0x00, DY62)
                Store (0x00, DY63)
                Store (0x00, DY64)
                If (LEqual (BF00, 0x00))
                {
                    Store (0x01, DY64)
                }
                Else
                {
                    If (LEqual (BF00, 0x01))
                    {
                        Store (0x01, DY64)
                    }
                    Else
                    {
                        If (LEqual (BF00, 0x02))
                        {
                            Store (Local1, BUFF)
                            If (LEqual (BF00, 0x00))
                            {
                                Store (0x01, DY63)
                            }
                            Else
                            {
                                If (LEqual (BF00, 0x01))
                                {
                                    Store (0x04, DY61)
                                    Store (0x01, DY62)
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (BF00, 0x03))
                            {
                                Store (Local1, BUFF)
                                If (LEqual (BF00, 0x00))
                                {
                                    Store (0x01, DY63)
                                }
                                Else
                                {
                                    If (LEqual (BF00, 0x01))
                                    {
                                        Store (0x0A, DY61)
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Method (Z00G, 2, NotSerialized)
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

            Method (Z00H, 0, NotSerialized)
            {
                Store (0x01, GSTS)
                Return (GSTS)
            }

            Method (Z00I, 1, NotSerialized)
            {
            }

            Method (Z00J, 1, NotSerialized)
            {
            }

            Method (Z00K, 1, NotSerialized)
            {
            }

            Method (Z00L, 1, NotSerialized)
            {
            }

            Method (Z00M, 1, NotSerialized)
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
                0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E, 
                0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A, 
                0x41, 0x41, 
                0x01, 
                0x01, 

                0x58, 0xF2, 0xF4, 0x6A, 0x01, 0xB4, 0xFD, 0x42, 
                0xBE, 0x91, 0x3D, 0x4A, 0xC2, 0xD7, 0xC0, 0xD3, 
                0x42, 0x41, 
                0x01, 
                0x02, 

                0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41, 
                0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5, 
                0x80, 0x00, 
                0x01, 
                0x08, 

                0x53, 0x44, 0x8C, 0xE7, 0x27, 0x02, 0x61, 0x48,
                0x9E, 0xDE, 0xF5, 0x60, 0x0B, 0x4A, 0x3D, 0x39,
                0x42, 0x42, 
                0x01, 
                0x02, 

                0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48, 
                0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B, 
                0x42, 0x43, 
                0x01, 
                0x02, 

                0x79, 0x4C, 0xF9, 0xCF, 0x77, 0x6C, 0xF7, 0x4A, 
                0xAC, 0x56, 0x7D, 0xD0, 0xCE, 0x01, 0xC9, 0x97, 
                0x42, 0x44, 
                0x01, 
                0x02, 

                0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B, 
                0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9, 
                0x42, 0x45, 
                0x01, 
                0x02, 

                0xB7, 0xA0, 0xC9, 0xA7, 0x9D, 0x4C, 0x72, 0x4C, 
                0x83, 0xBB, 0x53, 0xA3, 0x45, 0x91, 0x71, 0xDF, 
                0x42, 0x46, 
                0x01, 
                0x02, 

                0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48, 
                0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82, 
                0x42, 0x47, 
                0x01, 
                0x02, 

                0xA7, 0xB1, 0x85, 0xDB, 0x9A, 0x06, 0xBB, 0x4A, 
                0xA2, 0xB5, 0xD1, 0x86, 0xA2, 0x1B, 0x80, 0xF1, 
                0x81, 0x00, 
                0x01, 
                0x08, 

                0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45, 
                0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D, 
                0x82, 0x00, 
                0x01, 
                0x08
            })
            Method (WQAA, 1, NotSerialized)
            {
                AAF1 ()
                Store (AADS, BUFF)
                Return (BUFF)
            }

            Method (WMBA, 3, NotSerialized)
            {
                While (One)
                {
                    Name (_T_0, 0x00)
                    Store (Arg1, _T_0)
                    If (LNotEqual (Match (Package (0x08)
                                    {
                                        0x01, 
                                        0x02, 
                                        0x03, 
                                        0x08, 
                                        0x09, 
                                        0x0A, 
                                        0x0C, 
                                        0x0D
                                    }, MEQ, _T_0, MTR, 0x00, 0x00), Ones))
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        If (LNotEqual (Match (Package (0x05)
                                        {
                                            0x04, 
                                            0x05, 
                                            0x06, 
                                            0x07, 
                                            0x0B
                                        }, MEQ, _T_0, MTR, 0x00, 0x00), Ones))
                        {
                            If (LEqual (Arg1, 0x07))
                            {
                                Store (Arg2, BUFF)
                                If (BF00)
                                {
                                    Store (0x01, BAEF)
                                }
                            }

                            Store (0x01, Local0)
                        }
                    }

                    Break
                }

                If (Local0)
                {
                    Z003 (Arg1, Arg2)
                }
                Else
                {
                    Z002 (Arg1)
                }

                Store (DerefOf (Index (BADG, Subtract (Arg1, 0x01))), BUFF)
                Return (BUFF)
            }

            Method (_WED, 1, NotSerialized)
            {
                If (LGreaterEqual (Arg0, 0x80))
                {
                    If (LLess (Arg0, 0x83))
                    {
                        Return (Z004 ())
                    }
                }
            }

            Method (WMBB, 3, NotSerialized)
            {
                Z005 (Arg1, Arg2)
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
                Z006 (Arg1, Arg2)
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
                    Z007 (WIT0)
                    Return (DSY0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (Arg2, Local0)
                    Z008 (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (Arg2, Local0)
                    Z009 (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x04))
                {
                    Z00A (Arg1, Arg2)
                    ShiftRight (DerefOf (Index (BCDS, Add (Arg1, 0x05))), 0x10, 
                        BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x05))
                {
                    Z00A (Arg1, Arg2)
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x06))
                {
                    Z00B ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x07))
                {
                    Z00C ()
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
                    Z00D (Local0)
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
                    Z00E (Local1)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x0A))
                {
                    Z00F ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x02))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x0B))
                {
                    PCID (Arg2)
                    Return (DSY6)
                }
            }

            Method (WMBE, 3, NotSerialized)
            {
                Z00G (Arg1, Arg2)
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

                If (Z00H ())
                {
                    Store (Arg2, BUFF)
                    If (LEqual (Arg1, 0x01))
                    {
                        Z00I (BF00)
                    }
                    Else
                    {
                        If (LEqual (Arg1, 0x02))
                        {
                            Z00J (BF00)
                        }
                        Else
                        {
                            If (LEqual (Arg1, 0x03))
                            {
                                Z00K (BF00)
                            }
                            Else
                            {
                                Z00L (BF00)
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
                Z00M (BF00)
                Store (DerefOf (Index (BGDS, Subtract (Arg1, 0x01))), BUFF)
                Store (BUFF, Debug)
                Return (BUFF)
            }
        }

        OperationRegion (SMI2, SystemMemory, 0x2FF65E9B, 0x00000090)
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
            Acquire (\_SB.PSMX, 0xFFFF)
            Store (0xE0, WCMD)
            Store (0x57, TPID)
            Store (Arg0, WDID)
            Store (Arg1, DI00)
            Store (Zero, \_SB.SMIC)
            Store (DI00, Local0)
            Release (\_SB.PSMX)
            Return (Local0)
        }

        Device (PCI0)
        {
            Name (_ADR, 0x00)
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, 0x030AD041)
            Name (_UID, 0x01)
            Method (_S3D, 0, NotSerialized)
            {
                Return (0x01)
            }

            Method (_INI, 0, NotSerialized)
            {
                Store (0xF1, DBUG)
                \_SB.OSTP ()
                \_GPE._L14 ()
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Scope (\_SB)
            {
                OperationRegion (ASLD, SystemMemory, 0x2FF65869, 0x00000100)
                Field (ASLD, AnyAcc, NoLock, Preserve)
                {
                    TOM,    32
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
                        0xFED40000,         // Range Minimum
                        0xFED44FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00005000,         // Length
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

            Name (_PRT, Package (0x0B)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    \_SB.PCI0.LSMB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x01, 
                    \_SB.PCI0.LPMU, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x00, 
                    \_SB.PCI0.LUS0, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x01, 
                    \_SB.PCI0.LUS2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x00, 
                    \_SB.PCI0.Z00N, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x01, 
                    \_SB.PCI0.Z00O, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x00, 
                    \_SB.PCI0.LMAC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x00, 
                    \_SB.PCI0.LAZA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x00, 
                    \_SB.PCI0.LPID, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x00, 
                    \_SB.PCI0.LSI0, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    0x00, 
                    \_SB.PCI0.LGPU, 
                    0x00
                }
            })
            Name (_PRW, Package (0x02)
            {
                0x00, 
                0x05
            })
            Name (SUPP, 0x00)
            Name (CTRL, 0x00)
            Method (_OSC, 4, NotSerialized)
            {
                CreateDWordField (Arg3, 0x00, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */    0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40, 
                            /* 0008 */    0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                        }))
                {
                    Store (CDW2, SUPP)
                    Store (CDW3, CTRL)
                    And (CTRL, 0x0C, CTRL)
                    If (LNotEqual (Arg1, 0x01))
                    {
                        Or (CDW1, 0x0A, CDW1)
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1)
                    }

                    Store (CTRL, CDW3)
                }
                Else
                {
                    Or (CDW1, 0x06, CDW1)
                }

                Return (Arg3)
            }

            Device (SMB0)
            {
                Name (_ADR, 0x00010001)
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

                OperationRegion (SM6C, PCI_Config, 0x6C, 0x04)
                Field (SM6C, AnyAcc, NoLock, Preserve)
                {
                    WDTA,   32
                }

                OperationRegion (SM80, PCI_Config, 0x80, 0x04)
                Field (SM80, AnyAcc, NoLock, Preserve)
                {
                    NVAM,   32
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
            }

            Device (USB0)
            {
                Name (_ADR, 0x00020000)
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
                Name (_ADR, 0x00020001)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (Z001)
            {
                Name (_ADR, 0x00040000)
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
                    0x18, 
                    0x03
                })
            }

            Device (Z000)
            {
                Name (_ADR, 0x00040001)
                Name (_PRW, Package (0x02)
                {
                    0x17, 
                    0x03
                })
            }

            Device (MAC0)
            {
                Name (_ADR, 0x000A0000)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x05
                })
            }

            Device (AZA0)
            {
                Name (_ADR, 0x00070000)
                Name (_PRW, Package (0x02)
                {
                    0x15, 
                    0x03
                })
            }

            Device (WMI0)
            {
                Name (_HID, "*pnp0c14")
                Name (_UID, "NVIF")
                Name (_WDG, Buffer (0x3C)
                {
                    /* 0000 */    0xF2, 0x9A, 0x79, 0xA1, 0x29, 0x94, 0x29, 0x45, 
                    /* 0008 */    0x92, 0x7E, 0xDF, 0xE1, 0x37, 0x36, 0xEE, 0xBA, 
                    /* 0010 */    0x4E, 0x56, 0x01, 0x02, 0xCA, 0x9A, 0x79, 0xA1, 
                    /* 0018 */    0x29, 0x94, 0x29, 0x45, 0x92, 0x7E, 0xDF, 0xE1, 
                    /* 0020 */    0x37, 0x36, 0xEE, 0xBA, 0xCA, 0x00, 0x00, 0x08, 
                    /* 0028 */    0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11, 
                    /* 0030 */    0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 
                    /* 0038 */    0x42, 0x41, 0x01, 0x00
                })
                Method (WMNV, 3, NotSerialized)
                {
                    Store ("WMNV: ", Debug)
                    If (LGreaterEqual (SizeOf (Arg2), 0x08))
                    {
                        CreateDWordField (Arg2, 0x00, FUNC)
                        CreateDWordField (Arg2, 0x04, SUBF)
                        If (LGreater (SizeOf (Arg2), 0x08))
                        {
                            Subtract (SizeOf (Arg2), 0x08, Local2)
                            ShiftLeft (Local2, 0x03, Local2)
                        }

                        CreateField (Arg2, 0x40, Local2, ARGS)
                        Store (FUNC, Debug)
                        Store (SUBF, Debug)
                        Store (ARGS, Debug)
                        Return (\_SB.PCI0.IGPU.NVIF (FUNC, SUBF, ARGS))
                    }
                }

                Name (WQBA, Buffer (0x025D)
                {
                    /* 0000 */    0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x4D, 0x02, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 
                    /* 0010 */    0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54, 
                    /* 0018 */    0x18, 0xCF, 0x83, 0x00, 0x01, 0x06, 0x18, 0x42, 
                    /* 0020 */    0x10, 0x05, 0x10, 0x8A, 0xE6, 0x80, 0x42, 0x04, 
                    /* 0028 */    0x92, 0x43, 0xA4, 0x30, 0x30, 0x28, 0x0B, 0x20, 
                    /* 0030 */    0x86, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x04, 0x84, 
                    /* 0038 */    0xBC, 0x0A, 0xB0, 0x29, 0xC0, 0x24, 0x88, 0xFA, 
                    /* 0040 */    0xF7, 0x87, 0x28, 0x09, 0x0E, 0x25, 0x04, 0x42, 
                    /* 0048 */    0x12, 0x05, 0x98, 0x17, 0xA0, 0x5B, 0x80, 0x61, 
                    /* 0050 */    0x01, 0xB6, 0x05, 0x98, 0x16, 0xE0, 0x18, 0x92, 
                    /* 0058 */    0x4A, 0x03, 0xA7, 0x04, 0x96, 0x02, 0x21, 0xA1, 
                    /* 0060 */    0x02, 0x94, 0x0B, 0xF0, 0x2D, 0x40, 0x3B, 0xA2, 
                    /* 0068 */    0x24, 0x0B, 0xB0, 0x0C, 0x23, 0x02, 0x8F, 0x82, 
                    /* 0070 */    0xA1, 0x71, 0x68, 0xEC, 0x30, 0x2C, 0x13, 0x4C, 
                    /* 0078 */    0x83, 0x38, 0x8C, 0xB2, 0x91, 0x45, 0x60, 0xDC, 
                    /* 0080 */    0x4E, 0x05, 0xC8, 0x15, 0x20, 0x4C, 0x80, 0x78, 
                    /* 0088 */    0x54, 0x61, 0x34, 0x07, 0x45, 0xE0, 0x42, 0x63, 
                    /* 0090 */    0x64, 0x40, 0xC8, 0xA3, 0x00, 0xAB, 0xA3, 0xD0, 
                    /* 0098 */    0xA4, 0x12, 0xD8, 0xBD, 0x00, 0x83, 0x02, 0x8C, 
                    /* 00A0 */    0x09, 0xF0, 0x86, 0x2A, 0x84, 0x28, 0x35, 0x0A, 
                    /* 00A8 */    0x50, 0x26, 0xC0, 0x16, 0x8A, 0xE0, 0x83, 0xC4, 
                    /* 00B0 */    0x88, 0x12, 0xA4, 0x35, 0x14, 0x0A, 0x11, 0x24, 
                    /* 00B8 */    0x66, 0x8B, 0x28, 0x02, 0x8F, 0x19, 0x24, 0x74, 
                    /* 00C0 */    0x67, 0x40, 0x82, 0xA8, 0x0D, 0x46, 0x08, 0x15, 
                    /* 00C8 */    0xC2, 0xCB, 0xFE, 0x20, 0x88, 0xFC, 0xD5, 0x6B, 
                    /* 00D0 */    0xDC, 0x8E, 0x34, 0x1A, 0xD4, 0x58, 0x13, 0x1C, 
                    /* 00D8 */    0xBB, 0x47, 0x73, 0xC2, 0x9D, 0x0B, 0x90, 0x3E, 
                    /* 00E0 */    0x37, 0x81, 0x1C, 0xDD, 0xC1, 0xD5, 0x39, 0x68, 
                    /* 00E8 */    0x32, 0x3C, 0x86, 0x95, 0xE0, 0x3F, 0xC0, 0xA7, 
                    /* 00F0 */    0x00, 0xBC, 0x6B, 0x40, 0x4D, 0xFF, 0xE0, 0x99, 
                    /* 00F8 */    0x20, 0x38, 0xD4, 0x10, 0x3D, 0xEA, 0x70, 0x27, 
                    /* 0100 */    0x70, 0xEC, 0x47, 0xC2, 0x20, 0x0E, 0xF6, 0xB8, 
                    /* 0108 */    0xB1, 0x0E, 0x27, 0xA3, 0x41, 0x97, 0x2A, 0xC0, 
                    /* 0110 */    0xEC, 0x01, 0x40, 0x23, 0x4B, 0x70, 0xDA, 0x67, 
                    /* 0118 */    0x12, 0xFA, 0x3D, 0xE0, 0x7C, 0x7A, 0x1E, 0x1B, 
                    /* 0120 */    0x1B, 0x04, 0x6A, 0x64, 0xFE, 0xFF, 0x43, 0x7B, 
                    /* 0128 */    0x88, 0xA7, 0x15, 0x33, 0xE4, 0xB3, 0xC0, 0x61, 
                    /* 0130 */    0x31, 0xB1, 0x47, 0x06, 0x3A, 0x1E, 0xF0, 0x4F, 
                    /* 0138 */    0xFC, 0xD1, 0x20, 0xC2, 0x9B, 0x81, 0xE7, 0x6B, 
                    /* 0140 */    0x82, 0x41, 0x21, 0xE4, 0x64, 0x3C, 0x28, 0x31, 
                    /* 0148 */    0x20, 0x1A, 0x74, 0xAD, 0xD8, 0xBA, 0x07, 0x04, 
                    /* 0150 */    0x8F, 0x79, 0x44, 0x45, 0x03, 0x6B, 0x20, 0xEC, 
                    /* 0158 */    0x0C, 0xE0, 0x71, 0x5B, 0x16, 0x08, 0x25, 0x30, 
                    /* 0160 */    0xB0, 0xCF, 0x0D, 0xEF, 0x10, 0xC6, 0xC5, 0xE1, 
                    /* 0168 */    0x47, 0xF6, 0xF9, 0xC2, 0x02, 0x07, 0x85, 0x82, 
                    /* 0170 */    0xF5, 0xED, 0x20, 0xE6, 0xF3, 0xC0, 0x71, 0x1E, 
                    /* 0178 */    0xB0, 0x85, 0x4F, 0x94, 0x00, 0x1F, 0x92, 0x47, 
                    /* 0180 */    0x03, 0x6F, 0x90, 0xF0, 0xAD, 0x1F, 0x01, 0x08, 
                    /* 0188 */    0xF2, 0x0B, 0xC3, 0x63, 0x43, 0x02, 0xCB, 0x03, 
                    /* 0190 */    0x46, 0x8F, 0xD2, 0x7E, 0x05, 0x20, 0x04, 0x7F, 
                    /* 0198 */    0xB1, 0x78, 0x0A, 0x78, 0x1D, 0x88, 0x70, 0x2C, 
                    /* 01A0 */    0x30, 0x45, 0x8E, 0x0D, 0x0D, 0xCF, 0x81, 0xA3, 
                    /* 01A8 */    0x87, 0x3D, 0x97, 0xF0, 0x47, 0x13, 0xE5, 0x14, 
                    /* 01B0 */    0x0E, 0xC7, 0x47, 0x0E, 0x23, 0xC4, 0x7F, 0xD2, 
                    /* 01B8 */    0x78, 0xF2, 0xB0, 0xE6, 0x3B, 0x80, 0xA6, 0xF4, 
                    /* 01C0 */    0x16, 0xF0, 0xFE, 0xE0, 0x11, 0x60, 0xA2, 0x1F, 
                    /* 01C8 */    0x4D, 0x50, 0x61, 0x4F, 0x27, 0xA0, 0xFA, 0xFF, 
                    /* 01D0 */    0x9F, 0x4E, 0x00, 0x6B, 0xC3, 0x0E, 0xF1, 0x74, 
                    /* 01D8 */    0x02, 0xF6, 0x78, 0x0F, 0x0D, 0x69, 0x38, 0x9D, 
                    /* 01E0 */    0x00, 0x14, 0xF8, 0xFF, 0x9F, 0x4E, 0xE0, 0xC7, 
                    /* 01E8 */    0x3C, 0x9D, 0x40, 0x05, 0x3E, 0x1F, 0x5F, 0x3A, 
                    /* 01F0 */    0x7C, 0x28, 0x30, 0xC1, 0x40, 0xE3, 0xA6, 0xA2, 
                    /* 01F8 */    0x4E, 0x27, 0xA8, 0xC3, 0x83, 0x4F, 0x27, 0xEC, 
                    /* 0200 */    0x50, 0x70, 0x12, 0x4F, 0x01, 0x3E, 0x9C, 0x80, 
                    /* 0208 */    0x79, 0x30, 0xF8, 0xC3, 0x09, 0x70, 0x1B, 0x0B, 
                    /* 0210 */    0xFE, 0x70, 0x02, 0x3C, 0xEE, 0x18, 0x1E, 0x02, 
                    /* 0218 */    0x3F, 0x41, 0x78, 0x08, 0x7C, 0x00, 0xCF, 0x1A, 
                    /* 0220 */    0x67, 0x67, 0xA5, 0x73, 0x42, 0x1E, 0x43, 0xF8, 
                    /* 0228 */    0x9C, 0x30, 0xA7, 0x15, 0x9C, 0x42, 0x9B, 0x3E, 
                    /* 0230 */    0x35, 0x1A, 0xB5, 0x6A, 0x50, 0xA6, 0x46, 0x99, 
                    /* 0238 */    0x06, 0xB5, 0xFA, 0x54, 0x6A, 0xCC, 0xD8, 0x21, 
                    /* 0240 */    0xC3, 0x01, 0x9F, 0x01, 0x3A, 0x0F, 0x58, 0xDE, 
                    /* 0248 */    0x9B, 0x41, 0x20, 0x96, 0x41, 0x21, 0x10, 0x4B, 
                    /* 0250 */    0x7F, 0xB2, 0x08, 0xC4, 0xC1, 0x41, 0x68, 0x3C, 
                    /* 0258 */    0x5A, 0x81, 0xF8, 0xFF, 0x0F
                })
            }

            Device (WMI1)
            {
                Name (_HID, "*pnp0c14")
                Name (_UID, "MXM2")
                Name (_WDG, Buffer (0x3C)
                {
                    /* 0000 */    0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xBD, 0x4E, 
                    /* 0008 */    0x77, 0xB5, 0xC0, 0x2C, 0x2A, 0xA3, 0x1E, 0x93, 
                    /* 0010 */    0x4D, 0x58, 0x01, 0x02, 0x57, 0x93, 0x8A, 0xF2, 
                    /* 0018 */    0x4B, 0xCF, 0x1A, 0x4A, 0x93, 0x88, 0xAF, 0xA1, 
                    /* 0020 */    0xEE, 0x58, 0x1F, 0xBB, 0xD1, 0x00, 0x01, 0x08, 
                    /* 0028 */    0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11, 
                    /* 0030 */    0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 
                    /* 0038 */    0x42, 0x41, 0x01, 0x00
                })
            }

            Device (IGPU)
            {
                Name (_ADR, 0x00120000)
                Scope (\_SB.PCI0)
                {
                    OperationRegion (HDCP, SystemMemory, 0x2FF65969, 0x00000532)
                    Field (HDCP, AnyAcc, NoLock, Preserve)
                    {
                        SIGN,   48, 
                        CHKS,   8, 
                        RESR,   8, 
                        GLOB,   10560
                    }

                    Device (K802)
                    {
                        Name (_ADR, 0x00180002)
                        OperationRegion (HMM2, PCI_Config, 0x90, 0x04)
                        Field (HMM2, ByteAcc, NoLock, Preserve)
                        {
                            ME90,   11, 
                            MEMW,   1
                        }
                    }

                    Device (K803)
                    {
                        Name (_ADR, 0x00180003)
                        OperationRegion (HMM3, PCI_Config, 0x80, 0x04)
                        Field (HMM3, ByteAcc, NoLock, Preserve)
                        {
                            PMM0,   8, 
                            PM1A,   4, 
                            PM1C,   3
                        }
                    }
                }

                Name (ERR0, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                Name (ERR1, Buffer (0x04)
                {
                    0x01, 0x00, 0x00, 0x80
                })
                Name (VER1, Buffer (0x04)
                {
                    0x01, 0x00, 0x00, 0x00
                })
                Method (NVIF, 3, NotSerialized)
                {
                    Store (ERR1, Local0)
                    If (LEqual (Arg0, 0x01))
                    {
                        Concatenate (ERR0, VER1, Local0)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x0D))
                        {
                            CreateDWordField (Arg2, 0x00, RWBD)
                            If (LEqual (Arg1, 0x00))
                            {
                                Store (ERR0, Local0)
                            }
                            Else
                            {
                                If (LEqual (Arg1, 0x01))
                                {
                                    Name (BFD0, Buffer (0x08)
                                    {
                                        0x00
                                    })
                                    CreateField (BFD0, 0x00, 0x0B, TAVN)
                                    CreateField (BFD0, 0x0B, 0x0A, BASL)
                                    CreateField (BFD0, 0x15, 0x0B, LBWF)
                                    CreateField (BFD0, 0x20, 0x0C, ATBW)
                                    CreateField (BFD0, 0x2C, 0x0A, CLTF)
                                    CreateField (BFD0, 0x36, 0x0A, PMPF)
                                    Store (0x10, Local2)
                                    Store (0x0258, Local3)
                                    If (\_SB.PCI0.K802.MEMW)
                                    {
                                        Store (0x0320, Local3)
                                        If (LLess (RWBD, 0xFF))
                                        {
                                            Store (0x0258, Local3)
                                        }
                                    }
                                    Else
                                    {
                                        If (LGreater (RWBD, 0x02E2))
                                        {
                                            Store (0x0320, Local3)
                                        }
                                    }

                                    Multiply (0x0DAC, Local2, Local2)
                                    Multiply (Local2, Local3, Local2)
                                    Divide (Local2, 0x00027100, Local2, Local3)
                                    Store (Local3, ATBW)
                                    Store (Local3, LBWF)
                                    Store (\_SB.PCI0.K803.PM1C, Local2)
                                    If (LGreaterEqual (Local2, 0x04))
                                    {
                                        Store (0x12AC, Local3)
                                    }
                                    Else
                                    {
                                        If (LEqual (Local2, 0x03))
                                        {
                                            Store (0x0E2E, Local3)
                                        }
                                        Else
                                        {
                                            If (LEqual (Local2, 0x02))
                                            {
                                                Store (0x0C62, Local3)
                                            }
                                            Else
                                            {
                                                If (LEqual (Local2, 0x01))
                                                {
                                                    Store (0x0B5E, Local3)
                                                }
                                                Else
                                                {
                                                    Store (0x0B2C, Local3)
                                                }
                                            }
                                        }
                                    }

                                    Add (Local3, 0x01C2, Local3)
                                    Add (Local3, 0x1388, Local3)
                                    Divide (Local3, 0x64, Local2, BASL)
                                    Add (Local3, 0x61A8, Local3)
                                    Divide (Local3, 0x64, Local2, TAVN)
                                    Multiply (0x0F, 0x03E8, Local2)
                                    Divide (Local2, 0xA0, Local2, PMPF)
                                    If (\_SB.PCI0.K802.MEMW)
                                    {
                                        Divide (0x07D0, 0xA0, Local2, CLTF)
                                    }
                                    Else
                                    {
                                        Divide (0x0FA0, 0xA0, Local2, CLTF)
                                    }

                                    Concatenate (ERR0, BFD0, Local0)
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x0C))
                            {
                                If (LEqual (Arg1, 0x00))
                                {
                                    Store (ERR0, Local0)
                                }
                                Else
                                {
                                    If (LEqual (Arg1, 0x01))
                                    {
                                        Store (GLOB, Local1)
                                        Concatenate (ERR0, Local1, Local0)
                                    }
                                }
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x09))
                                {
                                    If (LEqual (Arg1, 0x00))
                                    {
                                        Store (ERR0, Local0)
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg1, 0x01))
                                        {
                                            Store (Buffer (0x0C)
                                                {
                                                    /* 0000 */    0x00, 0x00, 0x64, 0x00, 0xDD, 0x00, 0x00, 0x00, 
                                                    /* 0008 */    0x00, 0x00, 0xE8, 0x02
                                                }, Local1)
                                            Concatenate (ERR0, Local1, Local0)
                                        }
                                        Else
                                        {
                                            If (LEqual (Arg1, 0x02))
                                            {
                                                CreateDWordField (Arg2, 0x00, RWBC)
                                                Divide (RWBC, 0x0A, Local2, Local1)
                                                Decrement (Local1)
                                                Store (Local1, \_SB.PCI0.LPC0.EC0.BRTS)
                                                Store (ERR0, Local0)
                                            }
                                            Else
                                            {
                                                If (LEqual (Arg1, 0x03))
                                                {
                                                    Name (BCL0, Buffer (0x0C)
                                                    {
                                                        /* 0000 */    0x64, 0x32, 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 
                                                        /* 0008 */    0x46, 0x50, 0x5A, 0x64
                                                    })
                                                    Concatenate (ERR0, BCL0, Local0)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Return (Local0)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Return (Package (0x03)
                    {
                        0x0118, 
                        0x80000100, 
                        0x80000210
                    })
                }

                Device (CRT0)
                {
                    Name (_ADR, 0x80000100)
                }

                Device (LCD0)
                {
                    Name (_ADR, 0x0118)
                }

                Device (HDV0)
                {
                    Name (_ADR, 0x80000210)
                }
            }

            Device (P2P0)
            {
                Name (_ADR, 0x00080000)
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

                Name (_PRT, Package (0x02)
                {
                    Package (0x04)
                    {
                        0x0004FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0004FFFF, 
                        0x01, 
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

            Device (XVR0)
            {
                Name (_ADR, 0x000B0000)
                Name (_UID, 0x10)
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
                Device (Z00P)
                {
                    Name (_ADR, 0x00)
                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200
                        })
                    }

                    Device (CRT0)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0100)
                        }
                    }

                    Device (LCD0)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0110)
                        }

                        Method (_BCL, 0, NotSerialized)
                        {
                            Store (0xC0, DBUG)
                            Return (Package (0x0C)
                            {
                                0x64, 
                                0x32, 
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
                        }

                        Method (_BCM, 1, NotSerialized)
                        {
                            Store (0xC1, DBUG)
                            Divide (Arg0, 0x0A, Local0, Local1)
                            Decrement (Local1)
                            Store (Local1, \_SB.PCI0.LPC0.EC0.BRTS)
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            Store (0xC2, DBUG)
                            Multiply (\_SB.PCI0.LPC0.EC0.BRTS, 0x0A, Local0)
                            Increment (Local0)
                            Return (Local0)
                        }
                    }

                    Device (TV0)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0200)
                        }
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x00, 
                    0x05
                })
            }

            Device (XVR1)
            {
                Name (_ADR, 0x000C0000)
                Name (_UID, 0x11)
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
                Device (Z00Q)
                {
                    Name (_ADR, 0x00)
                    Method (_EJ0, 0, NotSerialized)
                    {
                        Return (0x01)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x00, 
                    0x05
                })
            }

            Device (XVR2)
            {
                Name (_ADR, 0x000D0000)
                Name (_UID, 0x12)
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
                        \_SB.PCI0.LK4E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }
                })
                Device (Z00R)
                {
                    Name (_ADR, 0x00)
                }

                Name (_PRW, Package (0x02)
                {
                    0x00, 
                    0x05
                })
            }

            Device (XVR3)
            {
                Name (_ADR, 0x000E0000)
                Name (_UID, 0x13)
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
                        \_SB.PCI0.LK3E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK4E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }
                })
                Device (Z00S)
                {
                    Name (_ADR, 0x00)
                }

                Name (_PRW, Package (0x02)
                {
                    0x00, 
                    0x05
                })
            }

            Device (XVR4)
            {
                Name (_ADR, 0x000F0000)
                Name (_UID, 0x14)
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
                Device (Z00T)
                {
                    Name (_ADR, 0x00)
                }

                Name (_PRW, Package (0x02)
                {
                    0x00, 
                    0x05
                })
            }

            Device (XVR5)
            {
                Name (_ADR, 0x00100000)
                Name (_UID, 0x15)
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
                Device (Z00U)
                {
                    Name (_ADR, 0x00)
                }

                Name (_PRW, Package (0x02)
                {
                    0x00, 
                    0x05
                })
            }

            Device (XVR6)
            {
                Name (_ADR, 0x00110000)
                Name (_UID, 0x16)
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
                        \_SB.PCI0.LK4E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }
                })
                Device (Z00V)
                {
                    Name (_ADR, 0x00)
                }

                Name (_PRW, Package (0x02)
                {
                    0x00, 
                    0x05
                })
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
                Name (_ADR, 0x00060000)
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
            }

            Device (SAT0)
            {
                Name (_ADR, 0x00090000)
                Device (PRI0)
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

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
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
                        /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x1F, 0x00, 0x00, 0x00
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

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
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
            }

            Device (R394)
            {
                Name (_ADR, 0x00040000)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00010000)
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
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
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
                    Name (PTB0, ResourceTemplate ()
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
                    Name (PTB1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (And (\_SB.PCI0.LPC0.MTSE, 0x04))
                        {
                            Return (PTB1)
                        }
                        Else
                        {
                            Return (PTB0)
                        }
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
                    Name (RCB0, ResourceTemplate ()
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
                    Name (RCB1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (And (\_SB.PCI0.LPC0.MTSE, 0x04))
                        {
                            Return (RCB1)
                        }
                        Else
                        {
                            Return (RCB0)
                        }
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

                Method (ECOK, 0, NotSerialized)
                {
                    If (LEqual (\_SB.PCI0.LPC0.EC0.Z00W, 0x01))
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
                    Name (Z00W, Zero)
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
                            Store (Arg1, Z00W)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                        SCAP,   8, 
                        BTPV,   8, 
                        THFN,   8, 
                        BDME,   16, 
                        BDFC,   16, 
                        MLED,   1, 
                        SCHG,   1, 
                        SCCF,   1, 
                        SCPF,   1, 
                        ACIS,   1, 
                                Offset (0x08), 
                                Offset (0x0E), 
                        S4FG,   8, 
                        LIDS,   1, 
                        OSIF,   1, 
                                Offset (0x10), 
                                Offset (0x60), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMDR,   32, 
                        BCNT,   8, 
                        SMAA,   8, 
                        SMD0,   8, 
                        SMD1,   8, 
                                Offset (0x90), 
                                Offset (0x91), 
                                Offset (0x92), 
                                Offset (0x93), 
                                Offset (0x94), 
                        EXNI,   8, 
                        EXNB,   8, 
                        EXND,   8, 
                                Offset (0x98), 
                                Offset (0x99), 
                                Offset (0x9A), 
                        BAL1,   1, 
                        BAL2,   1, 
                        BAL3,   1, 
                        BAL4,   1, 
                        BCL1,   1, 
                        BCL2,   1, 
                        BCL3,   1, 
                        BCL4,   1, 
                        BPU1,   1, 
                        BPU2,   1, 
                        BPU3,   1, 
                        BPU4,   1, 
                        BOS1,   1, 
                        BOS2,   1, 
                        BOS3,   1, 
                        BOS4,   1, 
                        PHDD,   1, 
                        IFDD,   1, 
                        IODD,   1, 
                        SHDD,   1, 
                        LS20,   1, 
                        EFDD,   1, 
                        ECRT,   1, 
                                Offset (0x9D), 
                        SBTN,   1, 
                        VIDO,   1, 
                        VOLD,   1, 
                        VOLU,   1, 
                        MUTE,   1, 
                        CONT,   1, 
                        BRGT,   1, 
                        HBTN,   1, 
                        S4SE,   1, 
                        SKEY,   1, 
                        BKEY,   1, 
                        TKEY,   1, 
                        FKEY,   1, 
                        DVDM,   1, 
                        DIGM,   1, 
                        CDLK,   1, 
                            ,   1, 
                        LIDO,   1, 
                        PMEE,   1, 
                        PBET,   1, 
                        RIIN,   1, 
                        BTWK,   1, 
                        DKIN,   1, 
                                Offset (0xA0), 
                            ,   6, 
                        SWTH,   1, 
                        HWTH,   1, 
                        DKT0,   1, 
                        DKT1,   1, 
                            ,   2, 
                        OSUD,   1, 
                        OSDK,   1, 
                        OSSU,   1, 
                        DKCG,   1, 
                        ODTS,   8, 
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
                        RWAK,   1, 
                            ,   2, 
                        KWAK,   1, 
                        MSWK,   1, 
                        CCAC,   1, 
                        AOAC,   1, 
                        BLAC,   1, 
                        PSRC,   1, 
                        BOAC,   1, 
                        LCAC,   1, 
                        AAAC,   1, 
                        ACAC,   1, 
                        PCEC,   8, 
                        THON,   8, 
                        THSD,   8, 
                        THEM,   8, 
                        TCON,   8, 
                        THRS,   8, 
                        THSE,   8, 
                        FSSN,   4, 
                        FANU,   4, 
                        PTVL,   3, 
                            ,   3, 
                        TTSR,   1, 
                        TTHR,   1, 
                        TSTH,   1, 
                        TSBC,   1, 
                        TSBF,   1, 
                        TSPL,   1, 
                        TSBT,   1, 
                            ,   2, 
                        THTA,   1, 
                        CTMP,   8, 
                        LTMP,   8, 
                        SKTA,   8, 
                        THSV,   8, 
                        THVA,   8, 
                        CDTS,   8, 
                        NBTP,   8, 
                            ,   1, 
                        LCDS,   1, 
                                Offset (0xB8), 
                                Offset (0xB9), 
                        BRTS,   8, 
                        CTRS,   8, 
                        WLAT,   1, 
                        BTAT,   1, 
                        WLEX,   1, 
                        BTEX,   1, 
                        KLSW,   1, 
                        WLOK,   1, 
                                Offset (0xBC), 
                        PJID,   8, 
                        CPUN,   8, 
                                Offset (0xC0), 
                        BTYP,   8, 
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
                        BTW0,   8, 
                        BATV,   8, 
                        BPTC,   8, 
                        BTTC,   8, 
                        BTMA,   16, 
                        BTSC,   8, 
                        BCIX,   8, 
                        CCBA,   8, 
                        CBOT,   8, 
                        BTSS,   16, 
                        OVCC,   8, 
                        CCFC,   8, 
                        BADC,   8, 
                        BSC1,   16, 
                        BSC2,   16, 
                        BSC3,   16, 
                        BSC4,   16, 
                                Offset (0xED), 
                                Offset (0xEE), 
                                Offset (0xEF), 
                                Offset (0xF0), 
                        BTS1,   8, 
                        BTS2,   8, 
                        BSCS,   16, 
                        BDAD,   16, 
                        BACV,   16
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

                    Method (_Q11, 0, NotSerialized)
                    {
                        If (LEqual (OSYS, 0x40))
                        {
                            Store (0x87, DBUG)
                            If (UMAS)
                            {
                                Notify (\_SB.PCI0.IGPU.LCD0, 0x87)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.XVR0.Z00P.LCD0, 0x87)
                            }

                            If (LEqual (\_SB.WMID.BAEF, 0x01))
                            {
                                Store (\_SB.PCI0.LPC0.EC0.BRTS, Local1)
                                Store (\_SB.WMID.LBL0, Local2)
                                Add (Local2, Local1, Local2)
                                Store (Local2, \_SB.WMID.NTDC)
                                Notify (\_SB.WMID, 0x80)
                            }
                        }
                        Else
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
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        If (LEqual (OSYS, 0x40))
                        {
                            Store (0x86, DBUG)
                            If (UMAS)
                            {
                                Notify (\_SB.PCI0.IGPU.LCD0, 0x86)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.XVR0.Z00P.LCD0, 0x86)
                            }

                            If (LEqual (\_SB.WMID.BAEF, 0x01))
                            {
                                Store (\_SB.PCI0.LPC0.EC0.BRTS, Local1)
                                Store (\_SB.WMID.LBL0, Local2)
                                Add (Local2, Local1, Local2)
                                Store (Local2, \_SB.WMID.NTDC)
                                Notify (\_SB.WMID, 0x80)
                            }
                        }
                        Else
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
                    }

                    Method (_Q15, 0, NotSerialized)
                    {
                        Store (0x15, DBUG)
                        Notify (\_SB.LID, 0x80)
                    }

                    Method (_Q16, 0, NotSerialized)
                    {
                        Store (0x16, DBUG)
                        Notify (\_SB.LID, 0x80)
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
                        Store (0x25, DBUG)
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
                        Store (0x37, DBUG)
                        Notify (\_SB.PCI0.LPC0.ACAD, 0x80)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q38, 0, NotSerialized)
                    {
                        Store (0x38, DBUG)
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

                    Method (_Q50, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, One))
                        {
                            Store (0x00, Local1)
                            If (LEqual (\_SB.PCI0.LPC0.EC0.LCDS, 0x01))
                            {
                                Store (0x01, Local1)
                            }

                            Store (\_SB.WMID.LDOF, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, \_SB.WMID.NTDC)
                            Notify (WMID, 0x80)
                        }
                    }

                    OperationRegion (CCLK, SystemIO, 0x1010, 0x04)
                    Field (CCLK, DWordAcc, NoLock, Preserve)
                    {
                            ,   9, 
                        DUTY,   3, 
                        THEN,   1, 
                                Offset (0x02)
                    }

                    OperationRegion (ECRM, EmbeddedControl, 0x00, 0xFF)
                    Field (ECRM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x94), 
                        ERIB,   16, 
                        ERBD,   8
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
                            If (\_SB.PCI0.LPC0.EC0.BAL1)
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

                Device (MIR)
                {
                    Name (_HID, EisaId ("ENE0100"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (OSYS, 0x40))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0xE02C,             // Range Minimum
                                0xE02C,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                        })
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0xE02C,             // Range Minimum
                            0xE02C,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {4}
                    })
                }

                OperationRegion (P44, PCI_Config, 0x44, 0x04)
                Field (P44, AnyAcc, NoLock, Preserve)
                {
                    MTBA,   32
                }

                OperationRegion (MMTO, PCI_Config, 0x74, 0x04)
                Field (MMTO, DWordAcc, NoLock, Preserve)
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
                }

                Name (TPBU, Buffer (0x01)
                {
                    0x00
                })
                CreateByteField (TPBU, 0x00, TPTD)
                Device (MSE0)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        And (TPTP, 0x07, TPTD)
                        If (LEqual (TPTD, 0x01))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            If (LEqual (TPTD, 0x02))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                If (LEqual (TPTD, 0x04))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0F)
                                }
                            }
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (MSS0)
                {
                    Name (_HID, EisaId ("SYN1B08"))
                    Name (_CID, Package (0x03)
                    {
                        0x001B2E4F, 
                        0x02002E4F, 
                        0x130FD041
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        And (TPTP, 0x07, TPTD)
                        If (LEqual (TPTD, 0x01))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LEqual (TPTD, 0x02))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                If (LEqual (TPTD, 0x04))
                                {
                                    Return (0x00)
                                }
                                Else
                                {
                                    Return (0x00)
                                }
                            }
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
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

            Scope (\_SB)
            {
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
                                _Y07)
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x00000000,         // Address Length
                                _Y08)
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x00000000,         // Address Length
                                _Y09)
                        })
                        CreateDWordField (MEMR, \_SB.MEM0._CRS._Y07._BAS, MBAS)
                        CreateDWordField (MEMR, \_SB.MEM0._CRS._Y07._LEN, MBLE)
                        CreateDWordField (MEMR, \_SB.MEM0._CRS._Y08._BAS, WDTB)
                        CreateDWordField (MEMR, \_SB.MEM0._CRS._Y08._LEN, WDLE)
                        CreateDWordField (MEMR, \_SB.MEM0._CRS._Y09._BAS, NVAB)
                        CreateDWordField (MEMR, \_SB.MEM0._CRS._Y09._LEN, NVAL)
                        If (\_SB.PCI0.LPC0.MTBA)
                        {
                            Store (\_SB.PCI0.LPC0.MTBA, MBAS)
                            Store (0x1000, MBLE)
                        }

                        If (\_SB.PCI0.SMB0.WDTA)
                        {
                            Store (\_SB.PCI0.SMB0.WDTA, WDTB)
                            Store (0x1000, WDLE)
                        }

                        If (\_SB.PCI0.SMB0.NVAM)
                        {
                            Store (\_SB.PCI0.SMB0.NVAM, NVAB)
                            Store (0x1000, NVAL)
                        }

                        Return (MEMR)
                    }
                }
            }

            Device (MMTM)
            {
                Name (_HID, EisaId ("PNP0103"))
                Name (_UID, 0x00)
                Name (MTB0, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {0}
                    IRQNoFlags ()
                        {8}
                    Memory32Fixed (ReadOnly,
                        0x00000000,         // Address Base
                        0x00000400,         // Address Length
                        _Y0A)
                })
                CreateDWordField (MTB0, \_SB.PCI0.MMTM._Y0A._BAS, TBAS)
                Name (MTB1, ResourceTemplate ()
                {
                })
                Method (_STA, 0, NotSerialized)
                {
                    If (And (\_SB.PCI0.LPC0.MTSE, 0x04))
                    {
                        Return (0x0F)
                    }

                    Return (0x00)
                }

                Method (_CRS, 0, Serialized)
                {
                    If (And (\_SB.PCI0.LPC0.MTSE, 0x04))
                    {
                        Store (\_SB.PCI0.LPC0.MTBA, TBAS)
                        Return (MTB0)
                    }
                    Else
                    {
                        Return (MTB1)
                    }
                }
            }

            Device (K801)
            {
                Name (_ADR, 0x00180001)
                OperationRegion (HMM0, PCI_Config, 0x88, 0x20)
                Field (HMM0, ByteAcc, NoLock, Preserve)
                {
                    PMB0,   32, 
                    PML0,   32, 
                    PMB1,   32, 
                    PML1,   32
                }

                OperationRegion (HMM1, PCI_Config, 0xC0, 0x20)
                Field (HMM1, ByteAcc, NoLock, Preserve)
                {
                    PIB0,   32, 
                    PIL0,   32, 
                    PIB1,   32, 
                    PIL1,   32
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
                Z00X,   4, 
                Z00Y,   4, 
                IPID,   4, 
                Z00Z,   4
            }
        }

        Scope (\_SB.PCI0)
        {
            Name (BUFA, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {5,7,10,11,14,15}
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
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x00000014,
                    0x00000015,
                    0x00000016,
                    0x00000017,
                }
            })
            Name (BUFD, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x00000011,
                }
            })
            Name (BUFS, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x00000012,
                }
            })
            Name (BUE1, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x00000010,
                }
            })
            Name (BUE2, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x00000011,
                }
            })
            Name (BUE3, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x00000012,
                }
            })
            Name (BUE4, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x00000013,
                }
            })
            Name (BUFF, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x00000005,
                    0x00000007,
                    0x0000000B,
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
                        Return (BUFF)
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
                        Return (BUFF)
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
                        Return (BUE1)
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
                        Return (BUE2)
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
                        Return (BUE3)
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
                        Return (BUE4)
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
                Name (_UID, 0x0B)
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
                Name (_UID, 0x0C)
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
                Name (_UID, 0x0D)
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

            Device (LGPU)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0E)
                Method (_STA, 0, NotSerialized)
                {
                    If (Z00Y)
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
                    Store (0x00, Z00Y)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFD)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (Z00Y))
                    }
                    Else
                    {
                        Return (CRSI (Z00Y))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), Z00Y)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), Z00Y)
                    }
                }
            }

            Device (LPID)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0F)
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
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IPID)
                    }
                }
            }

            Device (LSI0)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x10)
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

            Device (Z00N)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x12)
                Method (_STA, 0, NotSerialized)
                {
                    If (Z00Z)
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
                    Store (0x00, Z00Z)
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
                        Return (CRS (Z00Z))
                    }
                    Else
                    {
                        Return (CRSI (Z00Z))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), Z00Z)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), Z00Z)
                    }
                }
            }

            Device (Z00O)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x13)
                Method (_STA, 0, NotSerialized)
                {
                    If (Z00X)
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
                    Store (0x00, Z00X)
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
                        Return (CRS (Z00X))
                    }
                    Else
                    {
                        Return (CRSI (Z00X))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), Z00X)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), Z00X)
                    }
                }
            }

            Device (LPMU)
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
                        Return (BUFS)
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
        }
    }

    Scope (\_SB.PCI0.LPC0)
    {
        OperationRegion (RGA0, PCI_Config, 0xA0, 0x04)
        Field (RGA0, AnyAcc, NoLock, Preserve)
        {
            COMP,   8, 
            ADIO,   4, 
            MIDS,   4, 
            MSSS,   4, 
            FDCP,   2, 
            ADLB,   1, 
                    Offset (0x03), 
            LPTP,   3, 
                ,   1, 
            DVR0,   1, 
            DVR1,   1, 
            DVR2,   1, 
            DVR3,   1
        }

        OperationRegion (RGA1, PCI_Config, 0xA4, 0x04)
        Field (RGA1, AnyAcc, NoLock, Preserve)
        {
            GMPS,   16, 
                    Offset (0x04)
        }

        OperationRegion (DEC0, PCI_Config, 0xA8, 0x04)
        Field (DEC0, AnyAcc, NoLock, Preserve)
        {
            GMP0,   32
        }

        OperationRegion (DEC1, PCI_Config, 0xAC, 0x04)
        Field (DEC1, AnyAcc, NoLock, Preserve)
        {
            GMP1,   32
        }

        OperationRegion (DEC2, PCI_Config, 0xB0, 0x04)
        Field (DEC2, AnyAcc, NoLock, Preserve)
        {
            GMP2,   32
        }

        OperationRegion (DEC3, PCI_Config, 0xB4, 0x04)
        Field (DEC3, AnyAcc, NoLock, Preserve)
        {
            GMP3,   32
        }

        Method (Z010, 1, NotSerialized)
        {
            Store (\_SB.PCI0.LPC0.COMP, Local0)
            If (LEqual (Arg0, 0x03F8))
            {
                Not (0x01, Local2)
                And (Local0, Local2, Local0)
            }
            Else
            {
                If (LEqual (Arg0, 0x02F8))
                {
                    Not (0x02, Local2)
                    And (Local0, Local2, Local0)
                }
                Else
                {
                    If (LEqual (Arg0, 0x03E8))
                    {
                        Not (0x80, Local2)
                        And (Local0, Local2, Local0)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x02E8))
                        {
                            Not (0x20, Local2)
                            And (Local0, Local2, Local0)
                        }
                    }
                }
            }

            Store (Local0, \_SB.PCI0.LPC0.COMP)
        }

        Method (Z011, 1, NotSerialized)
        {
            Store (\_SB.PCI0.LPC0.COMP, Local0)
            If (LEqual (Arg0, 0x03F8))
            {
                Or (0x01, Local0, Local0)
            }
            Else
            {
                If (LEqual (Arg0, 0x02F8))
                {
                    Or (0x02, Local0, Local0)
                }
                Else
                {
                    If (LEqual (Arg0, 0x03E8))
                    {
                        Or (0x80, Local0, Local0)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x02E8))
                        {
                            Or (0x20, Local0, Local0)
                        }
                    }
                }
            }

            Store (Local0, \_SB.PCI0.LPC0.COMP)
        }

        Method (Z012, 1, NotSerialized)
        {
            Store (\_SB.PCI0.LPC0.LPTP, Local0)
            If (LEqual (Arg0, 0x0378))
            {
                Not (0x01, Local2)
                And (Local0, Local2, Local0)
            }
            Else
            {
                If (LEqual (Arg0, 0x0278))
                {
                    Not (0x02, Local2)
                    And (Local0, Local2, Local0)
                }
                Else
                {
                    If (LEqual (Arg0, 0x03BC))
                    {
                        Not (0x04, Local2)
                        And (Local0, Local2, Local0)
                    }
                }
            }

            Store (Local0, \_SB.PCI0.LPC0.LPTP)
        }

        Method (Z013, 1, NotSerialized)
        {
            Store (\_SB.PCI0.LPC0.LPTP, Local0)
            If (LEqual (Arg0, 0x0378))
            {
                Or (0x01, Local0, Local0)
            }
            Else
            {
                If (LEqual (Arg0, 0x0278))
                {
                    Or (0x02, Local0, Local0)
                }
                Else
                {
                    If (LEqual (Arg0, 0x03BC))
                    {
                        Or (0x04, Local0, Local0)
                    }
                }
            }

            Store (Local0, \_SB.PCI0.LPC0.LPTP)
        }

        Method (Z014, 1, NotSerialized)
        {
            Store (\_SB.PCI0.LPC0.FDCP, Local0)
            If (LEqual (Arg0, 0x03F0))
            {
                Not (0x01, Local2)
                And (Local0, Local2, Local0)
            }
            Else
            {
                If (LEqual (Arg0, 0x0370))
                {
                    Not (0x02, Local2)
                    And (Local0, Local2, Local0)
                }
            }

            Store (Local0, \_SB.PCI0.LPC0.FDCP)
        }

        Method (Z015, 1, NotSerialized)
        {
            Store (\_SB.PCI0.LPC0.FDCP, Local0)
            If (LEqual (Arg0, 0x03F0))
            {
                Or (0x01, Local0, Local0)
            }
            Else
            {
                If (LEqual (Arg0, 0x0370))
                {
                    Or (0x02, Local0, Local0)
                }
            }

            Store (Local0, \_SB.PCI0.LPC0.FDCP)
        }

        Method (Z016, 1, NotSerialized)
        {
            Store (\_SB.PCI0.LPC0.GMPS, Local0)
            If (LEqual (Arg0, 0x0200))
            {
                Not (0xFF, Local2)
                And (Local0, Local2, Local0)
            }

            If (LEqual (Arg0, 0x0208))
            {
                Not (0xFF00, Local2)
                And (Local0, Local2, Local0)
            }

            Store (Local0, \_SB.PCI0.LPC0.GMPS)
        }

        Method (Z017, 1, NotSerialized)
        {
            Store (\_SB.PCI0.LPC0.GMPS, Local0)
            If (LEqual (Arg0, 0x0200))
            {
                Or (0xFF, Local0, Local0)
            }

            If (LEqual (Arg0, 0x0208))
            {
                Or (0xFF00, Local0, Local0)
            }

            Store (Local0, \_SB.PCI0.LPC0.GMPS)
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

    OperationRegion (DBGP, SystemIO, 0x80, 0x01)
    Field (DBGP, ByteAcc, NoLock, Preserve)
    {
        DBUG,   8
    }

    Name (FWSO, "FWSO")
}

