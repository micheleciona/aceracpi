/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080213
 *
 * Disassembly of 380, Mon Apr  7 22:34:30 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000483F (18495)
 *     Revision         0x01
 *     Checksum         0x48
 *     OEM ID           "INTEL "
 *     OEM Table ID     "MONTARAG"
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x0100000E (16777230)
 */
DefinitionBlock ("380.aml", "DSDT", 1, "INTEL ", "MONTARAG", 0x06040000)
{
    External (\_PR_.CPU0)
    External (\_PR_.CPU0.CSTX)

    OperationRegion (PORT, SystemIO, 0x80, 0x02)
    Field (PORT, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x08)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
        TRP0,   8
    }

    OperationRegion (PMIO, SystemIO, 0x1000, 0x4F)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
                Offset (0x03), 
        PBEN,   8
    }

    OperationRegion (GPIO, SystemIO, 0x1180, 0x3C)
    Field (GPIO, ByteAcc, NoLock, Preserve)
    {
        GU00,   8, 
        GU01,   8, 
        GU02,   8, 
        GU03,   8, 
        GIO0,   8, 
        GIO1,   8, 
        GIO2,   8, 
        GIO3,   8, 
                Offset (0x0C), 
        GL00,   8, 
        GL01,   8, 
        GL02,   8, 
        GL03,   8, 
                Offset (0x18), 
        GB00,   8, 
        GB01,   8, 
        GB02,   8, 
        GB03,   8, 
                Offset (0x2C), 
        GIV0,   8, 
        GIV1,   8, 
        GIV2,   8, 
        GIV3,   8, 
        GU04,   8, 
        GU05,   8, 
        GU06,   8, 
        GU07,   8, 
        GIO4,   8, 
        GIO5,   8, 
        GIO6,   8, 
        GIO7,   8, 
            ,   1, 
            ,   1, 
        CPEN,   1, 
                Offset (0x39), 
        GL05,   8, 
        GL06,   8, 
        GL07,   8
    }

    OperationRegion (MNVS, SystemMemory, 0x1EEE8F09, 0x40)
    Field (MNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        LCKF,   8, 
        PRM4,   8, 
        PRM5,   8, 
        DBGS,   8, 
        EZPT,   4, 
        CDCK,   4, 
        FPEN,   8, 
        FPST,   8, 
        LIDS,   8, 
        PWRS,   8, 
                Offset (0x14), 
        CMAP,   8, 
        CMBP,   8, 
        LPTP,   8, 
        FDCP,   8, 
        BTEN,   8, 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
                Offset (0x20), 
        BVAL,   32, 
        TMP0,   8, 
        TMP1,   8, 
        TMP2,   8, 
        TMP3,   8, 
        TMP4,   32, 
        TMP5,   32, 
        IGDS,   8, 
        LCDA,   16, 
        TLST,   8, 
        CADL,   16, 
        PADL,   16, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        BLCS,   8, 
        BRTL,   8
    }

    Field (MNVS, AnyAcc, Lock, Preserve)
    {
                Offset (0x20), 
        Z000,   8
    }

    Mutex (MUTX, 0x00)
    Name (_S0, Package (0x03)
    {
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x03)
    {
        0x05, 
        0x05, 
        0x00
    })
    Name (_S4, Package (0x03)
    {
        0x06, 
        0x06, 
        0x00
    })
    Name (_S5, Package (0x03)
    {
        0x07, 
        0x07, 
        0x00
    })
    Name (\GPIC, 0x00)
    Name (\CTYP, 0x00)
    Name (\ECON, 0x00)
    Name (\DSEN, 0x01)
    Name (\DSTS, 0x00)
    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        If (DBGS)
        {
            Store (0x00, CPEN)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x50, SMIF)
            Store (Zero, TRP0)
        }

        If (LGreaterEqual (Arg0, 0x04))
        {
            Store (0x33, SMIF)
            Store (Zero, TRP0)
            And (PBEN, 0xFE, PBEN)
            If (LEqual (Arg0, 0x04))
            {
                Store (0x10, GB03)
                Store (0x39, SMIF)
                Store (Zero, TRP0)
            }
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0x53, SMIF)
            Store (Zero, TRP0)
        }

        If (LGreaterEqual (OSYS, 0x07D1))
        {
            Store (0x23, SMIF)
            Store (Zero, TRP0)
            Notify (\_SB.BAT0, 0x80)
            Sleep (0x0320)
            Notify (\_SB.BAT0, 0x81)
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0x33, SMIF)
            Store (Zero, TRP0)
            Store (0x53, SMIF)
            Store (Zero, TRP0)
            And (PBEN, 0xFE, PBEN)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (0x00, P80H)
        If (DBGS)
        {
            Store (0x01, CPEN)
        }

        Store (0x51, SMIF)
        Store (0x00, TRP0)
        If (LEqual (Arg0, 0x03))
        {
            Store (0x88, \_SB.PCI0.LPCB.EC.P54S)
            Store (0x82, \_SB.PCI0.LPCB.EC.P54T)
            Store (0x00, \_SB.PCI0.LPCB.EC.P55S)
            Store (0x00, \_SB.PCI0.LPCB.EC.P55T)
            Store (\_SB.PCI0.LPCB.EC.COMD (0xC5, 0x1A), Local0)
            If (LEqual (Local0, 0x01))
            {
                Store (0x8A, \_SB.PCI0.LPCB.EC.P62S)
            }
            Else
            {
                Store (0x9A, \_SB.PCI0.LPCB.EC.P62S)
            }

            Store (0x52, SMIF)
            Store (0x00, TRP0)
            If (LEqual (TMP0, 0x01))
            {
                Store (0x00, TMP0)
            }
            Else
            {
                Notify (\_SB.SLP2, 0x02)
            }
        }

        If (LEqual (OSYS, 0x07D0))
        {
            Store (0x23, SMIF)
            Store (Zero, TRP0)
            Notify (\_SB.BAT0, 0x80)
            Sleep (0x0320)
            Notify (\_SB.BAT0, 0x81)
        }

        Return (Package (0x02)
        {
            0x00, 
            0x00
        })
    }

    Scope (\_GPE)
    {
    }

    Scope (_TZ)
    {
        Name (T4FG, 0x00)
        Name (SBFG, 0x00)
        Name (CBFG, 0x00)
        Name (TBSE, 0x0AAC)
        Name (DCRT, 0x0DCC)
        ThermalZone (THRS)
        {
            Method (_TMP, 0, NotSerialized)
            {
                Store ("SYST of _TMP =", Debug)
                If (LEqual (T4FG, 0x01))
                {
                    Store (0x01, SBFG)
                    Store (0x50, Local0)
                    Return (Add (Multiply (Local0, 0x0A), TBSE))
                }
                Else
                {
                    Store (0x00, SMIF)
                    Store (Zero, TRP0)
                    Store (ACTT, Local0)
                    And (Local0, 0x80, Local1)
                    If (LEqual (Local1, 0x80))
                    {
                        Store (0x1E, Local0)
                    }
                    Else
                    {
                        If (LLessEqual (Local0, 0x10))
                        {
                            Store (0x11, Local0)
                        }
                    }

                    If (LEqual (SBFG, 0x00))
                    {
                        Store (0x02, SMIF)
                        Store (Zero, TRP0)
                        Store (TSPV, Local1)
                        If (LLessEqual (Local1, Local0))
                        {
                            Store (0x01, T4FG)
                        }

                        Store (0x01, SBFG)
                    }

                    Return (Add (Multiply (Local0, 0x0A), TBSE))
                }
            }

            Method (_CRT, 0, NotSerialized)
            {
                Store ("SYS T5 _CRT =", Debug)
                Store (0x04, SMIF)
                Store (Zero, TRP0)
                Store (CRTT, Local0)
                Return (Add (Multiply (Local0, 0x0A), TBSE))
            }

            Method (_SCP, 1, NotSerialized)
            {
                Store ("_SCP", Debug)
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Method (_PSV, 0, NotSerialized)
            {
                Store ("SYS T4 _CRT =", Debug)
                Store (0x02, SMIF)
                Store (Zero, TRP0)
                Store (TSPV, Local0)
                Return (Add (Multiply (Local0, 0x0A), TBSE))
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x05)
            Name (_TSP, 0x012C)
        }

        ThermalZone (THRC)
        {
            Method (_TMP, 0, NotSerialized)
            {
                Store ("CPU _TMP =", Debug)
                If (LEqual (T4FG, 0x01))
                {
                    Store (0x01, CBFG)
                    Store (0x5F, Local0)
                    Return (Add (Multiply (Local0, 0x0A), TBSE))
                }
                Else
                {
                    Store (0x01, SMIF)
                    Store (Zero, TRP0)
                    Store (ACTT, Local0)
                    And (Local0, 0x80, Local1)
                    If (LEqual (Local1, 0x80))
                    {
                        Store (0x1E, Local0)
                    }
                    Else
                    {
                        If (LLessEqual (Local0, 0x10))
                        {
                            Store (0x11, Local0)
                        }
                    }

                    If (LEqual (CBFG, 0x00))
                    {
                        Store (0x03, SMIF)
                        Store (Zero, TRP0)
                        Store (TSPV, Local1)
                        If (LLessEqual (Local1, Local0))
                        {
                            Store (0x01, T4FG)
                        }

                        Store (0x01, CBFG)
                    }

                    Return (Add (Multiply (Local0, 0x0A), TBSE))
                }
            }

            Method (_CRT, 0, NotSerialized)
            {
                Store ("CPU T5 _CRT =", Debug)
                Store (0x05, SMIF)
                Store (Zero, TRP0)
                Store (CRTT, Local0)
                Store (Local0, Debug)
                Return (Add (Multiply (Local0, 0x0A), TBSE))
            }

            Method (_SCP, 1, NotSerialized)
            {
                Store ("_SCP", Debug)
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Method (_PSV, 0, NotSerialized)
            {
                Store ("CPU T4 _CRT =", Debug)
                Store (0x03, SMIF)
                Store (Zero, TRP0)
                Store (TSPV, Local0)
                Return (Add (Multiply (Local0, 0x0A), TBSE))
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x05)
            Name (_TSP, 0x012C)
        }
    }

    Scope (\_SB)
    {
        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Name (BP, 0x01)
            Name (IBP, 0x00)
            Name (PSTA, 0x1F)
            Name (CHAR, 0x01)
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
                        "        "
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

            Name (PBIF, Package (0x0D)
            {
                0x01, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x01, 
                0xFFFFFFFF, 
                0x1E, 
                0x14, 
                0x0A, 
                0x0D8E, 
                "BAT0", 
                " ", 
                " ", 
                "    "
            })
            Name (PBST, Package (0x04)
            {
                0x00, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x39D0
            })
            Name (UBIF, 0x01E9)
            Name (SMBF, Zero)
            Method (_STA, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPCB.EC.ECOK)
                {
                    Store (\_SB.PCI0.LPCB.EC.COMD (0xC5, 0x1A), Local0)
                    If (LEqual (Local0, 0x01))
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
                    Return (0x0F)
                }
            }

            Method (_BIF, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPCB.EC.ECOK)
                {
                    Store (\_SB.PCI0.LPCB.EC.COMD (0xC5, 0x1A), Local0)
                    If (LEqual (Local0, 0x01))
                    {
                        IVBI ()
                    }
                    Else
                    {
                        UPBI ()
                    }
                }
                Else
                {
                    IVBI ()
                }

                Store ("BAT0_BIF_RETURN:", Debug)
                Return (PBIF)
            }

            Method (_BST, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPCB.EC.ECOK)
                {
                    Store (\_SB.PCI0.LPCB.EC.COMD (0xC5, 0x1A), Local0)
                    If (LEqual (Local0, 0x01))
                    {
                        IVBS ()
                    }
                    Else
                    {
                        UPBS ()
                    }
                }
                Else
                {
                    IVBS ()
                }

                Store ("BAT0_BST_RETURN:", Debug)
                Return (PBST)
            }

            Method (IVBI, 0, NotSerialized)
            {
                Store (0x01E9, UBIF)
                Store (0xFFFFFFFF, Index (PBIF, 0x01))
                Store (0xFFFFFFFF, Index (PBIF, 0x02))
                Store (0xFFFFFFFF, Index (PBIF, 0x04))
                Store ("Bad", Index (PBIF, 0x09))
                Store ("Bad", Index (PBIF, 0x0A))
                Store ("Bad", Index (PBIF, 0x0B))
                Store ("Bad", Index (PBIF, 0x0C))
            }

            Method (IVBS, 0, NotSerialized)
            {
                Store (Zero, Index (PBST, 0x00))
                Store (0xFFFFFFFF, Index (PBST, 0x01))
                Store (0xFFFFFFFF, Index (PBST, 0x02))
                Store (0xFFFFFFFF, Index (PBST, 0x03))
            }

            Method (UPBI, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPCB.EC.RAMR (0xC5, 0x03), Local6)
                If (LEqual (Local6, 0x30))
                {
                    Store (0x11, Z000)
                }
                Else
                {
                    Store (0x07, Z000)
                }

                If (LEqual (Z000, 0x07))
                {
                    Store (0x0708, Index (PBIF, 0x01))
                    Store (0x0708, Index (PBIF, 0x02))
                    Store (0x39D0, Index (PBIF, 0x04))
                    Store (0x40, Index (PBIF, 0x05))
                    Store (0x36, Index (PBIF, 0x06))
                    Store (0x0A, Index (PBIF, 0x07))
                    Store (0x06C8, Index (PBIF, 0x08))
                    Store ("Bat 4Cell", Index (PBIF, 0x09))
                    Store ("236", Index (PBIF, 0x0A))
                    Store ("Lion", Index (PBIF, 0x0B))
                }

                If (LEqual (Z000, 0x11))
                {
                    Store (0x1130, Index (PBIF, 0x01))
                    Store (0x1130, Index (PBIF, 0x02))
                    Store (0x2B5C, Index (PBIF, 0x04))
                    Store (0x98, Index (PBIF, 0x05))
                    Store (0x84, Index (PBIF, 0x06))
                    Store (0x0A, Index (PBIF, 0x07))
                    Store (0x1098, Index (PBIF, 0x08))
                    Store ("Bat 6Cell", Index (PBIF, 0x09))
                    Store ("236", Index (PBIF, 0x0A))
                    Store ("Lion", Index (PBIF, 0x0B))
                }

                Store ("Acer", Index (PBIF, 0x0C))
            }

            Method (UPBS, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPCB.EC.RAMR (0xC7, 0x03), Local0)
                Store (\_SB.PCI0.LPCB.EC.COMD (0xC5, 0x19), Local1)
                If (LLessEqual (Local0, 0x14))
                {
                    If (LGreaterEqual (Local0, 0x02))
                    {
                        Subtract (Local0, 0x02, Local0)
                    }
                }

                If (LEqual (Local1, 0x00))
                {
                    If (LGreaterEqual (Local0, 0x63))
                    {
                        Store (0x00, Index (PBST, 0x00))
                    }
                    Else
                    {
                        Store (0x02, Index (PBST, 0x00))
                    }
                }
                Else
                {
                    If (LLessEqual (Local0, 0x0A))
                    {
                        Store (0x05, Index (PBST, 0x00))
                    }
                    Else
                    {
                        Store (0x01, Index (PBST, 0x00))
                    }
                }

                If (LGreaterEqual (Local0, 0x63))
                {
                    Store (0x64, Local0)
                }

                Store (0xFFFFFFFF, Index (PBST, 0x01))
                Store (\_SB.PCI0.LPCB.EC.RAMR (0xC5, 0x03), Local6)
                If (LEqual (Local6, 0x30))
                {
                    Store (0x11, Z000)
                }
                Else
                {
                    Store (0x07, Z000)
                }

                If (LEqual (Z000, 0x07))
                {
                    Multiply (Local0, 0xB4, Local2)
                    Divide (Local2, 0x0A, Local1, Local2)
                    Store (Local2, Index (PBST, 0x02))
                    Store (0x39D0, Index (PBST, 0x03))
                }

                If (LEqual (Z000, 0x11))
                {
                    Multiply (Local0, 0x01B8, Local2)
                    Divide (Local2, 0x0A, Local1, Local2)
                    Store (Local2, Index (PBST, 0x02))
                    Store (0x2B5C, Index (PBST, 0x03))
                }
            }

            Method (CHBP, 0, NotSerialized)
            {
                Store (Zero, Local0)
                Store (\_SB.PCI0.LPCB.EC.COMD (0xC5, 0x1A), Local0)
                If (LEqual (Z000, 0x01))
                {
                    Store ("--------------------------------BAT0 is not present", Debug)
                    If (BP)
                    {
                        Store ("--------------------------------BAT0 is just disconnected", Debug)
                        Store (0x00, BP)
                        IVBI ()
                        IVBS ()
                        Or (0x04, Local0, Local0)
                    }
                }
                Else
                {
                    If (BP)
                    {
                        Store ("--------------------------------BAT0 is still present", Debug)
                        If (UPBI ())
                        {
                            Or (0x01, Local0, Local0)
                        }

                        If (UPBS ())
                        {
                            Or (0x02, Local0, Local0)
                        }

                        Store ("------local0.0 = BAT0 PBIF modified-----", Debug)
                        Store (Local0, Debug)
                        Store ("------local0.1 = BAT0 PBST modified-----", Debug)
                    }
                    Else
                    {
                        Store ("--------------------------------BAT0 just connect", Debug)
                        UPBI ()
                        UPBS ()
                        Store (0x01, BP)
                        Or (0x05, Local0, Local0)
                        Store (0x01E9, UBIF)
                    }
                }

                Return (Local0)
            }

            Method (CHSM, 0, NotSerialized)
            {
                If (LNot (\_SB.PCI0.LPCB.EC.SMRD (0x09, 0x16, 0x0A, RefOf (Local5))))
                {
                    Store (Zero, SMBF)
                }
                Else
                {
                    Store (One, SMBF)
                }
            }
        }

        Device (AC)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)
            {
                Store ("------------------------- AC_STA", Debug)
                Return (0x0F)
            }

            Name (ACFG, 0x00)
            Name (ACP, 0x01)
            Method (_PSR, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPCB.EC.COMD (0xC5, 0x19), Local1)
                XOr (Local1, 0x01, Local1)
                If (LEqual (Local1, 0x01))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (LIDS)
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x18, 
                0x03
            })
        }

        Device (SLP2)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (PCI0)
        {
            Method (_INI, 0, NotSerialized)
            {
                If (CondRefOf (_OSI, Local0))
                {
                    Store (0x07D1, OSYS)
                }
                Else
                {
                    If (LEqual (SizeOf (_OS), 0x14))
                    {
                        Store (0x07D0, OSYS)
                    }
                    Else
                    {
                        If (LEqual (SizeOf (_OS), 0x27))
                        {
                            Store (0x07CF, OSYS)
                        }
                        Else
                        {
                            Store (0x07CE, OSYS)
                        }
                    }
                }

                If (LLessEqual (OSYS, 0x07CF))
                {
                    Store (0x01, ECON)
                }
            }

            Method (_S3D, 0, NotSerialized)
            {
                Return (0x02)
            }

            Method (_S4D, 0, NotSerialized)
            {
                Return (0x02)
            }

            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (_BBN, 0x00)
            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                        Offset (0x18), 
                    ,   7, 
                HENA,   1, 
                    ,   4, 
                PM0H,   2, 
                        Offset (0x1A), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                        Offset (0x1B), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                        Offset (0x1C), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                        Offset (0x1D), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                        Offset (0x1E), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                        Offset (0x1F), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                        Offset (0x20)
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    0x00,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
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
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    0x00,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y0D, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                If (PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y00._LEN, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y00._RW, C0RW)
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C4RW)
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C8RW)
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, CCRW)
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, D0RW)
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D4RW)
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D8RW)
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, DCRW)
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, E0RW)
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E4RW)
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E8RW)
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, ECRW)
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, F0RW)
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MIN, M1MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MAX, M1MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, M1LN)
                Multiply (0x02000000, \_SB.PCI0.MBUS.DRB3, M1MN)
                Add (Subtract (M1MX, M1MN), 0x01, M1LN)
                ShiftRight (And (\_SB.PCI0.LPCB.HPTE, 0x00038000), 0x0F, Local0)
                If (And (Local0, 0x04)) {}
                Return (BUF0)
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x07)
                    {
                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            0x00, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }
                    })
                }
                Else
                {
                    Return (Package (0x07)
                    {
                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            \_SB.PCI0.LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            \_SB.PCI0.LPCB.LNKH, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKB, 
                            0x00
                        }
                    })
                }
            }

            Device (MBUS)
            {
                Name (_ADR, 0x01)
                OperationRegion (MBUS, PCI_Config, 0x40, 0xC0)
                Field (MBUS, DWordAcc, NoLock, Preserve)
                {
                    DRB0,   8, 
                    DRB1,   8, 
                    DRB2,   8, 
                    DRB3,   8
                }
            }

            Device (AGPB)
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
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (VGA)
            {
                Name (_ADR, 0x00020000)
                Name (DSEN, 0x01)
                Name (CRTS, 0x01)
                Name (LCDS, 0x01)
                Name (TVAF, 0x01)
                Name (TOGF, 0x00)
                Method (_INI, 0, NotSerialized)
                {
                }

                Method (_DOS, 1, NotSerialized)
                {
                    If (LGreaterEqual (OSYS, 0x07D0))
                    {
                        Store (0x00, DSEN)
                    }
                }

                Method (_DOD, 0, NotSerialized)
                {
                    If (LEqual (LCDA, 0x0110))
                    {
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010300, 
                            0x00010110
                        })
                    }

                    Return (Package (0x03)
                    {
                        0x00010100, 
                        0x00010400, 
                        0x00010200
                    })
                }

                Device (CRT)
                {
                    Name (_ADR, 0x0100)
                    Method (_DCS, 0, NotSerialized)
                    {
                        If (CRTS)
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
                        If (CRTS)
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
                        If (LEqual (LCDA, 0x0110))
                        {
                            Return (0x0110)
                        }

                        Return (0x0400)
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LCDS)
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
                        If (LCDS)
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

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)
                Device (LANC)
                {
                    Name (_ADR, 0x000A0000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x05
                    })
                }

                Device (CBS0)
                {
                    Name (_ADR, 0x00090001)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
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

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x05)
                        {
                            Package (0x04)
                            {
                                0x000AFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x01, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x06)
                        {
                            Package (0x04)
                            {
                                0x000AFFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)
                OperationRegion (LPC0, PCI_Config, 0x40, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x20), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                            Offset (0x28), 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8, 
                            Offset (0x84), 
                    TRP4,   16, 
                            Offset (0x90), 
                    HPTE,   32, 
                            Offset (0xA0), 
                    LDE0,   8, 
                    LDE1,   8
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRA)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLA, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y0E)
                                {}
                        })
                        CreateWordField (RTLA, \_SB.PCI0.LPCB.LNKA._CRS._Y0E._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRA, 0x0F), IRQ0)
                        Return (RTLA)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRA)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRA, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRB)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLB, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y0F)
                                {}
                        })
                        CreateWordField (RTLB, \_SB.PCI0.LPCB.LNKB._CRS._Y0F._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRB, 0x0F), IRQ0)
                        Return (RTLB)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRB)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRB, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLC, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y10)
                                {}
                        })
                        CreateWordField (RTLC, \_SB.PCI0.LPCB.LNKC._CRS._Y10._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRC, 0x0F), IRQ0)
                        Return (RTLC)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRD)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLD, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y11)
                                {}
                        })
                        CreateWordField (RTLD, \_SB.PCI0.LPCB.LNKD._CRS._Y11._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRD, 0x0F), IRQ0)
                        Return (RTLD)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRD)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRD, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRE)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLE, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y12)
                                {}
                        })
                        CreateWordField (RTLE, \_SB.PCI0.LPCB.LNKE._CRS._Y12._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRE, 0x0F), IRQ0)
                        Return (RTLE)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRE)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRE, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRF)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLF, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y13)
                                {}
                        })
                        CreateWordField (RTLF, \_SB.PCI0.LPCB.LNKF._CRS._Y13._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRF, 0x0F), IRQ0)
                        Return (RTLF)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRF)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRF, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRG)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLG, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y14)
                                {}
                        })
                        CreateWordField (RTLG, \_SB.PCI0.LPCB.LNKG._CRS._Y14._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRG, 0x0F), IRQ0)
                        Return (RTLG)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRG)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRG, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRH)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLH, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y15)
                                {}
                        })
                        CreateWordField (RTLH, \_SB.PCI0.LPCB.LNKH._CRS._Y15._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRH, 0x0F), IRQ0)
                        Return (RTLH)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRH)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRH, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (And (HPTE, 0x00020000))
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (IPIC)
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
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B4,             // Range Minimum
                            0x00B4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (And (HPTE, 0x00020000))
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
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
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
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
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0093,             // Range Minimum
                            0x0093,             // Range Maximum
                            0x01,               // Alignment
                            0x0D,               // Length
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

                Device (MBRD)
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
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
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
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0600,             // Range Minimum
                            0x0600,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0700,             // Range Minimum
                            0x0700,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x1000,             // Range Minimum
                            0x1000,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1180,             // Range Minimum
                            0x1180,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFEC10000,         // Address Base
                            0x00010000,         // Address Length
                            )
                    })
                }

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF000000,         // Address Base
                            0x01000000,         // Address Length
                            )
                    })
                }

                Device (HPET)
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
                            _Y16)
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        ShiftRight (And (HPTE, 0x00038000), 0x0F, Local0)
                        If (LEqual (OSYS, 0x07D1))
                        {
                            If (And (Local0, 0x04))
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            If (And (Local0, 0x04))
                            {
                                Return (0x0B)
                            }
                        }

                        Return (0x00)
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        ShiftRight (And (HPTE, 0x00038000), 0x0F, Local0)
                        If (And (Local0, 0x04))
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPCB.HPET._Y16._BAS, HPT0)
                            If (LEqual (Local0, 0x05))
                            {
                                Store (0xFED01000, HPT0)
                            }

                            If (LEqual (Local0, 0x06))
                            {
                                Store (0xFED02000, HPT0)
                            }

                            If (LEqual (Local0, 0x07))
                            {
                                Store (0xFED03000, HPT0)
                            }
                        }

                        Return (BUF0)
                    }
                }

                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x1C)
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
                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0x7F)
                    Field (ERAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x01), 
                        SCIC,   8, 
                                Offset (0x04), 
                        CMCD,   8, 
                        DAT1,   8, 
                        DAT2,   8, 
                        DAT3,   8, 
                                Offset (0x18), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   264, 
                        SMAA,   8, 
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
                        P65S,   8, 
                                Offset (0x57), 
                        P67S,   8, 
                                Offset (0x5D), 
                        P65T,   8, 
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

                    OperationRegion (EC01, SystemIO, 0x62, 0x01)
                    Field (EC01, ByteAcc, Lock, Preserve)
                    {
                        PX62,   8
                    }

                    OperationRegion (EC02, SystemIO, 0x66, 0x01)
                    Field (EC02, ByteAcc, Lock, Preserve)
                    {
                        PX66,   8
                    }

                    Mutex (MUT0, 0x00)
                    Mutex (MUT1, 0x00)
                    Method (RAMR, 2, NotSerialized)
                    {
                        Acquire (MUT0, 0xFFFF)
                        Name (ECCT, 0x20)
                        If (LGreater (Arg0, 0x7F))
                        {
                            Store (Arg1, DAT3)
                        }

                        Store (Arg0, DAT2)
                        Store (0xBA, CMCD)
                        While (ECCT)
                        {
                            Store (CMCD, Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Sleep (0x05)
                            }

                            Decrement (ECCT)
                        }

                        Store (DAT1, Local0)
                        Store (0x20, ECCT)
                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (RAMW, 2, NotSerialized)
                    {
                        Acquire (MUT0, 0xFFFF)
                        Name (ECCT, 0x20)
                        If (LGreater (Arg0, 0x7F))
                        {
                            Store (Arg2, DAT3)
                        }

                        Store (Arg0, DAT2)
                        Store (Arg1, DAT1)
                        Store (0xBB, CMCD)
                        While (ECCT)
                        {
                            Store (CMCD, Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Sleep (0x05)
                            }

                            Decrement (ECCT)
                        }

                        Store (0x20, ECCT)
                        Release (MUT0)
                    }

                    Method (COMD, 2, NotSerialized)
                    {
                        Acquire (MUT0, 0xFFFF)
                        Name (ECCT, 0x20)
                        Store (Arg1, DAT1)
                        Store (Arg0, CMCD)
                        While (ECCT)
                        {
                            Store (CMCD, Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Sleep (0x05)
                            }

                            Decrement (ECCT)
                        }

                        Store (DAT1, Local0)
                        Store (0x20, ECCT)
                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (SMRD, 4, NotSerialized)
                    {
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
                        Store (0x03, Local0)
                        While (LGreater (Local0, 0x01))
                        {
                            And (SMST, 0x40, SMST)
                            Store (Arg2, SMCM)
                            Store (Arg1, SMAD)
                            Store (Arg0, SMPR)
                            Store ("Write to EC:SMCM,SMAD,SMPR", Debug)
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
                                Store (SMD0, Arg3)
                            }
                        }

                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (SMWR, 4, NotSerialized)
                    {
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
                        Store (0x03, Local0)
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

                    Method (_Q0A, 0, NotSerialized)
                    {
                        Store (0x01, PRM2)
                        Store (0x1F, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q0B, 0, NotSerialized)
                    {
                        Store (0x0B, P80H)
                        Store (0x02, PRM2)
                        Store (0x1F, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q0C, 0, NotSerialized)
                    {
                        Store (0x0C, P80H)
                        Store (0x03, PRM2)
                        Store (0x1F, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Store (0x0D, P80H)
                        Store (0x30, SMIF)
                        Store (Zero, TRP0)
                        Notify (\_SB.SLP2, 0x80)
                    }

                    Method (_Q0E, 0, NotSerialized)
                    {
                        Store (0x0E, P80H)
                        Store (" ---- Ctrl+Alt+F3 switch ---- ", Debug)
                        Store (\_SB.PCI0.VGA.DSEN, Local1)
                        If (LEqual (Local1, 0x00))
                        {
                            Increment (\_SB.PCI0.VGA.TOGF)
                            Store (\_SB.PCI0.VGA.TOGF, Local0)
                            If (LEqual (Local0, 0x01))
                            {
                                Store ("LCD", Debug)
                                Store (One, \_SB.PCI0.VGA.CRTS)
                                Store (Zero, \_SB.PCI0.VGA.LCDS)
                                Store (0x0101, CSTE)
                            }

                            If (LEqual (Local0, 0x02))
                            {
                                Store ("CRT", Debug)
                                Store (Zero, \_SB.PCI0.VGA.CRTS)
                                Store (One, \_SB.PCI0.VGA.LCDS)
                                Store (0x0808, CSTE)
                            }

                            If (LEqual (Local0, 0x03))
                            {
                                Store ("Both", Debug)
                                Store (One, \_SB.PCI0.VGA.CRTS)
                                Store (One, \_SB.PCI0.VGA.LCDS)
                                Store (Zero, \_SB.PCI0.VGA.TOGF)
                                Store (0x0909, CSTE)
                            }

                            If (LEqual (OSYS, 0x07D1))
                            {
                                Notify (\_SB.PCI0, 0x00)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.VGA, 0x00)
                            }

                            Sleep (0x02EE)
                            Notify (\_SB.PCI0.VGA, 0x80)
                        }

                        If (LEqual (Local1, 0x01))
                        {
                            Store (0x64, SMIF)
                            Store (0x00, TRP0)
                        }
                    }

                    Method (_Q10, 0, NotSerialized)
                    {
                        Store (0x10, P80H)
                        Store (0x15, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store (0x11, P80H)
                        Store (0x16, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        Store (0x30, P80H)
                        Store (0x30, PRM2)
                        Store (0x1F, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q68, 0, NotSerialized)
                    {
                        Store (0x31, P80H)
                        Store (0x31, PRM2)
                        Store (0x1F, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q15, 0, NotSerialized)
                    {
                        Store (0x36, P80H)
                        Store (0x36, PRM2)
                        Store (0x1F, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q0F, 0, NotSerialized)
                    {
                        Store (0x11, P80H)
                        Store (0x11, PRM2)
                        Store (0x1F, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q13, 0, NotSerialized)
                    {
                        Store (0x12, P80H)
                        Store (0x12, PRM2)
                        Store (0x1F, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q14, 0, NotSerialized)
                    {
                        Store (0x13, P80H)
                        Store (0x13, PRM2)
                        Store (0x1F, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q2E, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.LPCB.EC.P54, 0x00))
                        {
                            Store (0x98, \_SB.PCI0.LPCB.EC.P54S)
                            Store (0x00, LIDS)
                            Store (0x34, SMIF)
                            Store (Zero, TRP0)
                        }
                        Else
                        {
                            Store (0x88, \_SB.PCI0.LPCB.EC.P54S)
                            Store (0x01, LIDS)
                            Store (0x35, SMIF)
                            Store (Zero, TRP0)
                        }

                        Notify (\_SB.LID, 0x80)
                    }

                    Method (_Q31, 0, NotSerialized)
                    {
                        Store (0x30, SMIF)
                        Store (Zero, TRP0)
                        Store (0x32, SMIF)
                        Store (Zero, TRP0)
                        Notify (\_SB.AC, 0x80)
                        Notify (\_SB.BAT0, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Store (0x30, SMIF)
                        Store (Zero, TRP0)
                        Store (\_SB.PCI0.LPCB.EC.COMD (0xC5, 0x1A), Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x80, \_SB.PCI0.LPCB.EC.P62S)
                        }
                        Else
                        {
                            Store (0x90, \_SB.PCI0.LPCB.EC.P62S)
                        }

                        Sleep (0x07D0)
                        Store (0x23, SMIF)
                        Store (Zero, TRP0)
                        Notify (\_SB.BAT0, 0x80)
                        Sleep (0x0320)
                        Notify (\_SB.BAT0, 0x81)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q40, 0, NotSerialized)
                    {
                        Store (0x40, P80H)
                        Store (0x01, \_SB.PCI0.VGA.TOGF)
                        Store (One, \_SB.PCI0.VGA.CRTS)
                        Store (Zero, \_SB.PCI0.VGA.LCDS)
                        Store (0x0101, CSTE)
                        If (LEqual (OSYS, 0x07D1))
                        {
                            Notify (\_SB.PCI0, 0x00)
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.VGA, 0x00)
                        }

                        Sleep (0x02EE)
                        Notify (\_SB.PCI0.VGA, 0x80)
                    }

                    Method (_Q41, 0, NotSerialized)
                    {
                        Store (0x41, P80H)
                        Store (0x02, \_SB.PCI0.VGA.TOGF)
                        Store (Zero, \_SB.PCI0.VGA.CRTS)
                        Store (One, \_SB.PCI0.VGA.LCDS)
                        Store (0x0808, CSTE)
                        If (LEqual (OSYS, 0x07D1))
                        {
                            Notify (\_SB.PCI0, 0x00)
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.VGA, 0x00)
                        }

                        Sleep (0x02EE)
                        Notify (\_SB.PCI0.VGA, 0x80)
                    }

                    Method (_Q42, 0, NotSerialized)
                    {
                        Store (0x42, P80H)
                        Store (0x03, \_SB.PCI0.VGA.TOGF)
                        Store (One, \_SB.PCI0.VGA.CRTS)
                        Store (One, \_SB.PCI0.VGA.LCDS)
                        Store (Zero, \_SB.PCI0.VGA.TOGF)
                        Store (0x0909, CSTE)
                        If (LEqual (OSYS, 0x07D1))
                        {
                            Notify (\_SB.PCI0, 0x00)
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.VGA, 0x00)
                        }

                        Sleep (0x02EE)
                        Notify (\_SB.PCI0.VGA, 0x80)
                    }

                    Method (_Q43, 0, NotSerialized)
                    {
                        Store (0x55, \_PR.CPU0.CSTX)
                        Notify (\_PR.CPU0, 0x81)
                    }

                    Method (_Q44, 0, NotSerialized)
                    {
                        Store (0x00, \_PR.CPU0.CSTX)
                        Notify (\_PR.CPU0, 0x81)
                    }

                    Method (_Q77, 0, NotSerialized)
                    {
                        Store (0x07, SMIF)
                        Store (Zero, TRP0)
                        Sleep (0xC8)
                        Store (0x01, \_TZ.T4FG)
                        Notify (\_TZ.THRS, 0x80)
                        Notify (\_TZ.THRC, 0x80)
                    }

                    Method (_Q78, 0, NotSerialized)
                    {
                        Store (0x06, SMIF)
                        Store (Zero, TRP0)
                        Sleep (0xC8)
                        Store (0x00, \_TZ.T4FG)
                        Notify (\_TZ.THRS, 0x80)
                        Notify (\_TZ.THRC, 0x80)
                    }

                    Method (_Q79, 0, NotSerialized)
                    {
                        Store (0x00, \_TZ.T4FG)
                        Notify (\_TZ.THRS, 0x80)
                        Notify (\_TZ.THRC, 0x80)
                    }
                }

                Method (DFIN, 0, NotSerialized)
                {
                }

                OperationRegion (SIIO, SystemIO, 0x2E, 0x02)
                Field (SIIO, ByteAcc, Lock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                OperationRegion (SGIO, SystemIO, 0x0600, 0x0C)
                Field (SGIO, ByteAcc, NoLock, Preserve)
                {
                    GDO0,   8, 
                    GDI0,   8, 
                    GEE0,   8, 
                    GES0,   8, 
                    GDO1,   8, 
                    GDI1,   8, 
                    GEE1,   8, 
                    GES1,   8, 
                    GDO2,   8, 
                    GDI2,   8, 
                    GDO3,   8, 
                    GDI3,   8
                }

                Mutex (MTIO, 0x00)
                Method (REGR, 2, NotSerialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (0x07, INDX)
                    Store (Arg0, DATA)
                    Store (Arg1, INDX)
                    Store (DATA, Local0)
                    Release (MTIO)
                    Return (Local0)
                }

                Method (REGW, 3, NotSerialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (0x07, INDX)
                    Store (Arg0, DATA)
                    Store (Arg1, INDX)
                    Store (Arg2, DATA)
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

                Device (LPT)
                {
                    Name (_UID, 0x00)
                    Name (FLAG, 0xFF)
                    Method (MODE, 0, NotSerialized)
                    {
                        If (LEqual (FLAG, 0xFF))
                        {
                            If (STAT (0x02))
                            {
                                ShiftRight (REGR (0x01, 0xF0), 0x05, Local0)
                                If (LOr (LEqual (Local0, 0x04), LEqual (Local0, 0x07)))
                                {
                                    Store (0x02, FLAG)
                                }
                                Else
                                {
                                    Store (0x01, FLAG)
                                }
                            }
                            Else
                            {
                                Store (0x00, FLAG)
                            }
                        }

                        Return (FLAG)
                    }

                    Method (_HID, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x02))
                        {
                            Return (0x0104D041)
                        }
                        Else
                        {
                            Return (0x0004D041)
                        }
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x00))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            If (REGR (0x01, 0x30))
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
                        REGW (0x01, 0x30, Zero)
                    }

                    Name (CRSA, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y17)
                        IRQNoFlags (_Y18)
                            {}
                    })
                    Name (CRSB, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y19)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y1A)
                        IRQNoFlags (_Y1B)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y1C)
                            {}
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.LPT._Y17._MIN, MINA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.LPT._Y17._MAX, MAXA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.LPT._Y18._INT, INTA)
                        CreateByteField (CRSA, \_SB.PCI0.LPCB.LPT._Y17._LEN, LENA)
                        Store (Zero, MINA)
                        Store (Zero, MAXA)
                        Store (Zero, INTA)
                        Store (Zero, LENA)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y19._MIN, MINB)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y19._MAX, MAXB)
                        CreateByteField (CRSB, \_SB.PCI0.LPCB.LPT._Y19._LEN, LENB)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y1A._MIN, MINC)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y1A._MAX, MAXC)
                        CreateByteField (CRSB, \_SB.PCI0.LPCB.LPT._Y1A._LEN, LENC)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y1B._INT, INTB)
                        CreateByteField (CRSB, \_SB.PCI0.LPCB.LPT._Y1C._DMA, DMAB)
                        Store (Zero, MINB)
                        Store (Zero, MAXB)
                        Store (Zero, LENB)
                        Store (Zero, MINC)
                        Store (Zero, MAXC)
                        Store (Zero, LENC)
                        Store (Zero, INTB)
                        Store (Zero, DMAB)
                        If (REGR (0x01, 0x30))
                        {
                            ShiftLeft (REGR (0x01, 0x60), 0x08, Local0)
                            Add (Local0, REGR (0x01, 0x61), Local0)
                            Store (Local0, MINA)
                            Store (Local0, MAXA)
                            Store (Local0, MINB)
                            Store (Local0, MAXB)
                            Add (Local0, 0x0400, Local0)
                            Store (Local0, MINC)
                            Store (Local0, MAXC)
                            If (LEqual (Local0, 0x07BC))
                            {
                                Store (0x04, LENA)
                                Store (0x04, LENB)
                                Store (0x04, LENC)
                            }
                            Else
                            {
                                Store (0x08, LENA)
                                Store (0x08, LENB)
                                Store (0x08, LENC)
                            }

                            And (REGR (0x01, 0x70), 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, Local0)
                            }

                            Store (Local0, INTA)
                            Store (Local0, INTB)
                            Store (REGR (0x01, 0x74), Local0)
                            If (LNotEqual (Local0, 0x04))
                            {
                                ShiftLeft (One, Local0, DMAB)
                            }
                        }

                        If (LEqual (MODE (), 0x02))
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
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                        }
                        EndDependentFn ()
                    })
                    Name (PRSB, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0778,             // Range Minimum
                                0x0778,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0678,             // Range Minimum
                                0x0678,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IO (Decode16,
                                0x07BC,             // Range Minimum
                                0x07BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {1,3}
                        }
                        EndDependentFn ()
                    })
                    Method (_PRS, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x02))
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
                        If (LEqual (MODE (), 0x02))
                        {
                            Store (Arg0, CRSB)
                            CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y19._MIN, MINB)
                            CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y1B._INT, INTB)
                            CreateByteField (CRSB, \_SB.PCI0.LPCB.LPT._Y1C._DMA, DMAB)
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
                            Store (INTB, Local2)
                        }
                        Else
                        {
                            Store (Arg0, CRSA)
                            CreateWordField (CRSA, \_SB.PCI0.LPCB.LPT._Y17._MIN, MINA)
                            CreateWordField (CRSA, \_SB.PCI0.LPCB.LPT._Y18._INT, INTA)
                            Store (0x04, Local0)
                            Store (MINA, Local1)
                            Store (INTA, Local2)
                        }

                        REGW (0x01, 0x74, Local0)
                        ShiftRight (Local1, 0x08, Local0)
                        REGW (0x01, 0x60, Local0)
                        And (Local1, 0xFF, Local0)
                        REGW (0x01, 0x61, Local0)
                        FindSetRightBit (Local2, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }

                        REGW (0x01, 0x70, Local0)
                        REGW (0x01, 0x30, 0x01)
                    }
                }

                Device (COMA)
                {
                    Name (_HID, EisaId ("PNP0501"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (STAT (0x08))
                        {
                            If (REGR (0x03, 0x30))
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

                    Method (_DIS, 0, NotSerialized)
                    {
                        REGW (0x03, 0x30, Zero)
                    }

                    Name (CRSA, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x03F8,             // Range Minimum
                            0x03F8,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y1D)
                        IRQNoFlags (_Y1E)
                            {4}
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.COMA._Y1D._MIN, MINA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.COMA._Y1D._MAX, MAXA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.COMA._Y1E._INT, INTA)
                        If (REGR (0x03, 0x30))
                        {
                            ShiftLeft (REGR (0x03, 0x60), 0x08, Local0)
                            Add (Local0, REGR (0x03, 0x61), Local0)
                            Store (Local0, MINA)
                            Store (Local0, MAXA)
                            And (REGR (0x03, 0x70), 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, Local0)
                            }

                            Store (Local0, INTA)
                        }
                        Else
                        {
                            Store (Zero, MINA)
                            Store (Zero, MAXA)
                            Store (Zero, INTA)
                        }

                        Return (CRSA)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
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
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        Store (Arg0, CRSA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.COMA._Y1D._MIN, MINX)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.COMA._Y1E._INT, INTX)
                        ShiftRight (MINX, 0x08, Local0)
                        REGW (0x03, 0x60, Local0)
                        And (MINX, 0xFF, Local0)
                        REGW (0x03, 0x61, Local0)
                        FindSetRightBit (INTX, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }

                        REGW (0x03, 0x70, Local0)
                        REGW (0x03, 0x30, 0x01)
                        Method (_PS0, 0, NotSerialized)
                        {
                            REGW (0x03, 0xF0, 0x04)
                            REGW (0x03, 0x30, 0x01)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            REGW (0x03, 0x30, 0x00)
                        }
                    }
                }

                Device (COMB)
                {
                    Name (_UID, 0x02)
                    Name (FLAG, 0xFF)
                    Method (MODE, 0, NotSerialized)
                    {
                        If (LEqual (FLAG, 0xFF))
                        {
                            If (STAT (0x04))
                            {
                                If (LEqual (REGR (0x02, 0x74), 0x04))
                                {
                                    Store (0x03, FLAG)
                                }
                                Else
                                {
                                    Store (0x04, FLAG)
                                }
                            }
                            Else
                            {
                                Store (0x00, FLAG)
                            }
                        }

                        Return (FLAG)
                    }

                    Method (_HID, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x04))
                        {
                            Return (0x0160633A)
                        }
                        Else
                        {
                            Return (0x1005D041)
                        }
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x00))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            If (REGR (0x02, 0x30))
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
                        REGW (0x02, 0x30, Zero)
                    }

                    Name (CRSA, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y1F)
                        IRQNoFlags (_Y20)
                            {}
                    })
                    Name (CRSB, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y21)
                        IRQNoFlags (_Y22)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y23)
                            {}
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.COMB._Y1F._MIN, MINA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.COMB._Y1F._MAX, MAXA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.COMB._Y20._INT, INTA)
                        Store (Zero, MINA)
                        Store (Zero, MAXA)
                        Store (Zero, INTA)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.COMB._Y21._MIN, MINB)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.COMB._Y21._MAX, MAXB)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.COMB._Y22._INT, INTB)
                        CreateByteField (CRSB, \_SB.PCI0.LPCB.COMB._Y23._DMA, DMAB)
                        Store (Zero, MINB)
                        Store (Zero, MAXB)
                        Store (Zero, INTB)
                        Store (Zero, DMAB)
                        If (REGR (0x02, 0x30))
                        {
                            ShiftLeft (REGR (0x02, 0x60), 0x08, Local0)
                            Add (Local0, REGR (0x02, 0x61), Local0)
                            Store (Local0, MINA)
                            Store (Local0, MAXA)
                            Store (Local0, MINB)
                            Store (Local0, MAXB)
                            And (REGR (0x02, 0x70), 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, Local0)
                            }

                            Store (Local0, INTA)
                            Store (Local0, INTB)
                            Store (REGR (0x02, 0x74), Local0)
                            If (LNotEqual (Local0, 0x04))
                            {
                                ShiftLeft (One, Local0, DMAB)
                            }
                        }

                        If (LEqual (MODE (), 0x04))
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
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
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
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
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
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
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
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
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
                        If (LEqual (MODE (), 0x04))
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
                        If (LEqual (MODE (), 0x04))
                        {
                            Store (Arg0, CRSB)
                            CreateWordField (CRSB, \_SB.PCI0.LPCB.COMB._Y21._MIN, MINB)
                            CreateWordField (CRSB, \_SB.PCI0.LPCB.COMB._Y22._INT, INTB)
                            CreateByteField (CRSB, \_SB.PCI0.LPCB.COMB._Y23._DMA, DMAB)
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
                            Store (INTB, Local2)
                        }
                        Else
                        {
                            Store (Arg0, CRSA)
                            CreateWordField (CRSA, \_SB.PCI0.LPCB.COMB._Y1F._MIN, MINA)
                            CreateWordField (CRSA, \_SB.PCI0.LPCB.COMB._Y20._INT, INTA)
                            Store (0x04, Local0)
                            Store (MINA, Local1)
                            Store (INTA, Local2)
                        }

                        REGW (0x02, 0x74, Local0)
                        Add (Local1, 0x06, TRP4)
                        ShiftRight (Local1, 0x08, Local0)
                        REGW (0x02, 0x60, Local0)
                        And (Local1, 0xFF, Local0)
                        REGW (0x02, 0x61, Local0)
                        FindSetRightBit (Local2, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }

                        REGW (0x02, 0x70, Local0)
                        REGW (0x02, 0x30, 0x01)
                        If (LEqual (MODE (), 0x04))
                        {
                            Or (REGR (0x02, 0xF0), 0x80, Local0)
                            REGW (0x02, 0xF0, Local0)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        REGW (0x02, 0xF0, 0x82)
                        REGW (0x02, 0x30, 0x01)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        REGW (0x02, 0x30, 0x00)
                    }
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
                    Name (_HID, EisaId ("SYN0302"))
                    Name (_CID, Package (0x02)
                    {
                        0x00032E4F, 
                        0x130FD041
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)
                OperationRegion (U0CS, PCI_Config, 0xC4, 0x04)
                Field (U0CS, DWordAcc, NoLock, Preserve)
                {
                    U0EN,   2
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U0EN)
                    }
                    Else
                    {
                        Store (0x00, U0EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0001)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (0x00, U1EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0002)
                OperationRegion (U2CS, PCI_Config, 0xC4, 0x04)
                Field (U2CS, DWordAcc, NoLock, Preserve)
                {
                    U2EN,   2
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U2EN)
                    }
                    Else
                    {
                        Store (0x00, U2EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB7)
            {
                Name (_ADR, 0x001D0007)
                OperationRegion (U7CS, PCI_Config, 0x64, 0x02)
                Field (U7CS, WordAcc, NoLock, Preserve)
                {
                    U7OW,   16
                }

                Method (_PS0, 0, NotSerialized)
                {
                    Store (0x00, U7OW)
                }

                Method (_PS3, 0, NotSerialized)
                {
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x3E, U7OW)
                }
            }

            Name (NATA, Package (0x01)
            {
                0x001F0001
            })
            Device (IDEC)
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
                    SYNC,   4, 
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

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (PBUF, Buffer (0x14)
                        {
                            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x00, 0x00, 0x00, 0x00
                        })
                        CreateDWordField (PBUF, 0x00, PIO0)
                        CreateDWordField (PBUF, 0x04, DMA0)
                        CreateDWordField (PBUF, 0x08, PIO1)
                        CreateDWordField (PBUF, 0x0C, DMA1)
                        CreateDWordField (PBUF, 0x10, FLAG)
                        Store (GETP (PRIT), PIO0)
                        Store (GDMA (And (SYNC, 0x01), And (ICR3, 0x01), 
                            And (ICR0, 0x01), SDT0, And (ICR1, 0x01)), DMA0)
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

                        Store (GDMA (And (SYNC, 0x02), And (ICR3, 0x02), 
                            And (ICR0, 0x02), SDT1, And (ICR1, 0x02)), DMA1)
                        If (LEqual (DMA1, 0xFFFFFFFF))
                        {
                            Store (PIO1, DMA1)
                        }

                        Store (GETF (And (SYNC, 0x01), And (SYNC, 0x02), 
                            PRIT), FLAG)
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
                            And (SYNC, 0x0E, SYNC)
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
                            CreateWordField (Arg1, 0xBA, W930)
                            Or (PRIT, 0x8004, PRIT)
                            If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                            {
                                Or (PRIT, 0x02, PRIT)
                            }

                            Or (PRIT, SETP (PIO0, W530, W640), PRIT)
                            If (And (FLAG, 0x01))
                            {
                                Or (SYNC, 0x01, SYNC)
                                Store (SDMA (DMA0), SDT0)
                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x01, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x01, ICR0)
                                }

                                If (And (W930, 0x2000))
                                {
                                    Or (ICR1, 0x01, ICR1)
                                }
                            }
                        }

                        If (LEqual (SizeOf (Arg2), 0x0200))
                        {
                            And (PRIT, 0x3F0F, PRIT)
                            Store (0x00, PSIT)
                            And (SYNC, 0x0D, SYNC)
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
                            CreateWordField (Arg2, 0xBA, W931)
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
                                Or (SYNC, 0x02, SYNC)
                                Store (SDMA (DMA1), SDT1)
                                If (LLess (DMA1, 0x1E))
                                {
                                    Or (ICR3, 0x02, ICR3)
                                }

                                If (LLess (DMA1, 0x3C))
                                {
                                    Or (ICR0, 0x02, ICR0)
                                }

                                If (And (W931, 0x2000))
                                {
                                    Or (ICR1, 0x02, ICR1)
                                }
                            }
                        }
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB0, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
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

                            If (And (SYNC, 0x01))
                            {
                                Store (Or (SDT0, 0x40), DMD0)
                                If (And (ICR1, 0x01))
                                {
                                    If (And (ICR0, 0x01))
                                    {
                                        Add (DMD0, 0x02, DMD0)
                                    }

                                    If (And (ICR3, 0x01))
                                    {
                                        Store (0x45, DMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                            }

                            Return (PIB0)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB1, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
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
                                    Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 
                                        0x02), Local0)
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

                            If (And (SYNC, 0x02))
                            {
                                Store (Or (SDT1, 0x40), DMD1)
                                If (And (ICR1, 0x02))
                                {
                                    If (And (ICR0, 0x02))
                                    {
                                        Add (DMD1, 0x02, DMD1)
                                    }

                                    If (And (ICR3, 0x02))
                                    {
                                        Store (0x45, DMD1)
                                    }
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

                Method (GETP, 1, Serialized)
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
                    Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))
                        ))
                }

                Method (GDMA, 5, Serialized)
                {
                    If (Arg0)
                    {
                        If (LAnd (Arg1, Arg4))
                        {
                            Return (0x14)
                        }

                        If (LAnd (Arg2, Arg4))
                        {
                            Return (Multiply (Subtract (0x04, Arg3), 0x0F))
                        }

                        Return (Multiply (Subtract (0x04, Arg3), 0x1E))
                    }

                    Return (0xFFFFFFFF)
                }

                Method (GETT, 1, Serialized)
                {
                    Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02
                        ), 0x03), And (Arg0, 0x03)))))
                }

                Method (GETF, 3, Serialized)
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

                Method (SETP, 3, Serialized)
                {
                    If (LGreater (Arg0, 0xF0))
                    {
                        Return (0x08)
                    }
                    Else
                    {
                        If (And (Arg1, 0x02))
                        {
                            If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                            {
                                Return (0x2301)
                            }

                            If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
                            {
                                Return (0x2101)
                            }
                        }

                        Return (0x1001)
                    }
                }

                Method (SDMA, 1, Serialized)
                {
                    If (LLessEqual (Arg0, 0x14))
                    {
                        Return (0x01)
                    }

                    If (LLessEqual (Arg0, 0x1E))
                    {
                        Return (0x02)
                    }

                    If (LLessEqual (Arg0, 0x2D))
                    {
                        Return (0x01)
                    }

                    If (LLessEqual (Arg0, 0x3C))
                    {
                        Return (0x02)
                    }

                    If (LLessEqual (Arg0, 0x5A))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SETT, 3, Serialized)
                {
                    If (And (Arg1, 0x02))
                    {
                        If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                        {
                            Return (0x0B)
                        }

                        If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
                        {
                            Return (0x09)
                        }
                    }

                    Return (0x04)
                }
            }

            Device (SBUS)
            {
                Name (_ADR, 0x001F0003)
                OperationRegion (SBUS, SystemIO, 0x1810, 0x10)
                Field (SBUS, ByteAcc, NoLock, Preserve)
                {
                    HSTS,   8, 
                            Offset (0x02), 
                    HCON,   8, 
                    HCOM,   8, 
                    TXSA,   8, 
                    DAT0,   8, 
                    DAT1,   8, 
                    BDBR,   8, 
                            Offset (0x09), 
                    RXSA,   8, 
                    SDAT,   16
                }

                Method (SBWB, 3, NotSerialized)
                {
                    While (And (HSTS, 0x01)) {}
                    Store (0x1E, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (Arg2, DAT0)
                    Store (0x48, HCON)
                    While (LEqual (And (HSTS, 0x1E), 0x00)) {}
                    Store (0x1E, HSTS)
                }

                Method (SBRB, 2, NotSerialized)
                {
                    While (And (HSTS, 0x01)) {}
                    Store (0x1E, HSTS)
                    Store (Or (Arg0, 0x01), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x48, HCON)
                    While (LEqual (And (HSTS, 0x1E), 0x00)) {}
                    Store (0x1E, HSTS)
                    Return (DAT0)
                }
            }

            Device (AUD0)
            {
                Name (_ADR, 0x001F0005)
            }

            Device (MODM)
            {
                Name (_ADR, 0x001F0006)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x04
                })
            }
        }
    }
}

