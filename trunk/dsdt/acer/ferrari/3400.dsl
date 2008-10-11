/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080514
 *
 * Disassembly of 3400, Sat Oct 11 15:01:55 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00005A06 (23046)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0x0B
 *     OEM ID           "VIA  "
 *     OEM Table ID     "PTL_ACPI"
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x0100000E (16777230)
 */
DefinitionBlock ("3400.aml", "DSDT", 1, "VIA  ", "PTL_ACPI", 0x06040000)
{
    External (\_PR_.CPU0._PPC)

    OperationRegion (P80G, SystemIO, 0x80, 0x01)
    Field (P80G, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
    }

    Name (PICF, 0x00)
    Method (_PIC, 1, NotSerialized)
    {
        Store (Arg0, PICF)
    }

    Method (VTOB, 1, NotSerialized)
    {
        Store (0x01, Local0)
        ShiftLeft (Local0, Arg0, Local0)
        Return (Local0)
    }

    Method (BTOV, 1, NotSerialized)
    {
        ShiftRight (Arg0, 0x01, Local0)
        Store (0x00, Local1)
        While (Local0)
        {
            Increment (Local1)
            ShiftRight (Local0, 0x01, Local0)
        }

        Return (Local1)
    }

    Method (MKWD, 2, NotSerialized)
    {
        If (And (Arg1, 0x80))
        {
            Store (0xFFFF0000, Local0)
        }
        Else
        {
            Store (Zero, Local0)
        }

        Or (Local0, Arg0, Local0)
        Or (Local0, ShiftLeft (Arg1, 0x08), Local0)
        Return (Local0)
    }

    Method (POSW, 1, NotSerialized)
    {
        If (And (Arg0, 0x8000))
        {
            If (LEqual (Arg0, 0xFFFF))
            {
                Return (0xFFFFFFFF)
            }
            Else
            {
                Not (Arg0, Local0)
                Increment (Local0)
                And (Local0, 0xFFFF, Local0)
                Return (Local0)
            }
        }
        Else
        {
            Return (Arg0)
        }
    }

    Method (GBFE, 3, NotSerialized)
    {
        CreateByteField (Arg0, Arg1, TIDX)
        Store (TIDX, Arg2)
    }

    Method (PBFE, 3, NotSerialized)
    {
        CreateByteField (Arg0, Arg1, TIDX)
        Store (Arg2, TIDX)
    }

    Method (ITOS, 1, NotSerialized)
    {
        Store (Buffer (0x09)
            {
                /* 0000 */    0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00
            }, Local0)
        Store (Buffer (0x11)
            {
                "0123456789ABCDEF"
            }, Local7)
        Store (0x08, Local1)
        Store (0x00, Local2)
        Store (0x00, Local3)
        While (Local1)
        {
            Decrement (Local1)
            And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
            If (Local4)
            {
                Store (Ones, Local3)
            }

            If (Local3)
            {
                GBFE (Local7, Local4, RefOf (Local5))
                PBFE (Local0, Local2, Local5)
                Increment (Local2)
            }
        }

        Return (Local0)
    }

    Scope (\_SB)
    {
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0x4FEFAEBC, 0x00000001)
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
            Store (0x01, \_SB.INF)
            While (\_SB.INF)
            {
                Store (0x20, \_SB.BCMD)
                Store (Zero, \_SB.SMIC)
                If (LAnd (LEqual (\_SB.INF, 0x01), LGreaterEqual (\_SB.OSTB, 0x04)))
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

    Scope (\_SB)
    {
        OperationRegion (PSIB, SystemIO, 0x0000FE00, 0x00000002)
        Field (PSIB, AnyAcc, NoLock, Preserve)
        {
            SMIC,   8
        }

        OperationRegion (PSCB, SystemMemory, 0x4FEFAEBD, 0x00000090)
        Field (PSCB, AnyAcc, NoLock, Preserve)
        {
            BCMD,   8, 
            DID,    32, 
            INF,    8
        }

        Field (PSCB, AnyAcc, NoLock, Preserve)
        {
                    Offset (0x50), 
            BTEN,   1, 
            WLAN,   1, 
            ADIM,   1, 
            CPUV,   1, 
                    Offset (0x51), 
            PNUM,   8
        }

        Mutex (PSMX, 0x00)
        Method (PHSR, 2, NotSerialized)
        {
            Acquire (\_SB.PSMX, 0xFFFF)
            Store (0x90, BCMD)
            Store (Arg0, DID)
            Store (Arg1, INF)
            Store (Zero, SMIC)
            Store (INF, Local0)
            Release (\_SB.PSMX)
            Return (Local0)
        }
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00004010, 0x06) {}
    }

    Name (_S0, Package (0x02)
    {
        0x00, 
        0x00
    })
    Name (_S3, Package (0x02)
    {
        0x01, 
        0x01
    })
    Name (_S4, Package (0x02)
    {
        0x02, 
        0x02
    })
    Name (_S5, Package (0x02)
    {
        0x02, 
        0x02
    })
    Method (\_PTS, 1, NotSerialized)
    {
        Store (One, \_SB.PCI0.PIB.USBW)
        Store (Zero, \_SB.PCI0.PIB.STRP)
        Store (0x00, \_SB.PCI0.PIB.LIDP)
        If (LEqual (Arg0, 0x03))
        {
            Store (Zero, \_SB.PCI0.PIB.GPSU)
            Store (One, \_SB.PCI0.PIB.STRP)
            \_SB.PHSR (0x00, 0x00)
        }

        If (LEqual (Arg0, 0x04))
        {
            \_SB.PHSR (0x03, 0x00)
            If (\_SB.ECOK)
            {
                Acquire (\_SB.PCI0.PIB.EC0.MUT1, 0xFFFF)
                Store (0x01, \_SB.PCI0.PIB.EC0.S4IN)
                Release (\_SB.PCI0.PIB.EC0.MUT1)
            }
        }

        If (LEqual (\_SB.PCI0.GIGA.LANP, 0x00))
        {
            Store (0x00, \_SB.PCI0.PIB.EC0.PMEE)
        }
        Else
        {
            Store (0x01, \_SB.PCI0.PIB.EC0.PMEE)
        }

        \_SB.PHSR (0x05, 0x00)
    }

    Method (\_WAK, 1, NotSerialized)
    {
        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x03)))
        {
            Store (\_SB.BTEN, \_SB.PCI0.PIB.EC0.BLTH)
            Store (\_SB.WLAN, \_SB.PCI0.PIB.EC0.WLAN)
            Store (0x01, \_SB.PCI0.PIB.EC0.CPLE)
        }

        Store (Zero, \_SB.PCI0.PIB.USBW)
        Store (0x01, \_SB.PCI0.PIB.LIDP)
        If (LEqual (Arg0, 0x03))
        {
            \_SB.PHSR (0x02, 0x00)
        }

        If (LEqual (Arg0, 0x04))
        {
            \_SB.PHSR (0x04, 0x00)
        }

        \_SB.PHSR (0x05, 0x01)
    }

    Scope (\_GPE)
    {
        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.LID, 0x80)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.Z000, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0, 0x02)
        }

        Method (_L0E, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
            Notify (\_SB.PCI0.USB2, 0x02)
            Notify (\_SB.PCI0.USB3, 0x02)
        }
    }

    Scope (\_SB)
    {
        Name (ECOK, 0x00)
        Name (TOFF, 0x00)
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Name (LCDB, 0x01)
            Method (_LID, 0, NotSerialized)
            {
                If (\_SB.PCI0.PIB.LIDS)
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Name (ACP, Ones)
            Name (ADIM, Ones)
            Name (AFLG, Ones)
            Name (SWAC, Ones)
            Name (SWBT, Ones)
            Method (_PSR, 0, NotSerialized)
            {
                Acquire (\_SB.PCI0.PIB.EC0.MUT1, 0xFFFF)
                \_SB.PCI0.PIB.EC0.CPOL ()
                Store (ACP, Local0)
                If (Local0)
                {
                    Store (0x01, Local1)
                }
                Else
                {
                    Store (0x00, Local1)
                }

                Release (\_SB.PCI0.PIB.EC0.MUT1)
                Return (Local1)
            }

            Method (CHAC, 1, NotSerialized)
            {
                Store (LGreater (And (Arg0, 0xF0), 0x80), Local0)
                If (LNotEqual (Local0, ACP))
                {
                    Store (Local0, ACP)
                    Return (Ones)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, 0x01)
            Method (VTOB, 1, NotSerialized)
            {
                Store (0x01, Local0)
                ShiftLeft (Local0, Arg0, Local0)
                Return (Local0)
            }

            Method (BTOV, 1, NotSerialized)
            {
                ShiftRight (Arg0, 0x01, Local0)
                Store (0x00, Local1)
                While (Local0)
                {
                    Increment (Local1)
                    ShiftRight (Local0, 0x01, Local0)
                }

                Return (Local1)
            }

            Method (MKWD, 2, NotSerialized)
            {
                If (And (Arg1, 0x80))
                {
                    Store (0xFFFF0000, Local0)
                }
                Else
                {
                    Store (Zero, Local0)
                }

                Or (Local0, Arg0, Local0)
                Or (Local0, ShiftLeft (Arg1, 0x08), Local0)
                Return (Local0)
            }

            Method (POSW, 1, NotSerialized)
            {
                If (And (Arg0, 0x8000))
                {
                    If (LEqual (Arg0, 0xFFFF))
                    {
                        Return (0xFFFFFFFF)
                    }
                    Else
                    {
                        Not (Arg0, Local0)
                        Increment (Local0)
                        And (Local0, 0xFFFF, Local0)
                        Return (Local0)
                    }
                }
                Else
                {
                    Return (Arg0)
                }
            }

            Method (GBFE, 3, NotSerialized)
            {
                CreateByteField (Arg0, Arg1, TIDX)
                Store (TIDX, Arg2)
            }

            Method (PBFE, 3, NotSerialized)
            {
                CreateByteField (Arg0, Arg1, TIDX)
                Store (Arg2, TIDX)
            }

            Method (ITOS, 1, NotSerialized)
            {
                Store (Buffer (0x09)
                    {
                        /* 0000 */    0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0008 */    0x00
                    }, Local0)
                Store (Buffer (0x11)
                    {
                        "0123456789ABCDEF"
                    }, Local7)
                Store (0x08, Local1)
                Store (0x00, Local2)
                Store (0x00, Local3)
                While (Local1)
                {
                    Decrement (Local1)
                    And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
                    If (Local4)
                    {
                        Store (Ones, Local3)
                    }

                    If (Local3)
                    {
                        GBFE (Local7, Local4, RefOf (Local5))
                        PBFE (Local0, Local2, Local5)
                        Increment (Local2)
                    }
                }

                Return (Local0)
            }

            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Name (UBHD, 0x00)
            Name (PBHD, Package (0x03)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            })
            Name (BATI, 0xFFFF)
            Name (BATC, 0xFFFF)
            Name (BATV, 0xFFFF)
            Name (BATS, 0xFFFF)
            Name (PBIF, Package (0x0D)
            {
                0x01, 
                0x0B40, 
                0x0B40, 
                0x01, 
                0x39D0, 
                0x012C, 
                0x64, 
                0x20, 
                0x20, 
                "BAT1", 
                " ", 
                " ", 
                " "
            })
            Name (PBST, Package (0x04)
            {
                0x00, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x2710
            })
            Name (UBIF, 0x01E9)
            Name (BP, 0x00)
            Name (REPT, 0x00)
            Name (ERRC, 0x00)
            Method (_STA, 0, NotSerialized)
            {
                Store (0x0F, Local0)
                Acquire (\_SB.PCI0.PIB.EC0.MUT1, 0xFFFF)
                Store ("CMBatt - _STA.BAT1", Debug)
                \_SB.PCI0.PIB.EC0.CPOL ()
                If (BP)
                {
                    Store (0x1F, Local0)
                }
                Else
                {
                    Store (0x0F, Local0)
                }

                Release (\_SB.PCI0.PIB.EC0.MUT1)
                Return (Local0)
            }

            Method (_BIF, 0, NotSerialized)
            {
                Acquire (\_SB.PCI0.PIB.EC0.MUT1, 0xFFFF)
                Store ("CMBatt - _BIF.BAT1", Debug)
                \_SB.PCI0.PIB.EC0.CPOL ()
                Release (\_SB.PCI0.PIB.EC0.MUT1)
                Return (PBIF)
            }

            Method (_BST, 0, NotSerialized)
            {
                Acquire (\_SB.PCI0.PIB.EC0.MUT1, 0xFFFF)
                Store ("CMBatt - _BST.BAT1", Debug)
                \_SB.PCI0.PIB.EC0.CPOL ()
                Release (\_SB.PCI0.PIB.EC0.MUT1)
                Return (PBST)
            }

            Method (B1CK, 0, NotSerialized)
            {
                Store ("CMBatt - Notify(BAT1,0x81): B1CK", Debug)
                Notify (\_SB.BAT1, 0x81)
            }

            Method (B1ST, 0, NotSerialized)
            {
                Store ("CMBatt - Notify(BAT1,0x80): B1ST", Debug)
                Notify (\_SB.BAT1, 0x80)
            }

            Method (B1IF, 0, NotSerialized)
            {
                Store ("CMBatt - Notify(BAT1,0x81): B1IF", Debug)
                Notify (\_SB.BAT1, 0x81)
            }

            Method (UPBI, 0, NotSerialized)
            {
                Store ("CMBatt - UPBI.BAT1", Debug)
                Store (Zero, Local0)
                If (LEqual (ECOK, 0x00))
                {
                    Return (Local0)
                }

                Store (0x0C, Local1)
                Store (Buffer (0x0D)
                    {
                        /* 0000 */    0x00, 0x18, 0x10, 0x00, 0x19, 0x00, 0x00, 0x00, 
                        /* 0008 */    0x00, 0x21, 0x00, 0x22, 0x20
                    }, Local2)
                While (LGreater (Local1, 0x08))
                {
                    If (LNot (And (UBIF, VTOB (Local1))))
                    {
                        GBFE (Local2, Local1, RefOf (Local3))
                        If (Local3)
                        {
                            If (LNot (\_SB.PCI0.PIB.EC0.SMRD (0x0B, 0x16, Local3, RefOf (Local4))))
                            {
                                Store (\_SB.PCI0.PIB.EC0.BCNT, Local5)
                                Store (Zero, Local3)
                                Store (Zero, ERRC)
                                While (LGreater (Local5, Local3))
                                {
                                    GBFE (Local4, Local3, RefOf (Local6))
                                    Increment (Local3)
                                    If (And (Local6, 0x80))
                                    {
                                        Increment (ERRC)
                                    }
                                }

                                If (LEqual (ERRC, 0x00))
                                {
                                    Store (Local4, Index (PBIF, Local1))
                                    Or (UBIF, VTOB (Local1), UBIF)
                                    Store (Ones, Local0)
                                }
                            }
                        }
                    }

                    Decrement (Local1)
                }

                While (LGreater (Local1, 0x00))
                {
                    If (LNot (And (UBIF, VTOB (Local1))))
                    {
                        GBFE (Local2, Local1, RefOf (Local3))
                        If (Local3)
                        {
                            If (LNot (\_SB.PCI0.PIB.EC0.SMRD (0x09, 0x16, Local3, RefOf (Local5))))
                            {
                                If (LAnd (Local5, LNot (And (Local5, 0x8000))))
                                {
                                    If (LEqual (Local1, 0x02))
                                    {
                                        ShiftRight (Local5, 0x05, Local5)
                                        ShiftLeft (Local5, 0x05, Local5)
                                    }

                                    Store (Local5, Index (PBIF, Local1))
                                    Or (UBIF, VTOB (Local1), UBIF)
                                    Store (Ones, Local0)
                                }
                            }
                        }
                    }

                    Decrement (Local1)
                }

                Store (0x0A, Local1)
                If (LNot (And (UBIF, VTOB (Local1))))
                {
                    If (LNot (\_SB.PCI0.PIB.EC0.SMRD (0x09, 0x16, 0x1C, RefOf (Local5))))
                    {
                        Store (Local5, BATS)
                        Store (ITOS (ToBCD (Local5)), Index (PBIF, Local1))
                        Or (UBIF, VTOB (Local1), UBIF)
                        Store (Ones, Local0)
                    }
                }

                Store (PBIF, Debug)
                Return (Local0)
            }

            Method (UPBS, 0, NotSerialized)
            {
                Store ("CMBatt - UPBS.BAT1", Debug)
                Store (Zero, Local0)
                If (LEqual (ECOK, 0x00))
                {
                    Return (Local0)
                }

                Store (\_SB.PCI0.PIB.EC0.BT1S, Local5)
                Store (Local5, Local1)
                And (Local5, 0x07, Local5)
                If (LNotEqual (Local5, DerefOf (Index (PBST, 0x00))))
                {
                    Store ("CMBatt - BAT1 STATE CHANGE", Debug)
                    Store (Local1, Debug)
                    Store (Local5, Index (PBST, 0x00))
                    Store (Ones, Local0)
                }

                Store (\_SB.PCI0.PIB.EC0.BT1C, Local5)
                If (LNot (And (Local5, 0x8000)))
                {
                    Store (Local5, BATC)
                    ShiftRight (Local5, 0x05, Local5)
                    ShiftLeft (Local5, 0x05, Local5)
                    If (LNotEqual (Local5, DerefOf (Index (PBST, 0x02))))
                    {
                        Store (Local5, Index (PBST, 0x02))
                        Store (Ones, Local0)
                    }
                }

                Store (\_SB.PCI0.PIB.EC0.BT1V, Local5)
                If (LNot (And (Local5, 0x8000)))
                {
                    Store (Local5, BATV)
                    ShiftRight (Local5, 0x05, Local5)
                    ShiftLeft (Local5, 0x05, Local5)
                    If (LNotEqual (Local5, DerefOf (Index (PBST, 0x03))))
                    {
                        Store (Local5, Index (PBST, 0x03))
                        Store (Ones, Local0)
                    }
                }

                Store (\_SB.PCI0.PIB.EC0.BT1I, Local5)
                Store (Local5, BATI)
                If (And (BATI, 0x8000))
                {
                    Or (BATI, 0xFFFF0000, BATI)
                }

                If (And (Local1, 0x01))
                {
                    Store (\_SB.PCI0.PIB.EC0.BT1V, Local2)
                    If (LEqual (Local2, Zero))
                    {
                        Store (0x39D0, Local2)
                    }

                    Divide (0x01036640, Local2, , Local3)
                    If (And (Local5, 0x8000))
                    {
                        Or (Local5, 0xFFFF0000, Local5)
                        Add (Not (Local5), 0x01, Local5)
                        If (LGreater (Local3, Local5))
                        {
                            Store (Local3, Local5)
                        }
                    }
                    Else
                    {
                        Store (Local3, Local5)
                    }
                }

                If (And (Local1, 0x02))
                {
                    If (And (Local5, 0x8000))
                    {
                        Store (0x00, Local5)
                    }

                    If (LGreater (0x64, Local5))
                    {
                        Store (0x64, Local5)
                    }
                }

                If (LEqual (And (Local1, 0x03), 0x00))
                {
                    Store (0x00, Local5)
                }

                ShiftRight (Local5, 0x05, Local5)
                ShiftLeft (Local5, 0x05, Local5)
                If (LNotEqual (Local5, DerefOf (Index (PBST, 0x01))))
                {
                    Store (Local5, Index (PBST, 0x01))
                    Store (Ones, Local0)
                }

                If (Local0)
                {
                    Store ("CMBATT - PBST Changed", Debug)
                }

                Store (PBST, Debug)
                Return (Local0)
            }

            Method (UPBH, 0, NotSerialized)
            {
                Store ("CMBatt - UPBH.BAT1", Debug)
                Store (Zero, Local0)
                If (LEqual (ECOK, 0x00))
                {
                    Return (Local0)
                }

                Store (0x00, Local1)
                Store (Buffer (0x03)
                    {
                        0x17, 0x0C, 0x10
                    }, Local2)
                While (LLess (Local1, 0x03))
                {
                    If (LNot (And (UBHD, VTOB (Local1))))
                    {
                        GBFE (Local2, Local1, RefOf (Local3))
                        If (LNot (\_SB.PCI0.PIB.EC0.SMRD (0x09, 0x16, Local3, RefOf (Local5))))
                        {
                            Store (Local5, Index (PBHD, Local1))
                            Or (UBHD, VTOB (Local1), UBHD)
                            Store (Ones, Local0)
                        }
                    }

                    Increment (Local1)
                }

                Store (PBHD, Debug)
                Return (Local0)
            }

            Method (IVBI, 0, NotSerialized)
            {
                Store (0x01E9, UBIF)
                Store (0x0B40, Index (PBIF, 0x01))
                Store (0x0B40, Index (PBIF, 0x02))
                Store (0x39D0, Index (PBIF, 0x04))
                Store ("Bad", Index (PBIF, 0x09))
                Store ("Bad", Index (PBIF, 0x0A))
                Store ("Bad", Index (PBIF, 0x0B))
                Store ("Bad", Index (PBIF, 0x0C))
            }

            Method (IVBS, 0, NotSerialized)
            {
                Store (0x00, Index (PBST, 0x00))
                Store (0xFFFFFFFF, Index (PBST, 0x01))
                Store (0xFFFFFFFF, Index (PBST, 0x02))
                Store (0x39D0, Index (PBST, 0x03))
            }

            Method (IVBH, 0, NotSerialized)
            {
                Store (0x00, UBHD)
                Store (0xFFFF, Index (PBHD, 0x00))
                Store (0xFFFF, Index (PBHD, 0x01))
                Store (0xFFFF, Index (PBHD, 0x02))
            }

            Method (CHBP, 1, NotSerialized)
            {
                Store ("CMBatt - CHBP.BAT1", Debug)
                Store (Zero, Local0)
                If (LEqual (ECOK, 0x00))
                {
                    Return (Local0)
                }

                Store (VTOB (Subtract (_UID, 0x01)), Local1)
                Or (ShiftLeft (Local1, 0x0C), 0x0FFF, Local2)
                Store (Zero, Local3)
                If (And (Arg0, Local1))
                {
                    If (BP)
                    {
                        Store ("CMBatt - BAT1 still present", Debug)
                        \_SB.PCI0.PIB.EC0.SMWR (0x08, 0x14, 0x01, Local2)
                        \_SB.PCI0.PIB.EC0.SMRD (0x09, 0x14, 0x01, RefOf (Local3))
                        If (LEqual (Local2, Or (Local3, 0x0FFF)))
                        {
                            If (UPBI ())
                            {
                                Or (0x01, Local0, Local0)
                            }

                            If (UPBS ())
                            {
                                Or (0x02, Local0, Local0)
                            }

                            UPBH ()
                        }
                    }
                    Else
                    {
                        Store ("CMBatt - BAT1 connected", Debug)
                        \_SB.PCI0.PIB.EC0.SMWR (0x08, 0x14, 0x01, Local2)
                        \_SB.PCI0.PIB.EC0.SMRD (0x09, 0x14, 0x01, RefOf (Local3))
                        If (LEqual (Local2, Or (Local3, 0x0FFF)))
                        {
                            UPBI ()
                            UPBS ()
                            UPBH ()
                        }

                        Store (0x01, BP)
                        Or (0x05, Local0, Local0)
                    }
                }
                Else
                {
                    If (BP)
                    {
                        Store ("CMBatt - BAT1 disconnected", Debug)
                        Store (0x00, BP)
                        IVBI ()
                        IVBS ()
                        IVBH ()
                        Or (0x04, Local0, Local0)
                    }
                }

                If (LAnd (And (Arg0, Local1), LNotEqual (UBIF, 0x1FFF)))
                {
                    Store (0x01, REPT)
                }
                Else
                {
                    Store (0x00, REPT)
                }

                Return (Local0)
            }
        }

        Scope (\_TZ)
        {
            ThermalZone (THRM)
            {
                Method (_TMP, 0, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.PIB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.PIB.EC0.CTMP, Local0)
                        Release (\_SB.PCI0.PIB.EC0.MUT1)
                        Subtract (Local0, \_SB.TOFF, Local0)
                        Return (Add (Multiply (Local0, 0x0A), 0x0AAC))
                    }
                    Else
                    {
                        Return (0x0C3C)
                    }
                }

                Method (_PSV, 0, NotSerialized)
                {
                    Return (Add (Multiply (0x50, 0x0A), 0x0AAC))
                }

                Name (_PSL, Package (0x01)
                {
                    \_PR.CPU0
                })
                Name (_TSP, 0x28)
                Name (_TC1, 0x02)
                Name (_TC2, 0x03)
                Method (_CRT, 0, NotSerialized)
                {
                    Return (Add (Multiply (0x5A, 0x0A), 0x0AAC))
                }
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (_PRW, Package (0x02)
            {
                0x05, 
                0x04
            })
            Name (_BBN, 0x00)
            Method (_S3D, 0, NotSerialized)
            {
                Return (0x02)
            }

            Method (_INI, 0, NotSerialized)
            {
                \_SB.OSTP ()
                Store (0x01, \_SB.PCI0.PIB.LIDP)
            }

            OperationRegion (NB00, PCI_Config, 0x00, 0x0100)
            Field (NB00, ByteAcc, NoLock, Preserve)
            {
                        Offset (0x47), 
                    ,   2, 
                VLNK,   1, 
                        Offset (0x57), 
                EADD,   8, 
                        Offset (0x61), 
                C0C3,   2, 
                C4C7,   2, 
                C8CB,   2, 
                CCCF,   2, 
                D0D3,   2, 
                D4D7,   2, 
                D8DB,   2, 
                DCDF,   2, 
                    ,   4, 
                E0EF,   2, 
                F0FF,   2, 
                        Offset (0x69), 
                    ,   5, 
                VCLK,   1
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Name (CRES, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    0x00,, , TypeStatic)
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000D00,         // Range Minimum
                    0x0000FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000F300,         // Length
                    0x00,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)
            {
                CreateDWordField (CRES, \_SB.PCI0._Y00._MIN, TCMN)
                CreateDWordField (CRES, \_SB.PCI0._Y00._MAX, TCMX)
                CreateDWordField (CRES, \_SB.PCI0._Y00._LEN, TOLN)
                Multiply (\_SB.PCI0.EADD, 0x01000000, TCMN)
                Subtract (0xFFE80000, TCMN, TOLN)
                Subtract (Add (TCMN, TOLN), 0x01, TCMX)
                CreateBitField (CRES, \_SB.PCI0._Y01._RW, C0RW)
                CreateDWordField (CRES, \_SB.PCI0._Y01._MIN, C0MN)
                CreateDWordField (CRES, \_SB.PCI0._Y01._MAX, C0MX)
                CreateDWordField (CRES, \_SB.PCI0._Y01._LEN, C0LN)
                Store (One, C0RW)
                If (LEqual (And (C0C3, 0x03), 0x01))
                {
                    Store (Zero, C0RW)
                }

                Store (Zero, C0LN)
                If (LNot (And (C0C3, 0x03)))
                {
                    Store (0x4000, C0LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y02._RW, C4RW)
                CreateDWordField (CRES, \_SB.PCI0._Y02._MIN, C4MN)
                CreateDWordField (CRES, \_SB.PCI0._Y02._MAX, C4MX)
                CreateDWordField (CRES, \_SB.PCI0._Y02._LEN, C4LN)
                Store (One, C4RW)
                If (LEqual (And (C4C7, 0x03), 0x01))
                {
                    Store (Zero, C4RW)
                }

                Store (Zero, C4LN)
                If (LNot (And (C4C7, 0x03)))
                {
                    Store (0x4000, C4LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y03._RW, C8RW)
                CreateDWordField (CRES, \_SB.PCI0._Y03._MIN, C8MN)
                CreateDWordField (CRES, \_SB.PCI0._Y03._MAX, C8MX)
                CreateDWordField (CRES, \_SB.PCI0._Y03._LEN, C8LN)
                Store (One, C8RW)
                If (LEqual (And (C8CB, 0x03), 0x01))
                {
                    Store (Zero, C8RW)
                }

                Store (Zero, C8LN)
                If (LNot (And (C8CB, 0x03)))
                {
                    Store (0x4000, C8LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y04._RW, CCRW)
                CreateDWordField (CRES, \_SB.PCI0._Y04._MIN, CCMN)
                CreateDWordField (CRES, \_SB.PCI0._Y04._MAX, CCMX)
                CreateDWordField (CRES, \_SB.PCI0._Y04._LEN, CCLN)
                Store (One, CCRW)
                If (LEqual (And (CCCF, 0x03), 0x01))
                {
                    Store (Zero, CCRW)
                }

                Store (Zero, CCLN)
                If (LNot (And (CCCF, 0x03)))
                {
                    Store (0x4000, CCLN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y05._RW, D0RW)
                CreateDWordField (CRES, \_SB.PCI0._Y05._MIN, D0MN)
                CreateDWordField (CRES, \_SB.PCI0._Y05._MAX, D0MX)
                CreateDWordField (CRES, \_SB.PCI0._Y05._LEN, D0LN)
                Store (One, D0RW)
                If (LEqual (And (D0D3, 0x03), 0x01))
                {
                    Store (Zero, D0RW)
                }

                Store (Zero, D0LN)
                If (LNot (And (D0D3, 0x03)))
                {
                    Store (0x4000, D0LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y06._RW, D4RW)
                CreateDWordField (CRES, \_SB.PCI0._Y06._MIN, D4MN)
                CreateDWordField (CRES, \_SB.PCI0._Y06._MAX, D4MX)
                CreateDWordField (CRES, \_SB.PCI0._Y06._LEN, D4LN)
                Store (One, D4RW)
                If (LEqual (And (D4D7, 0x03), 0x01))
                {
                    Store (Zero, D4RW)
                }

                Store (Zero, D4LN)
                If (LNot (And (D4D7, 0x03)))
                {
                    Store (0x4000, D4LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y07._RW, D8RW)
                CreateDWordField (CRES, \_SB.PCI0._Y07._MIN, D8MN)
                CreateDWordField (CRES, \_SB.PCI0._Y07._MAX, D8MX)
                CreateDWordField (CRES, \_SB.PCI0._Y07._LEN, D8LN)
                Store (One, D8RW)
                If (LEqual (And (D8DB, 0x03), 0x01))
                {
                    Store (Zero, D8RW)
                }

                Store (Zero, D8LN)
                If (LNot (And (D8DB, 0x03)))
                {
                    Store (0x4000, D8LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y08._RW, DCRW)
                CreateDWordField (CRES, \_SB.PCI0._Y08._MIN, DCMN)
                CreateDWordField (CRES, \_SB.PCI0._Y08._MAX, DCMX)
                CreateDWordField (CRES, \_SB.PCI0._Y08._LEN, DCLN)
                Store (One, DCRW)
                If (LEqual (And (DCDF, 0x03), 0x01))
                {
                    Store (Zero, DCRW)
                }

                Store (Zero, DCLN)
                If (LNot (And (DCDF, 0x03)))
                {
                    Store (0x4000, DCLN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y09._RW, E0RW)
                CreateDWordField (CRES, \_SB.PCI0._Y09._MIN, E0MN)
                CreateDWordField (CRES, \_SB.PCI0._Y09._MAX, E0MX)
                CreateDWordField (CRES, \_SB.PCI0._Y09._LEN, E0LN)
                Store (One, E0RW)
                If (LEqual (And (E0EF, 0x03), 0x01))
                {
                    Store (Zero, E0RW)
                }

                Store (Zero, E0LN)
                If (LNot (And (E0EF, 0x03)))
                {
                    Store (0x00010000, E0LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y0A._RW, F0RW)
                CreateDWordField (CRES, \_SB.PCI0._Y0A._MIN, F0MN)
                CreateDWordField (CRES, \_SB.PCI0._Y0A._MAX, F0MX)
                CreateDWordField (CRES, \_SB.PCI0._Y0A._LEN, F0LN)
                Store (One, F0RW)
                If (LEqual (And (F0FF, 0x03), 0x01))
                {
                    Store (Zero, F0RW)
                }

                Store (Zero, F0LN)
                If (LNot (And (F0FF, 0x03)))
                {
                    Store (0x00010000, F0LN)
                }

                Return (CRES)
            }

            Name (APIC, Package (0x0C)
            {
                Package (0x04)
                {
                    0x0010FFFF, 
                    0x00, 
                    0x00, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x01, 
                    0x00, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x02, 
                    0x00, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x03, 
                    0x00, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x02, 
                    0x00, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x02, 
                    0x00, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    0x00, 
                    0x00, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x00, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x01, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x00, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x00, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x00, 
                    0x00, 
                    0x12
                }
            })
            Name (PICM, Package (0x20)
            {
                Package (0x04)
                {
                    0x0018FFFF, 
                    0x00, 
                    \_SB.PCI0.PIB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    0x01, 
                    \_SB.PCI0.PIB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    0x02, 
                    \_SB.PCI0.PIB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    0x03, 
                    \_SB.PCI0.PIB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    \_SB.PCI0.PIB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x01, 
                    \_SB.PCI0.PIB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    \_SB.PCI0.PIB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    \_SB.PCI0.PIB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x00, 
                    \_SB.PCI0.PIB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x01, 
                    \_SB.PCI0.PIB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x02, 
                    \_SB.PCI0.PIB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x03, 
                    \_SB.PCI0.PIB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x00, 
                    \_SB.PCI0.PIB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x01, 
                    \_SB.PCI0.PIB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x02, 
                    \_SB.PCI0.PIB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x03, 
                    \_SB.PCI0.PIB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x00, 
                    \_SB.PCI0.PIB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x01, 
                    \_SB.PCI0.PIB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    \_SB.PCI0.PIB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x03, 
                    \_SB.PCI0.PIB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x00, 
                    \_SB.PCI0.PIB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x01, 
                    \_SB.PCI0.PIB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x02, 
                    \_SB.PCI0.PIB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x03, 
                    \_SB.PCI0.PIB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x00, 
                    \_SB.PCI0.PIB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x01, 
                    \_SB.PCI0.PIB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x02, 
                    \_SB.PCI0.PIB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x03, 
                    \_SB.PCI0.PIB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x00, 
                    \_SB.PCI0.PIB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x01, 
                    \_SB.PCI0.PIB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x02, 
                    \_SB.PCI0.PIB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x03, 
                    \_SB.PCI0.PIB.LNKC, 
                    0x00
                }
            })
            Method (_PRT, 0, NotSerialized)
            {
                If (PICF)
                {
                    Return (APIC)
                }
                Else
                {
                    Return (PICM)
                }
            }

            Device (AGP)
            {
                Name (_ADR, 0x00010000)
                OperationRegion (A1E0, PCI_Config, 0x19, 0x01)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    SECB,   8
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
                }

                Name (_PRT, Package (0x01)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }
                })
                Device (VGA)
                {
                    Name (_ADR, 0x00)
                    Name (DABL, 0x00)
                    Name (SWIT, 0x01)
                    Name (CRTA, 0x01)
                    Name (LCDA, 0x01)
                    Name (TVA, 0x00)
                    Name (TOGF, 0x00)
                    Name (_S3D, 0x03)
                    Method (_INI, 0, NotSerialized)
                    {
                        Acquire (\_SB.PSMX, 0xFFFF)
                        Store (0x80, \_SB.BCMD)
                        Store (0x03, \_SB.DID)
                        Store (Zero, \_SB.SMIC)
                        Release (\_SB.PSMX)
                        Store (\_SB.INF, Local0)
                        Store (Local0, DABL)
                        Store (Local0, Local1)
                        Store (Local0, Local2)
                        And (Local1, 0x01, CRTA)
                        And (Local1, 0x02, LCDA)
                        If (LGreater (Local0, 0x04))
                        {
                            And (Local0, 0x03, TOGF)
                        }
                        Else
                        {
                            Store (Local0, TOGF)
                        }
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store ("VGA --_DOS Arg0", Debug)
                        Store (Arg0, SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Store ("VGA --_DOD", Debug)
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200
                        })
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        Store ("VGA_PS0", Debug)
                    }

                    Method (_PS2, 0, NotSerialized)
                    {
                        Store ("VGA_PS2", Debug)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store ("VGA_PS3", Debug)
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
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
                            Store (CRTA, Local0)
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
                            Store (Arg0, Debug)
                        }
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
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
                            Store (Arg0, Debug)
                        }
                    }

                    Device (TV)
                    {
                        Name (_ADR, 0x0200)
                        Method (_DCS, 0, NotSerialized)
                        {
                            Store ("TV --_DCS", Debug)
                            If (TVA)
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
                            Store ("TV --_DGS", Debug)
                            Store (TVA, Local0)
                            If (TVA)
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
                            Store ("TV --_DSS", Debug)
                            Store (Arg0, Debug)
                        }
                    }
                }
            }

            Device (PIB)
            {
                Name (_ADR, 0x00110000)
                OperationRegion (IRQR, PCI_Config, 0x00, 0x0100)
                Field (IRQR, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x50), 
                        ,   1, 
                    ESB4,   1, 
                    ESB3,   1, 
                        ,   1, 
                    ESB1,   1, 
                    ESB2,   1, 
                    AC97,   1, 
                    MC97,   1, 
                        ,   2, 
                    PS2E,   1, 
                            Offset (0x55), 
                        ,   4, 
                    PIRA,   4, 
                    PIRB,   4, 
                    PIRC,   4, 
                        ,   4, 
                    PIRD,   4, 
                            Offset (0x88), 
                    PMBS,   16, 
                            Offset (0x94), 
                        ,   4, 
                    GPSU,   1, 
                    SUSC,   1, 
                    STRP,   1, 
                            Offset (0x95), 
                    USBW,   1, 
                            Offset (0xD0), 
                    SMBS,   16, 
                    SMBC,   1
                }

                OperationRegion (PMIO, SystemIO, 0x4000, 0x50)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x2A), 
                    PACT,   1, 
                            Offset (0x2C), 
                        ,   7, 
                    LIDP,   1, 
                            Offset (0x2F), 
                    BCMD,   8, 
                        ,   5, 
                    CMAS,   1, 
                    CMBS,   1, 
                            Offset (0x31), 
                            Offset (0x34), 
                        ,   5, 
                    CMAE,   1, 
                    CMBE,   1, 
                            Offset (0x48), 
                        ,   4, 
                    LIDS,   1, 
                            Offset (0x4C), 
                        ,   7, 
                    BLIT,   1
                }

                Device (ALKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Name (_PRS, ResourceTemplate ()
                    {
                        Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
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
                    Method (_STA, 0, NotSerialized)
                    {
                        And (PIRA, 0xF0, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        And (PIRA, 0x0F, PIRA)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFA, ResourceTemplate ()
                        {
                            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y0B)
                            {
                                0x00000000,
                            }
                        })
                        CreateWordField (BUFA, \_SB.PCI0.PIB.ALKA._CRS._Y0B._INT, IRAI)
                        Store (\_SB.PCI0.PIB.PIRA, IRAI)
                        Return (BUFA)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                    }
                }

                Device (ALKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Name (_PRS, ResourceTemplate ()
                    {
                        Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
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
                    Method (_STA, 0, NotSerialized)
                    {
                        And (PIRB, 0xF0, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        And (PIRB, 0x0F, PIRB)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFB, ResourceTemplate ()
                        {
                            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y0C)
                            {
                                0x00000000,
                            }
                        })
                        CreateWordField (BUFB, \_SB.PCI0.PIB.ALKB._CRS._Y0C._INT, IRBI)
                        Store (\_SB.PCI0.PIB.PIRB, IRBI)
                        Return (BUFB)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                    }
                }

                Device (ALKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Name (_PRS, ResourceTemplate ()
                    {
                        Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                        {
                            0x00000016,
                        }
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        And (PIRC, 0xF0, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        And (PIRC, 0x0F, PIRC)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFC, ResourceTemplate ()
                        {
                            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y0D)
                            {
                                0x00000000,
                            }
                        })
                        CreateWordField (BUFC, \_SB.PCI0.PIB.ALKC._CRS._Y0D._INT, IRCI)
                        Store (\_SB.PCI0.PIB.PIRC, IRCI)
                        Return (BUFC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                    }
                }

                Device (ALKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Name (_PRS, ResourceTemplate ()
                    {
                        Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                        {
                            0x00000015,
                        }
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        And (PIRD, 0xF0, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        And (PIRD, 0x0F, PIRD)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFD, ResourceTemplate ()
                        {
                            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y0E)
                            {
                                0x00000000,
                            }
                        })
                        CreateWordField (BUFD, \_SB.PCI0.PIB.ALKD._CRS._Y0E._INT, IRDI)
                        Store (\_SB.PCI0.PIB.PIRD, IRDI)
                        Return (BUFD)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                    }
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,12,14,15}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (Zero, \_SB.PCI0.PIB.PIRA)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.PIB.PIRA, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFA, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y0F)
                                {}
                        })
                        CreateByteField (BUFA, \_SB.PCI0.PIB.LNKA._CRS._Y0F._INT, IRA1)
                        CreateByteField (BUFA, 0x02, IRA2)
                        Store (\_SB.PCI0.PIB.PIRA, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            If (LGreater (Local0, 0x07))
                            {
                                Subtract (Local0, 0x08, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRA2)
                            }
                            Else
                            {
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRA1)
                            }
                        }

                        Return (BUFA)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x01, IRA1)
                        CreateByteField (Arg0, 0x02, IRA2)
                        If (LGreater (IRA2, Zero))
                        {
                            FindSetLeftBit (IRA2, Local0)
                            Decrement (Local0)
                            Add (Local0, 0x08, Local0)
                        }
                        Else
                        {
                            FindSetLeftBit (IRA1, Local0)
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.PIB.PIRA)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,10,12,14,15}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (Zero, \_SB.PCI0.PIB.PIRB)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.PIB.PIRB, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFB, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y10)
                                {}
                        })
                        CreateByteField (BUFB, \_SB.PCI0.PIB.LNKB._CRS._Y10._INT, IRB1)
                        CreateByteField (BUFB, 0x02, IRB2)
                        Store (\_SB.PCI0.PIB.PIRB, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            If (LGreater (Local0, 0x07))
                            {
                                Subtract (Local0, 0x08, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRB2)
                            }
                            Else
                            {
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRB1)
                            }
                        }

                        Return (BUFB)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x01, IRB1)
                        CreateByteField (Arg0, 0x02, IRB2)
                        If (LGreater (IRB2, Zero))
                        {
                            FindSetLeftBit (IRB2, Local0)
                            Decrement (Local0)
                            Add (Local0, 0x08, Local0)
                        }
                        Else
                        {
                            FindSetLeftBit (IRB1, Local0)
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.PIB.PIRB)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,11,12,14,15}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (Zero, \_SB.PCI0.PIB.PIRC)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.PIB.PIRC, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFC, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y11)
                                {}
                        })
                        CreateByteField (BUFC, \_SB.PCI0.PIB.LNKC._CRS._Y11._INT, IRC1)
                        CreateByteField (BUFC, 0x02, IRC2)
                        Store (\_SB.PCI0.PIB.PIRC, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            If (LGreater (Local0, 0x07))
                            {
                                Subtract (Local0, 0x08, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRC2)
                            }
                            Else
                            {
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRC1)
                            }
                        }

                        Return (BUFC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x01, IRC1)
                        CreateByteField (Arg0, 0x02, IRC2)
                        If (LGreater (IRC2, Zero))
                        {
                            FindSetLeftBit (IRC2, Local0)
                            Decrement (Local0)
                            Add (Local0, 0x08, Local0)
                        }
                        Else
                        {
                            FindSetLeftBit (IRC1, Local0)
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.PIB.PIRC)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12,14,15}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (Zero, \_SB.PCI0.PIB.PIRD)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.PIB.PIRD, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFD, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y12)
                                {}
                        })
                        CreateByteField (BUFD, \_SB.PCI0.PIB.LNKD._CRS._Y12._INT, IRD1)
                        CreateByteField (BUFD, 0x02, IRD2)
                        Store (\_SB.PCI0.PIB.PIRD, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            If (LGreater (Local0, 0x07))
                            {
                                Subtract (Local0, 0x08, Local2)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local2, Local3)
                                Store (Local3, IRD2)
                            }
                            Else
                            {
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, Local2)
                                Store (Local2, IRD1)
                            }
                        }

                        Return (BUFD)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x01, IRD1)
                        CreateByteField (Arg0, 0x02, IRD2)
                        If (LGreater (IRD2, Zero))
                        {
                            FindSetLeftBit (IRD2, Local0)
                            Decrement (Local0)
                            Add (Local0, 0x08, Local0)
                        }
                        Else
                        {
                            FindSetLeftBit (IRD1, Local0)
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.PIB.PIRD)
                    }
                }

                Device (DMA1)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode10,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

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
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (SPKR)
                {
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

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

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (SMEM, ResourceTemplate ()
                        {
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x000A0000,         // Address Length
                                )
                            Memory32Fixed (ReadOnly,
                                0x000E0000,         // Address Base
                                0x00020000,         // Address Length
                                )
                            Memory32Fixed (ReadOnly,
                                0xFFF00000,         // Address Base
                                0x00100000,         // Address Length
                                )
                            Memory32Fixed (ReadOnly,
                                0xFFEE0000,         // Address Base
                                0x00020000,         // Address Length
                                )
                            Memory32Fixed (ReadOnly,
                                0xFFE00000,         // Address Base
                                0x00001000,         // Address Length
                                )
                            Memory32Fixed (ReadOnly,
                                0xFFC00000,         // Address Base
                                0x00280000,         // Address Length
                                )
                            Memory32Fixed (ReadOnly,
                                0xFEE00000,         // Address Base
                                0x00001000,         // Address Length
                                )
                        })
                        Return (SMEM)
                    }
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.PIB.SMBC)
                        {
                            Name (RSR2, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0600,             // Range Minimum
                                    0x0600,             // Range Maximum
                                    0x01,               // Alignment
                                    0x10,               // Length
                                    )
                                IO (Decode16,
                                    0x00A8,             // Range Minimum
                                    0x00A9,             // Range Maximum
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
                                    0x002E,             // Range Minimum
                                    0x002E,             // Range Maximum
                                    0x01,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0x0080,             // Range Minimum
                                    0x0080,             // Range Maximum
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
                                    0xFE10,             // Range Minimum
                                    0xFE10,             // Range Maximum
                                    0x01,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0xFE00,             // Range Minimum
                                    0xFE00,             // Range Maximum
                                    0x01,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x8000,             // Range Minimum
                                    0x8000,             // Range Maximum
                                    0x01,               // Alignment
                                    0x80,               // Length
                                    _Y13)
                                IO (Decode16,
                                    0x8100,             // Range Minimum
                                    0x8100,             // Range Maximum
                                    0x01,               // Alignment
                                    0x20,               // Length
                                    _Y14)
                            })
                            CreateWordField (RSR2, \_SB.PCI0.PIB.SYSR._CRS._Y13._MIN, PMMI)
                            CreateWordField (RSR2, \_SB.PCI0.PIB.SYSR._CRS._Y13._MAX, PMMA)
                            CreateWordField (RSR2, \_SB.PCI0.PIB.SYSR._CRS._Y14._MIN, SMMI)
                            CreateWordField (RSR2, \_SB.PCI0.PIB.SYSR._CRS._Y14._MAX, SMMA)
                            And (\_SB.PCI0.PIB.PMBS, 0xFFFE, PMMI)
                            Store (PMMI, PMMA)
                            And (\_SB.PCI0.PIB.SMBS, 0xFFF0, SMMI)
                            Store (SMMI, SMMA)
                            Return (RSR2)
                        }
                        Else
                        {
                            Name (RSR1, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0080,             // Range Minimum
                                    0x0080,             // Range Maximum
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
                                    0xFE10,             // Range Minimum
                                    0xFE10,             // Range Maximum
                                    0x01,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0xFE00,             // Range Minimum
                                    0xFE00,             // Range Maximum
                                    0x01,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x8000,             // Range Minimum
                                    0x8000,             // Range Maximum
                                    0x01,               // Alignment
                                    0x80,               // Length
                                    _Y15)
                            })
                            CreateWordField (RSR1, \_SB.PCI0.PIB.SYSR._CRS._Y15._MIN, IOMI)
                            CreateWordField (RSR1, \_SB.PCI0.PIB.SYSR._CRS._Y15._MAX, IOMA)
                            And (\_SB.PCI0.PIB.PMBS, 0xFFFE, IOMI)
                            Store (IOMI, IOMA)
                            Return (RSR1)
                        }
                    }
                }

                Device (KBC)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_UID, 0x01)
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
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Name (_UID, 0x00)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    OperationRegion (SIIO, SystemIO, 0x2E, 0x02)
                    Field (SIIO, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    Mutex (N393, 0x00)
                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x07), 
                        LDN,    8, 
                                Offset (0x26), 
                        FDCE,   1, 
                        LPTE,   1, 
                        Z001,   1, 
                        Z002,   1, 
                                Offset (0x30), 
                        ACTR,   1, 
                                Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                                Offset (0x70), 
                        INTR,   8, 
                                Offset (0x74), 
                        DMCH,   8, 
                        DMCL,   8, 
                                Offset (0xF0), 
                        OPT1,   8
                    }

                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (N393, 0xFFFF)
                        Store (0x07, INDX)
                        Store (Arg0, DATA)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Release (N393)
                    }

                    Device (FDC)
                    {
                        Name (_HID, EisaId ("PNP0700"))
                        Name (_UID, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x00)
                            If (LEqual (FDCE, 0x00))
                            {
                                If (ACTR)
                                {
                                    Store (0x0F, Local0)
                                }
                                Else
                                {
                                    Store (0x0D, Local0)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }

                            EXFG ()
                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x00)
                            Store (0x00, ACTR)
                            Store (0x00, INTR)
                            Store (0x00, IOAH)
                            Store (0x00, IOAL)
                            Store (0x00, DMCH)
                            EXFG ()
                        }

                        Name (RSRC, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                _Y16)
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                _Y17)
                            IRQNoFlags (_Y18)
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, _Y19)
                                {2}
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            CreateWordField (RSRC, \_SB.PCI0.PIB.SIO.FDC._Y16._MIN, IO1L)
                            CreateWordField (RSRC, \_SB.PCI0.PIB.SIO.FDC._Y16._MAX, IO1H)
                            CreateWordField (RSRC, \_SB.PCI0.PIB.SIO.FDC._Y17._MIN, IO2L)
                            CreateWordField (RSRC, \_SB.PCI0.PIB.SIO.FDC._Y17._MAX, IO2H)
                            CreateWordField (RSRC, \_SB.PCI0.PIB.SIO.FDC._Y18._INT, IRQX)
                            CreateByteField (RSRC, \_SB.PCI0.PIB.SIO.FDC._Y19._DMA, DMAX)
                            Store (Zero, IO1L)
                            Store (Zero, IO1H)
                            Store (Zero, IO2L)
                            Store (Zero, IO2H)
                            Store (Zero, IRQX)
                            Store (Zero, DMAX)
                            ENFG (0x00)
                            Store (ACTR, Local0)
                            EXFG ()
                            If (Local0)
                            {
                                Store (_PRS, RSRC)
                            }

                            Return (RSRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {2}
                        })
                        Method (_SRS, 1, NotSerialized)
                        {
                            Store (Arg0, RSRC)
                            CreateWordField (RSRC, \_SB.PCI0.PIB.SIO.FDC._Y16._MIN, IOX)
                            CreateWordField (RSRC, \_SB.PCI0.PIB.SIO.FDC._Y18._INT, IRQX)
                            CreateByteField (RSRC, \_SB.PCI0.PIB.SIO.FDC._Y19._DMA, DMAX)
                            ENFG (0x00)
                            And (IOX, 0xFF, IOAL)
                            ShiftRight (IOX, 0x08, IOAH)
                            FindSetRightBit (IRQX, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, INTR)
                            FindSetRightBit (DMAX, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, DMCH)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("NSC6001"))
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x02)
                            If (LEqual (Z001, 0x00))
                            {
                                If (ACTR)
                                {
                                    Store (0x0F, Local0)
                                }
                                Else
                                {
                                    Store (0x0D, Local0)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }

                            EXFG ()
                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x02)
                            Store (0x00, ACTR)
                            Store (0x00, INTR)
                            Store (0x00, IOAH)
                            Store (0x00, IOAL)
                            Store (0x00, DMCH)
                            Store (0x00, DMCL)
                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            })
                            ENFG (0x02)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x09))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0A))
                                ShiftLeft (0x01, DMCH, Local0)
                                Store (Local0, Index (DCRS, 0x0C))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0D))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x09))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x0D))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x09, IRQM)
                            CreateWordField (Arg0, 0x0C, DMAM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            FindSetRightBit (DMAM, Local1)
                            Decrement (Local1)
                            ENFG (0x02)
                            Store (Local0, INTR)
                            Store (Local1, DMCH)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            Or (0x80, OPT1, OPT1)
                            EXFG ()
                        }
                    }

                    Device (ECP)
                    {
                        Name (_HID, EisaId ("PNP0401"))
                        Name (_UID, 0x03)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x04), LEqual (
                                Local0, 0x07))))
                            {
                                ShiftLeft (ACTR, 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            EXFG ()
                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x04), LEqual (
                                Local0, 0x07))))
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                                Store (0x00, DMCH)
                                Store (0x00, DMCL)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                                ShiftLeft (0x01, DMCH, Local0)
                                Store (Local0, Index (DCRS, 0x14))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x15))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                                Store (0x00, Index (DCRS, 0x14))
                                Store (0x00, Index (DCRS, 0x15))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            CreateWordField (Arg0, 0x14, DMAM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            FindSetRightBit (DMAM, Local1)
                            Decrement (Local1)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (Local1, DMCH)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (EPP)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x02)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x02), LEqual (
                                Local0, 0x03))))
                            {
                                ShiftLeft (ACTR, 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            EXFG ()
                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x02), LEqual (
                                Local0, 0x03))))
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (LPTB)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x01)))
                            {
                                ShiftLeft (ACTR, 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            EXFG ()
                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x01)))
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                If (And (Local0, 0x04))
                                {
                                    Store (0x04, Local0)
                                }
                                Else
                                {
                                    Store (0x08, Local0)
                                }

                                Store (Local0, Index (DCRS, 0x06))
                                Store (Local0, Index (DCRS, 0x07))
                                Store (Local0, Index (DCRS, 0x0E))
                                Store (Local0, Index (DCRS, 0x0F))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (LPT)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x00)))
                            {
                                ShiftLeft (ACTR, 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            EXFG ()
                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x00)))
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                If (And (Local0, 0x04))
                                {
                                    Store (0x04, Local0)
                                }
                                Else
                                {
                                    Store (0x08, Local0)
                                }

                                Store (Local0, Index (DCRS, 0x06))
                                Store (Local0, Index (DCRS, 0x07))
                                Store (Local0, Index (DCRS, 0x0E))
                                Store (Local0, Index (DCRS, 0x0F))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (COMA)
                    {
                        Name (_HID, EisaId ("PNP0501"))
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x03)
                            If (LEqual (Z002, 0x00))
                            {
                                If (ACTR)
                                {
                                    Store (0x0F, Local0)
                                }
                                Else
                                {
                                    Store (0x0D, Local0)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }

                            EXFG ()
                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x03)
                            If (ACTR)
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            })
                            ENFG (0x03)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x09))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0A))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x09))
                                Store (0x00, Index (DCRS, 0x0A))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x09, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            ENFG (0x03)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
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
                    Name (_GPE, 0x01)
                    Name (SEL0, 0xF0)
                    Name (BFLG, 0x00)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Local0)
                            If (Local0)
                            {
                                Store (0x01, ECOK)
                            }
                            Else
                            {
                                Store (0x00, ECOK)
                            }
                        }

                        If (ECOK)
                        {
                            Acquire (\_SB.PCI0.PIB.EC0.MUT1, 0xFFFF)
                            Store (\_SB.BTEN, \_SB.PCI0.PIB.EC0.BLTH)
                            Store (\_SB.WLAN, \_SB.PCI0.PIB.EC0.WLAN)
                            Store (0x01, \_SB.PCI0.PIB.EC0.CPLE)
                            Store (\_SB.ADIM, \_SB.PCI0.PIB.EC0.ADIM)
                            Release (\_SB.PCI0.PIB.EC0.MUT1)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x04), 
                        CMCM,   8, 
                        CMD1,   8, 
                        CMD2,   8, 
                        CMD3,   8, 
                                Offset (0x18), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   256, 
                        BCNT,   8, 
                        SMAA,   8, 
                        S1D0,   8, 
                        S1D1,   8, 
                        SM2A,   8, 
                        S2D0,   8, 
                        S2D1,   8, 
                        SM3A,   8, 
                        LIDS,   1, 
                        DV1S,   1, 
                        EXFD,   1, 
                        RFSW,   1, 
                            ,   1, 
                        CRTS,   1, 
                        SLPS,   1, 
                        DCKS,   1, 
                        EJBS,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        DV2S,   1, 
                        DV3S,   1, 
                        WK10,   16, 
                        EVTP,   16, 
                        BTM3,   8, 
                        DCID,   8, 
                        DPWR,   1, 
                        UDR0,   1, 
                        UDR5,   1, 
                        EQBF,   1, 
                        LDDS,   1, 
                        CRST,   1, 
                        DCWT,   1, 
                        QVCC,   1, 
                        HP4D,   8, 
                        WAKP,   16, 
                        POLL,   1, 
                        ADP,    1, 
                        ALRT,   1, 
                        B1WE,   1, 
                        B1WS,   1, 
                        B2WE,   1, 
                        B2WS,   1, 
                        BWAK,   1, 
                        PWRE,   1, 
                        ALLB,   1, 
                        AUXB,   1, 
                        S2DR,   1, 
                        S5FG,   1, 
                        F1B5,   1, 
                        F1B6,   1, 
                        RSMA,   1, 
                        S1LD,   1, 
                        S2LD,   1, 
                        ACWR,   1, 
                        PTSV,   3, 
                        PMEE,   1, 
                        ENCB,   1, 
                        F3B0,   1, 
                        F3B1,   1, 
                        RFLD,   1, 
                        F3B3,   1, 
                        CPLE,   1, 
                        LAON,   1, 
                        WLAN,   1, 
                        BLTH,   1, 
                        TMSS,   2, 
                        OSMD,   1, 
                        F4B3,   1, 
                        BANK,   4, 
                        CTMP,   8, 
                        S2DC,   8, 
                        BPD,    8, 
                        BT1I,   16, 
                        BT1C,   16, 
                        BT1V,   16, 
                        BT1S,   8, 
                        BT2I,   16, 
                        BT2C,   16, 
                        BT2V,   16, 
                        BT2S,   8, 
                            ,   4, 
                        LIDB,   1, 
                                Offset (0x67), 
                        TTMP,   8, 
                        HPCB,   8, 
                        B2LC,   8, 
                        BTEC,   8, 
                        UBDM,   4, 
                        UBPC,   3, 
                                Offset (0x6C), 
                        BTCS,   8, 
                        BMDL,   8, 
                        CBDM,   4, 
                        CBPC,   3, 
                                Offset (0x6F), 
                        HP6F,   8, 
                        HP70,   8, 
                        HP71,   8, 
                        RSMT,   16, 
                        HP74,   8, 
                        HP75,   8, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        UPP1,   1, 
                        UPP2,   1, 
                            ,   1, 
                            ,   1, 
                        BTOF,   1, 
                        SUSB,   1, 
                        SUSC,   1, 
                        CPWR,   1, 
                        CBTN,   1, 
                        FAN,    1, 
                        IWOL,   1, 
                        EWOR,   1, 
                        S4IN,   1, 
                        BLST,   1, 
                            ,   1, 
                        ADIM,   1, 
                                Offset (0x7A), 
                        QU7A,   8, 
                        QU7B,   8, 
                        QU7C,   8, 
                        QU7D,   8, 
                        QU7E,   8, 
                        QU7F,   8
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        SMW0,   16
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        SMB0,   8
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD0,   64
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD1,   128
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD2,   192
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD3,   256
                    }

                    Mutex (CMUT, 0x00)
                    Method (CMC2, 3, NotSerialized)
                    {
                        Acquire (CMUT, 0xFFFF)
                        Store (Arg2, CMD2)
                        Store (Arg1, CMD1)
                        Store (Arg0, CMCM)
                        While (CMCM) {}
                        Release (CMUT)
                    }

                    Mutex (MUT0, 0x00)
                    Mutex (MUT1, 0x00)
                    Method (SMRD, 4, NotSerialized)
                    {
                        If (LEqual (\_SB.ECOK, 0x00))
                        {
                            Return (0xFF)
                        }

                        If (LNotEqual (Arg0, 0x07))
                        {
                            If (LNotEqual (Arg0, 0x09))
                            {
                                If (LNotEqual (Arg0, 0x0B))
                                {
                                    Return (0x19)
                                }
                            }
                        }

                        Acquire (MUT0, 0xFFFF)
                        Store (0x04, Local0)
                        While (LGreater (Local0, 0x01))
                        {
                            And (SMST, 0x40, SMST)
                            Store (Arg2, SMCM)
                            Store (Arg1, SMAD)
                            Store (Arg0, SMPR)
                            While (LNot (And (SMST, 0xBF, Local1)))
                            {
                                Sleep (0x02)
                            }

                            If (LEqual (Local1, 0x80))
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Decrement (Local0)
                            }
                        }

                        If (Local0)
                        {
                            Store (And (Local1, 0x1F), Local0)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x07))
                            {
                                Store (SMB0, Arg3)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (SMW0, Arg3)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (BCNT, Local3)
                                ShiftRight (0x0100, 0x03, Local2)
                                If (LGreater (Local3, Local2))
                                {
                                    Store (Local2, Local3)
                                }

                                If (LLess (Local3, 0x09))
                                {
                                    Store (FLD0, Local2)
                                }
                                Else
                                {
                                    If (LLess (Local3, 0x11))
                                    {
                                        Store (FLD1, Local2)
                                    }
                                    Else
                                    {
                                        If (LLess (Local3, 0x19))
                                        {
                                            Store (FLD2, Local2)
                                        }
                                        Else
                                        {
                                            Store (FLD3, Local2)
                                        }
                                    }
                                }

                                Increment (Local3)
                                Store (Buffer (Local3) {}, Local4)
                                Decrement (Local3)
                                Store (Zero, Local5)
                                While (LGreater (Local3, Local5))
                                {
                                    GBFE (Local2, Local5, RefOf (Local6))
                                    PBFE (Local4, Local5, Local6)
                                    Increment (Local5)
                                }

                                PBFE (Local4, Local5, 0x00)
                                Store (Local4, Arg3)
                            }
                        }

                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (SMWR, 4, NotSerialized)
                    {
                        If (LEqual (\_SB.ECOK, 0x00))
                        {
                            Return (0xFF)
                        }

                        If (LNotEqual (Arg0, 0x06))
                        {
                            If (LNotEqual (Arg0, 0x08))
                            {
                                If (LNotEqual (Arg0, 0x0A))
                                {
                                    Return (0x19)
                                }
                            }
                        }

                        Acquire (MUT0, 0xFFFF)
                        Store (0x04, Local0)
                        While (LGreater (Local0, 0x01))
                        {
                            If (LEqual (Arg0, 0x06))
                            {
                                Store (Arg3, SMB0)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (Arg3, SMW0)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (Arg3, SMD0)
                            }

                            And (SMST, 0x40, SMST)
                            Store (Arg2, SMCM)
                            Store (Arg1, SMAD)
                            Store (Arg0, SMPR)
                            While (LNot (And (SMST, 0xBF, Local1)))
                            {
                                Sleep (0x02)
                            }

                            If (LEqual (Local1, 0x80))
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Decrement (Local0)
                            }
                        }

                        If (Local0)
                        {
                            Store (And (Local1, 0x1F), Local0)
                        }

                        Release (MUT0)
                        Return (Local0)
                    }

                    Name (ACFL, 0x00)
                    Method (SMSL, 0, NotSerialized)
                    {
                        Store ("CMBatt - SMSL", Debug)
                        If (LEqual (\_SB.ECOK, 0x00))
                        {
                            Return (0xFF)
                        }

                        Acquire (\_SB.PCI0.PIB.EC0.MUT1, 0xFFFF)
                        If (LNot (\_SB.PCI0.PIB.EC0.SMRD (0x09, 0x14, 0x01, RefOf (Local0))))
                        {
                            Store (Local0, SEL0)
                            Store (SEL0, Debug)
                            If (LEqual (ALRT, 0x01))
                            {
                                \_SB.BAT1.IVBI ()
                                \_SB.BAT1.IVBS ()
                                Store (0x00, ALRT)
                            }

                            Store (\_SB.ACAD.CHAC (SEL0), Local1)
                            Store (\_SB.BAT1.CHBP (SEL0), Local2)
                            Or (SEL0, 0x0FFF, Local0)
                            SMWR (0x08, 0x14, 0x01, Local0)
                            If (LAnd (Local1, \_SB.ACAD.ACP))
                            {
                                Store ("CMBatt - Notify(ACAD,0x80): AC_Inserted", Debug)
                                Notify (\_SB.ACAD, 0x80)
                                Store (0x02, ACFL)
                            }

                            If (And (0x04, Local2))
                            {
                                \_SB.BAT1.B1CK ()
                            }

                            If (And (0x02, Local2))
                            {
                                \_SB.BAT1.B1ST ()
                            }

                            If (And (0x01, Local2))
                            {
                                \_SB.BAT1.B1IF ()
                            }

                            If (LAnd (Local1, LNot (\_SB.ACAD.ACP)))
                            {
                                Store ("CMBatt - Notify(ACAD, 0x80): AC_Removed", Debug)
                                Notify (\_SB.ACAD, 0x80)
                                Store (0x01, ACFL)
                            }
                        }

                        Store (0x3C, Local4)
                        If (\_SB.BAT1.REPT)
                        {
                            Store (0x02, Local4)
                        }

                        If (BFLG)
                        {
                            Store (0x01, Local5)
                            While (LNot (And (BFLG, 0x01)))
                            {
                                Increment (Local5)
                                ShiftRight (BFLG, 0x01, BFLG)
                            }

                            ShiftRight (BFLG, 0x01, BFLG)
                            If (LGreater (Local4, Local5))
                            {
                                Store (Local5, Local4)
                            }
                        }

                        Store (Local4, BPD)
                        BPOL ()
                        Release (\_SB.PCI0.PIB.EC0.MUT1)
                        If (ACFL)
                        {
                            Decrement (ACFL)
                            Store (0x00, ACFL)
                        }
                    }

                    Name (PSTA, 0x00)
                    Method (CPOL, 0, NotSerialized)
                    {
                        If (LEqual (PSTA, 0x00))
                        {
                            If (LNotEqual (ECOK, 0x00))
                            {
                                BPOL ()
                                Store (0x01, PSTA)
                            }
                        }
                    }

                    Method (BPOL, 0, NotSerialized)
                    {
                        Store (0x01, POLL)
                    }

                    Method (_Q09, 0, NotSerialized)
                    {
                        Store ("QUERY_09", Debug)
                        SMSL ()
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q0E, 0, NotSerialized)
                    {
                        Z003 ()
                    }

                    Method (_Q0F, 0, NotSerialized)
                    {
                        Store (\_SB.PCI0.PIB.BLIT, Local0)
                        XOr (Local0, 0x01, Local0)
                        Store (Local0, \_SB.PCI0.PIB.BLIT)
                        If (\_SB.ECOK)
                        {
                            XOr (Local0, 0x01, Local1)
                            Acquire (\_SB.PCI0.PIB.EC0.MUT1, 0xFFFF)
                            Store (Local1, \_SB.PCI0.PIB.EC0.BLST)
                            Release (\_SB.PCI0.PIB.EC0.MUT1)
                        }
                    }

                    Method (_Q15, 0, NotSerialized)
                    {
                        Notify (\_SB.LID, 0x80)
                    }

                    Method (_Q20, 0, NotSerialized)
                    {
                        Store ("QUERY_20", Debug)
                        If (And (SMST, 0x40))
                        {
                            Store (SMAA, Local0)
                            If (LEqual (Local0, 0x14))
                            {
                                And (SMST, 0xBF, SMST)
                                If (PWRE)
                                {
                                    Store ("CMBatt - PwrEvent", Debug)
                                    Store (0x00, PWRE)
                                    Store (0x12, BFLG)
                                    Store (0x00, BPD)
                                    BPOL ()
                                }
                            }
                        }
                    }

                    Method (_Q8E, 0, NotSerialized)
                    {
                        SMSL ()
                        Notify (\_SB.BAT1, 0x80)
                    }

                    Name (CPUT, 0x00)
                    Method (_Q80, 0, NotSerialized)
                    {
                        Store (0x80, P80H)
                        If (LEqual (CPUV, 0x01))
                        {
                            If (\_SB.ECOK)
                            {
                                Acquire (\_SB.PCI0.PIB.EC0.MUT1, 0xFFFF)
                                Store (\_SB.PCI0.PIB.EC0.CTMP, Local0)
                                Release (\_SB.PCI0.PIB.EC0.MUT1)
                            }
                            Else
                            {
                                Store (0x32, Local0)
                            }

                            Subtract (Local0, \_SB.TOFF, Local0)
                            If (LGreaterEqual (Local0, 0x5B))
                            {
                                Notify (\_TZ.THRM, 0x80)
                            }

                            If (LGreaterEqual (Local0, 0x50))
                            {
                                Store (0x01, CPUT)
                                Store (PNUM, Local1)
                                If (LLess (\_PR.CPU0._PPC, Local1))
                                {
                                    Store (Local1, \_PR.CPU0._PPC)
                                    Notify (\_PR.CPU0, 0x80)
                                    Sleep (0x01F4)
                                }
                            }
                            Else
                            {
                                If (LLessEqual (Local0, 0x46))
                                {
                                    Store (0x00, CPUT)
                                    Store (0x00, Local1)
                                    If (LNotEqual (\_PR.CPU0._PPC, 0x00))
                                    {
                                        Store (0x00, \_PR.CPU0._PPC)
                                        Notify (\_PR.CPU0, 0x80)
                                        Sleep (0x01F4)
                                    }
                                }
                            }
                        }
                    }

                    Method (_Q8B, 0, NotSerialized)
                    {
                        If (LEqual (CPUV, 0x01))
                        {
                            Store (PNUM, Local0)
                            Decrement (Local0)
                            If (LLess (\_PR.CPU0._PPC, Local0))
                            {
                                Store (Local0, \_PR.CPU0._PPC)
                                Notify (\_PR.CPU0, 0x80)
                                Sleep (0x01F4)
                            }
                        }
                    }

                    Method (_Q8C, 0, NotSerialized)
                    {
                        If (LEqual (CPUV, 0x01))
                        {
                            If (LEqual (CPUT, 0x00))
                            {
                                If (LNotEqual (\_PR.CPU0._PPC, 0x00))
                                {
                                    Store (0x00, \_PR.CPU0._PPC)
                                    Notify (\_PR.CPU0, 0x80)
                                    Sleep (0x01F4)
                                }
                            }
                        }
                    }

                    Method (Z003, 0, NotSerialized)
                    {
                        Store ("Hot-Keys: ----- _Q0C", Debug)
                        If (LEqual (\_SB.PCI0.AGP.VGA.SWIT, 0x00))
                        {
                            Store (0x03, Local0)
                            Increment (\_SB.PCI0.AGP.VGA.TOGF)
                            While (LNotEqual (And (Local0, \_SB.PCI0.AGP.VGA.TOGF), \_SB.PCI0.AGP.VGA.TOGF))
                            {
                                Increment (\_SB.PCI0.AGP.VGA.TOGF)
                                If (LGreater (\_SB.PCI0.AGP.VGA.TOGF, 0x04))
                                {
                                    Store (One, \_SB.PCI0.AGP.VGA.TOGF)
                                }
                            }

                            Store (\_SB.PCI0.AGP.VGA.TOGF, Local0)
                            If (LEqual (Local0, 0x02))
                            {
                                Store ("LCD", Debug)
                                Store (Zero, \_SB.PCI0.AGP.VGA.CRTA)
                                Store (One, \_SB.PCI0.AGP.VGA.LCDA)
                                Store (Zero, \_SB.PCI0.AGP.VGA.TVA)
                            }

                            If (LEqual (Local0, 0x01))
                            {
                                Store ("CRT", Debug)
                                Store (One, \_SB.PCI0.AGP.VGA.CRTA)
                                Store (Zero, \_SB.PCI0.AGP.VGA.LCDA)
                                Store (Zero, \_SB.PCI0.AGP.VGA.TVA)
                            }

                            If (LEqual (Local0, 0x03))
                            {
                                Store ("Both", Debug)
                                Store (One, \_SB.PCI0.AGP.VGA.CRTA)
                                Store (One, \_SB.PCI0.AGP.VGA.LCDA)
                                Store (Zero, \_SB.PCI0.AGP.VGA.TVA)
                            }

                            If (LEqual (Local0, 0x04))
                            {
                                Store ("TV", Debug)
                                Store (Zero, \_SB.PCI0.AGP.VGA.TOGF)
                                Store (Zero, \_SB.PCI0.AGP.VGA.CRTA)
                                Store (Zero, \_SB.PCI0.AGP.VGA.LCDA)
                                Store (One, \_SB.PCI0.AGP.VGA.TVA)
                            }

                            Notify (\_SB.PCI0.AGP.VGA, 0x80)
                        }
                        Else
                        {
                        }
                    }
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x00100000)
                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x00100001)
                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x00100002)
                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (GIGA)
            {
                Name (_ADR, 0x000B0000)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x04
                })
                Name (LANP, 0x00)
                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (0x00, LANP)
                    }
                    Else
                    {
                        Store (0x01, LANP)
                    }
                }
            }

            Device (Z000)
            {
                Name (_ADR, 0x00110006)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Name (REGT, Package (0x15)
            {
                0x10, 
                0x20, 
                0x21, 
                0x22, 
                0x23, 
                0x33, 
                0x34, 
                0x35, 
                0x36, 
                0x37, 
                0x47, 
                0x48, 
                0x49, 
                0x4A, 
                0x4B, 
                0x4C, 
                0x5C, 
                0x5D, 
                0x5E, 
                0x5F, 
                0x6F
            })
            Name (DMTT, Package (0x07)
            {
                0x0F, 
                0x14, 
                0x1E, 
                0x2D, 
                0x3C, 
                0x4B, 
                0x78
            })
            Name (PIOT, Package (0x07)
            {
                0x0258, 
                0x017F, 
                0xF0, 
                0xB4, 
                0x78, 
                0x5A, 
                0x00
            })
            Device (IDE)
            {
                Name (_ADR, 0x00110001)
                OperationRegion (PCI, PCI_Config, 0x48, 0x60)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    SDR1,   8, 
                    SDR0,   8, 
                    PDR1,   8, 
                    PDR0,   8, 
                    SDST,   4, 
                    PDST,   4, 
                            Offset (0x08), 
                    UDMS,   16, 
                    UDMP,   16
                }

                Name (Z004, 0x00)
                Name (Z005, 0x00)
                Method (_PS3, 0, NotSerialized)
                {
                    And (^UDMP, 0x10, ^Z004)
                    And (^UDMS, 0x10, ^Z005)
                }

                Method (_PS0, 0, NotSerialized)
                {
                    If (^Z004)
                    {
                        Or (^UDMP, ^Z004, Local0)
                        Or (Local0, ShiftLeft (^Z004, 0x08), ^UDMP)
                    }

                    If (^Z005)
                    {
                        Or (^UDMS, ^Z005, Local0)
                        Or (Local0, ShiftLeft (^Z005, 0x08), ^UDMS)
                    }
                }

                Method (GIDX, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (0x00, Local1)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x0E))
                        {
                            Store (0x06, Local1)
                        }
                        Else
                        {
                            Add (ShiftRight (Arg0, 0x01), 0x01, Local1)
                        }
                    }

                    Return (Local1)
                }

                Method (RIDX, 1, NotSerialized)
                {
                    Store (0x00, Local0)
                    While (NAnd (LLess (Local0, 0x07), LEqual (DerefOf (Index (^^DMTT, Local0
                        )), Arg0)))
                    {
                        Increment (Local0)
                    }

                    If (Local0)
                    {
                        If (LGreater (Local0, 0x06))
                        {
                            Store (0x0E, Local0)
                        }
                        Else
                        {
                            Subtract (ShiftLeft (Local0, 0x01), 0x01, Local0)
                            If (LNotEqual (Local0, 0x01))
                            {
                                Decrement (Local0)
                            }
                        }
                    }

                    Return (Local0)
                }

                Method (GTM, 3, NotSerialized)
                {
                    Store (Buffer (0x14) {}, Local0)
                    CreateDWordField (Local0, 0x00, PIO0)
                    CreateDWordField (Local0, 0x04, DMA0)
                    CreateDWordField (Local0, 0x08, PIO1)
                    CreateDWordField (Local0, 0x0C, DMA1)
                    CreateDWordField (Local0, 0x10, FLAG)
                    Store (Zero, FLAG)
                    Or (FLAG, 0x10, FLAG)
                    Add (And (Arg1, 0x0F), ShiftRight (Arg1, 0x04), Local1)
                    Add (Local1, 0x02, Local1)
                    Multiply (Local1, 0x1E, PIO0)
                    Or (FLAG, 0x02, FLAG)
                    Add (And (Arg2, 0x0F), ShiftRight (Arg2, 0x04), Local1)
                    Add (Local1, 0x02, Local1)
                    Multiply (Local1, 0x1E, PIO1)
                    Or (FLAG, 0x08, FLAG)
                    And (Arg0, 0x0F, Local1)
                    If (And (Arg0, 0xE0))
                    {
                        Or (FLAG, 0x04, FLAG)
                        Store (^GIDX (Local1), Local1)
                    }
                    Else
                    {
                        Store (0x06, Local1)
                    }

                    Store (DerefOf (Index (^^DMTT, Local1)), DMA1)
                    ShiftRight (And (Arg0, 0x0F00), 0x08, Local1)
                    If (And (Arg0, 0xE000))
                    {
                        Or (FLAG, 0x01, FLAG)
                        Store (^GIDX (Local1), Local1)
                    }
                    Else
                    {
                        Store (0x06, Local1)
                    }

                    Store (DerefOf (Index (^^DMTT, Local1)), DMA0)
                    Return (Local0)
                }

                Method (STM, 3, NotSerialized)
                {
                    Store (Buffer (0x05) {}, Local7)
                    CreateWordField (Local7, 0x00, UDMT)
                    CreateWordField (Local7, 0x02, PIOT)
                    CreateByteField (Local7, 0x04, R4CT)
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Store (FLAG, Local4)
                    Store (0x0E0E, Local1)
                    If (And (Local4, 0x01))
                    {
                        And (Local1, 0x0F, Local1)
                        Store (^RIDX (DMA0), Local3)
                        Or (Local3, 0xE0, Local3)
                        Or (ShiftLeft (Local3, 0x08), Local1, Local1)
                    }

                    If (And (Local4, 0x04))
                    {
                        And (Local1, 0xFF00, Local1)
                        Store (^RIDX (DMA1), Local3)
                        Or (Local3, 0xE0, Local3)
                        Or (Local3, Local1, Local1)
                    }

                    Store (Local1, UDMT)
                    Store (0x0A, Local2)
                    If (And (Local4, 0x02))
                    {
                        Divide (PIO0, 0x1E, , Local3)
                        Subtract (Local3, 0x03, Local3)
                        If (LLess (Local3, 0x0C))
                        {
                            And (Local2, 0x03, Local2)
                            Or (Local2, 0x04, Local2)
                        }

                        Store (ShiftLeft (DerefOf (Index (^^REGT, Local3)), 0x08), Local6)
                    }
                    Else
                    {
                        Store (0x00, Local6)
                    }

                    If (And (Local4, 0x08))
                    {
                        Divide (PIO1, 0x1E, , Local3)
                        Subtract (Local3, 0x03, Local3)
                        If (LLess (Local3, 0x0C))
                        {
                            And (Local2, 0x0C, Local2)
                            Or (Local2, 0x01, Local2)
                        }

                        Store (DerefOf (Index (^^REGT, Local3)), Local6)
                    }
                    Else
                    {
                        Store (And (Local6, 0xFF00), Local6)
                    }

                    Store (Local2, R4CT)
                    Store (Local6, PIOT)
                    Return (Local7)
                }

                Method (GTF, 3, NotSerialized)
                {
                    If (Arg2)
                    {
                        Store (Buffer (0x07)
                            {
                                0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                            }, Local7)
                    }
                    Else
                    {
                        Store (Buffer (0x07)
                            {
                                0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                            }, Local7)
                    }

                    CreateByteField (Local7, 0x01, MODE)
                    Add (And (Arg0, 0x0F), ShiftRight (Arg0, 0x04), Local1)
                    Add (Local1, 0x02, Local1)
                    Multiply (Local1, 0x1E, Local0)
                    Store (Match (^^PIOT, MLT, Local0, MTR, 0x00, 0x00), Local1)
                    If (Local1)
                    {
                        Decrement (Local1)
                    }

                    If (And (Arg1, 0xE0))
                    {
                        Store (^GIDX (And (Arg1, 0x0F)), Local0)
                        If (LGreater (Local0, 0x06))
                        {
                            Store (0x00, Local0)
                        }
                        Else
                        {
                            Subtract (0x06, Local0, Local0)
                        }

                        Or (Local0, 0x40, MODE)
                    }
                    Else
                    {
                        Or (Local1, 0x08, MODE)
                    }

                    Concatenate (Local7, Local7, Local6)
                    Or (Local1, 0x08, MODE)
                    Concatenate (Local6, Local7, Local5)
                    Return (Local5)
                }

                Device (PRIM)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Store ("GTM - Primary Controller", Debug)
                        Store (^^GTM (^^UDMP, ^^PDR0, ^^PDR1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store ("STM - Primary Controller", Debug)
                        Store (^^STM (Arg0, Arg1, Arg2), Local0)
                        CreateWordField (Local0, 0x00, UDMA)
                        CreateWordField (Local0, 0x02, PIOM)
                        CreateByteField (Local0, 0x04, ADST)
                        Store (Or (UDMA, And (^^UDMP, 0x1010)), ^^UDMP)
                        Store (And (PIOM, 0xFF), Local1)
                        If (Local1)
                        {
                            Store (Local1, ^^PDR1)
                        }

                        ShiftRight (PIOM, 0x08, Local1)
                        If (Local1)
                        {
                            Store (Local1, ^^PDR0)
                        }

                        Store (ADST, ^^PDST)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Primary Master", Debug)
                            ShiftRight (^^^UDMP, 0x08, Local0)
                            Store (^^^GTF (^^^PDR0, Local0, 0x01), Local0)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Primary Slave", Debug)
                            Store (^^^GTF (^^^PDR1, ^^^UDMP, 0x00), Local0)
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
                        Store (^^GTM (^^UDMS, ^^SDR0, ^^SDR1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store ("STM - Secondary Controller", Debug)
                        Store (^^STM (Arg0, Arg1, Arg2), Local0)
                        CreateWordField (Local0, 0x00, DMAS)
                        CreateWordField (Local0, 0x02, PIOS)
                        CreateByteField (Local0, 0x04, ADSS)
                        Store (Or (DMAS, And (^^UDMS, 0x1010)), ^^UDMS)
                        And (PIOS, 0xFF, Local1)
                        If (Local1)
                        {
                            Store (Local1, ^^SDR1)
                        }

                        ShiftRight (PIOS, 0x08, Local1)
                        If (Local1)
                        {
                            Store (Local1, ^^SDR0)
                        }

                        Store (ADSS, ^^SDST)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Secondary Master", Debug)
                            ShiftRight (^^^UDMS, 0x08, Local0)
                            Store (^^^GTF (^^^SDR0, Local0, 0x01), Local0)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Secondary Slave", Debug)
                            Store (^^^GTF (^^^SDR1, ^^^UDMS, 0x00), Local0)
                            Return (Local0)
                        }
                    }
                }
            }

            Device (AMD3)
            {
                Name (_ADR, 0x00180003)
                OperationRegion (K8F3, PCI_Config, 0xE0, 0x10)
                Field (K8F3, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x05), 
                    Z006,   6
                }

                Method (_INI, 0, NotSerialized)
                {
                    Store (Z006, \_SB.TOFF)
                }
            }
        }
    }
}

