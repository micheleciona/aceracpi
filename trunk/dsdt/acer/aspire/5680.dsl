/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20060912
 *
 * Disassembly of dsdt.dat, Thu Jun 28 18:50:11 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00005D93 (23955)
 *     Revision         0x01
 *     OEM ID           "Acer  "
 *     OEM Table ID     "CALISTGA"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "INTL"
 *     Creator Revision 0x20050228 (537199144)
 */
DefinitionBlock ("dsdt.aml", "DSDT", 1, "Acer  ", "CALISTGA", 0x06040000)
{
    External (PDC1)
    External (PDC0)
    External (CFGD)

    Method (PHIS, 1, NotSerialized)
    {
        Store (Arg0, PRM0)
        Store (0xA0, SMIF)
        Store (Zero, TRP0)
    }

    OperationRegion (PRT0, SystemIO, 0x80, 0x04)
    Field (PRT0, DWordAcc, Lock, Preserve)
    {
        P80H,   32
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
                Offset (0x08), 
        TRP0,   8
    }

    OperationRegion (PMIO, SystemIO, 0x1000, 0x80)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
                Offset (0x30), 
            ,   4, 
        SLPE,   1, 
                Offset (0x34), 
            ,   4, 
        SLPS,   1, 
                Offset (0x42), 
            ,   1, 
        GPEC,   1
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
            ,   4, 
        GP12,   1, 
                Offset (0x0E), 
        GL02,   8, 
        GL03,   8, 
                Offset (0x18), 
        GB00,   8, 
        GB01,   8, 
        GB02,   8, 
        GB03,   8, 
                Offset (0x2C), 
        GIV0,   8, 
            ,   5, 
        LPOL,   1, 
                Offset (0x2E), 
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
            ,   7, 
        GP39,   1, 
        GL05,   8, 
        GL06,   8, 
        GL07,   8
    }

    OperationRegion (GNVS, SystemMemory, 0x3FE8DDBC, 0x0100)
    Field (GNVS, AnyAcc, Lock, Preserve)
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
        P80D,   32, 
        LIDS,   8, 
        PWRS,   8, 
        DBGS,   8, 
                Offset (0x14), 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
                Offset (0x1E), 
        BNUM,   8, 
        B0SC,   8, 
        B1SC,   8, 
        B2SC,   8, 
        B0SS,   8, 
        B1SS,   8, 
        B2SS,   8, 
                Offset (0x28), 
        APIC,   8, 
        MPEN,   8, 
        PPCS,   8, 
        PPCM,   8, 
        PCP0,   8, 
        PCP1,   8, 
                Offset (0x32), 
        NATP,   8, 
        CMAP,   8, 
        CMBP,   8, 
        LPTP,   8, 
        FDCP,   8, 
        CMCP,   8, 
        CIRP,   8, 
                Offset (0x3C), 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
                Offset (0x67), 
        BLCS,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
                Offset (0x6E), 
        EMAE,   8, 
        EMAP,   16, 
        EMAL,   16, 
                Offset (0x74), 
        MEFE,   8, 
                Offset (0x82), 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
                Offset (0xA1), 
        WLDV,   4, 
                Offset (0xB4), 
        PCMS,   8, 
        TSTE,   8, 
        KBTP,   8
    }

    OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
    Field (RCRB, DWordAcc, Lock, Preserve)
    {
                Offset (0x1000), 
                Offset (0x3000), 
                Offset (0x3404), 
        HPAS,   2, 
            ,   5, 
        HPAE,   1, 
                Offset (0x3418), 
            ,   1, 
        PATD,   1, 
        SATD,   1, 
        SMBD,   1, 
        HDAD,   1, 
        A97D,   1, 
                Offset (0x341A), 
        RP1D,   1, 
        RP2D,   1, 
        RP3D,   1, 
        RP4D,   1, 
        RP5D,   1, 
        RP6D,   1
    }

    Mutex (MUTX, 0x00)
    Name (_S0, Package (0x03)
    {
        Zero, 
        Zero, 
        Zero
    })
    Name (_S3, Package (0x03)
    {
        0x05, 
        0x05, 
        Zero
    })
    Name (_S4, Package (0x03)
    {
        0x06, 
        0x06, 
        Zero
    })
    Name (_S5, Package (0x03)
    {
        0x07, 
        0x07, 
        Zero
    })
    Scope (_PR)
    {
        Processor (CPU0, 0x00, 0x00001010, 0x06) {}
        Processor (CPU1, 0x01, 0x00001010, 0x06) {}
    }

    Name (DSEN, One)
    Name (ECON, Zero)
    Name (GPIC, Zero)
    Name (CTYP, Zero)
    Name (L01C, Zero)
    Name (OEMB, Zero)
    Method (_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (0x50, P80H)
        Store (One, SLPE)
        Store (One, SLPS)
        Store (\_SB.PCI0.GFX0.IRES, OEMB)
        If (LEqual (Arg0, 0x03))
        {
            PHIS (0x4C)
            Store (0x53, P80H)
            \_SB.PCI0.LPCB.EC0.CLCK (Zero)
            PHIS (0x80)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x54, P80H)
            PHIS (0x82)
        }

        Store (0x56, P80H)
    }

    Method (_WAK, 1, NotSerialized)
    {
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (And (CFGD, 0x01000000))
            {
                If (LAnd (And (CFGD, 0xF0), LAnd (LEqual (OSYS, 0x07D1), 
                    LNot (And (PDC0, 0x10)))))
                {
                    Store (0x3D, SMIF)
                    Store (Zero, TRP0)
                }
            }
        }

        If (LEqual (RP1D, Zero))
        {
            Notify (\_SB.PCI0.RP01, Zero)
        }

        If (LEqual (Arg0, 0x03))
        {
            TRAP (0x46)
        }

        Store (0x31, P80H)
        Store (One, SLPS)
        Store (0x0F, \_SB.PCI0.USB1.U1SS)
        If (\_SB.PCI0.RP03.PMCS)
        {
            Store (One, \_SB.PCI0.RP03.PMCS)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (OEMB, \_SB.PCI0.GFX0.IRES)
            Store (0x0F, \_SB.PCI0.SATA.PCSR)
            PHIS (0x81)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (OEMB, \_SB.PCI0.GFX0.IRES)
            PHIS (0x83)
            If (DTSE)
            {
                TRAP (0x47)
            }

            Notify (\_TZ.TZ01, 0x80)
            Notify (\_SB.PWRB, 0x02)
            If (LEqual (OSYS, 0x07D2))
            {
                If (And (CFGD, One))
                {
                    If (LGreater (PPCS, Zero))
                    {
                        Subtract (PPCS, One, PPCS)
                        PNOT ()
                        Add (PPCS, One, PPCS)
                        PNOT ()
                    }
                    Else
                    {
                        Add (PPCS, One, PPCS)
                        PNOT ()
                        Subtract (PPCS, One, PPCS)
                        PNOT ()
                    }
                }
            }
        }

        Store (0x36, P80H)
        Return (Package (0x02)
        {
            Zero, 
            Zero
        })
    }

    Scope (_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
            Add (L01C, One, L01C)
            Sleep (0x64)
            If (LAnd (LEqual (RP1D, Zero), \_SB.PCI0.RP01.HPCS))
            {
                If (\_SB.PCI0.RP01.PDC1)
                {
                    Store (One, \_SB.PCI0.RP01.PDC1)
                    Store (One, \_SB.PCI0.RP01.HPCS)
                    Notify (\_SB.PCI0.RP01, Zero)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP01.HPCS)
                }
            }

            If (LAnd (LEqual (RP2D, Zero), \_SB.PCI0.RP02.HPCS))
            {
                If (\_SB.PCI0.RP02.PDC2)
                {
                    Store (One, \_SB.PCI0.RP02.PDC2)
                    Store (One, \_SB.PCI0.RP02.HPCS)
                    Notify (\_SB.PCI0.RP02, Zero)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP02.HPCS)
                }
            }

            If (LAnd (LEqual (RP3D, Zero), \_SB.PCI0.RP03.HPCS))
            {
                If (\_SB.PCI0.RP03.PDC3)
                {
                    Store (One, \_SB.PCI0.RP03.PDC3)
                    Store (One, \_SB.PCI0.RP03.HPCS)
                    Notify (\_SB.PCI0.RP03, Zero)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP03.HPCS)
                }
            }
        }

        Method (_L02, 0, NotSerialized)
        {
            Store (Zero, GPEC)
            Notify (\_TZ.TZ01, 0x80)
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
            If (HDAD)
            {
                Notify (\_SB.PCI0.MODM, 0x02)
            }
            Else
            {
                Notify (\_SB.PCI0.AZAL, 0x02)
            }
        }

        Method (_L09, 0, NotSerialized)
        {
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.PCIB, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB3, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB7, 0x02)
        }

        Method (_L0E, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB4, 0x02)
        }

        Method (_L1D, 0, NotSerialized)
        {
            Not (LPOL, LPOL)
            Notify (\_SB.LID, 0x80)
        }
    }

    Method (PNOT, 0, Serialized)
    {
        If (MPEN)
        {
            If (And (PDC0, 0x08))
            {
                Notify (\_PR.CPU0, 0x80)
                If (And (PDC0, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU0, 0x81)
                }
            }

            If (And (PDC1, 0x08))
            {
                Notify (\_PR.CPU1, 0x80)
                If (And (PDC1, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU1, 0x81)
                }
            }
        }
        Else
        {
            Notify (\_PR.CPU0, 0x80)
            Sleep (0x64)
            Notify (\_PR.CPU0, 0x81)
        }
    }

    Method (TRAP, 1, Serialized)
    {
        Store (Arg0, SMIF)
        Store (Zero, TRP0)
        Return (SMIF)
    }

    Scope (_TZ)
    {
        ThermalZone (TZ00)
        {
            Method (_CRT, 0, Serialized)
            {
                Return (0x0FA2)
            }

            Method (_TMP, 0, Serialized)
            {
                If (\_SB.PCI0.LPCB.ECOK ())
                {
                    Store (\_SB.PCI0.LPCB.EC0.CTMP, Local0)
                    If (And (Local0, 0x80))
                    {
                        Subtract (Local0, 0x0100, Local0)
                    }

                    Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
                }

                Return (0x0BB8)
            }
        }

        ThermalZone (TZ01)
        {
            Method (_CRT, 0, Serialized)
            {
                Return (Add (0x0AAC, Multiply (CRTT, 0x0A)))
            }

            Method (_SCP, 1, Serialized)
            {
                Store (Arg0, CTYP)
            }

            Method (_TMP, 0, Serialized)
            {
                If (DTSE)
                {
                    If (LGreaterEqual (DTS1, DTS2))
                    {
                        Store (Add (0x0AAC, Multiply (DTS1, 0x0A)), Local0)
                    }
                    Else
                    {
                        Store (Add (0x0AAC, Multiply (DTS2, 0x0A)), Local0)
                    }

                    Return (Local0)
                }

                If (\_SB.PCI0.LPCB.ECOK ())
                {
                    Store (\_SB.PCI0.LPCB.EC0.CTMP, Local0)
                    If (And (Local0, 0x80))
                    {
                        Subtract (Local0, 0x0100, Local0)
                    }

                    Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
                }

                Return (0x0BB8)
            }

            Method (_PSL, 0, Serialized)
            {
                If (MPEN)
                {
                    Return (Package (0x02)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1
                    })
                }

                Return (Package (0x01)
                {
                    \_PR.CPU0
                })
            }

            Method (_PSV, 0, Serialized)
            {
                Return (Add (0x0AAC, Multiply (PSVT, 0x0A)))
            }

            Method (_TC1, 0, Serialized)
            {
                Return (TC1V)
            }

            Method (_TC2, 0, Serialized)
            {
                Return (TC2V)
            }

            Method (_TSP, 0, Serialized)
            {
                Return (TSPV)
            }
        }
    }

    Method (GETP, 1, Serialized)
    {
        If (LEqual (And (Arg0, 0x09), Zero))
        {
            Return (Ones)
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

        Return (Ones)
    }

    Method (GETT, 1, Serialized)
    {
        Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02
            ), 0x03), And (Arg0, 0x03)))))
    }

    Method (GETF, 3, Serialized)
    {
        Name (TMPF, Zero)
        If (Arg0)
        {
            Or (TMPF, One, TMPF)
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

                If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, One)))
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
            Return (One)
        }

        If (LLessEqual (Arg0, 0x1E))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x2D))
        {
            Return (One)
        }

        If (LLessEqual (Arg0, 0x3C))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x5A))
        {
            Return (One)
        }

        Return (Zero)
    }

    Method (SETT, 3, Serialized)
    {
        If (And (Arg1, 0x02))
        {
            If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
            {
                Return (0x0B)
            }

            If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, One)))
            {
                Return (0x09)
            }
        }

        Return (0x04)
    }

    Name (FWSO, "FWSO")
    Scope (_SB)
    {
        Method (_INI, 0, NotSerialized)
        {
            If (DTSE)
            {
                TRAP (0x47)
            }

            Store (0x07D0, OSYS)
            If (CondRefOf (_OSI, Local0))
            {
                If (_OSI ("Linux"))
                {
                    Store (0x03E8, OSYS)
                }

                If (_OSI ("Windows 2001"))
                {
                    Store (0x07D1, OSYS)
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    Store (0x07D1, OSYS)
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    Store (0x07D2, OSYS)
                }

                If (_OSI ("Windows 2006"))
                {
                    Store (0x07D6, OSYS)
                }

                If (LAnd (MPEN, LEqual (OSYS, 0x07D1)))
                {
                    TRAP (0x3D)
                }
            }

            If (LGreaterEqual (OSYS, 0x07D0))
            {
                Store (One, PRM0)
                If (LGreaterEqual (OSYS, 0x07D1))
                {
                    Store (0x03, PRM0)
                }
            }
            Else
            {
                Store (Zero, PRM0)
            }

            TRAP (0x32)
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                Return (LPOL)
            }
        }

        Device (WMID)
        {
            Name (_HID, "PNP0C14")
            Name (_UID, Zero)
            Name (ERRD, 0x00010000)
            Name (BUFF, Buffer (0x04)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00
            })
            CreateByteField (BUFF, Zero, BF00)
            CreateByteField (BUFF, One, BF01)
            CreateByteField (BUFF, 0x02, BF02)
            CreateByteField (BUFF, 0x03, BF03)
            Name (BUF1, Buffer (0x04)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00
            })
            Name (AADS, Buffer (0x04)
            {
                /* 0000 */    0x00
            })
            CreateField (AADS, Zero, 0x04, AS00)
            CreateField (AADS, 0x04, One, AS01)
            CreateField (AADS, 0x05, One, AS02)
            CreateField (AADS, 0x10, 0x10, AS03)
            Name (BAEF, Zero)
            Name (BADF, Zero)
            Name (BADG, Package (0x03)
            {
                One, 
                One, 
                Zero
            })
            Name (BADS, Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Name (WLDS, Zero)
            Name (WLED, Zero)
            Name (BTDS, Zero)
            Name (BTED, Zero)
            Name (BLDS, Zero)
            Name (BLED, Zero)
            Name (NTDC, Zero)
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
                /* 0000 */    0x00, 0x00, 0x00, 0x00
            })
            CreateField (BBSB, Zero, 0x10, BBD0)
            CreateField (BBSB, 0x10, 0x10, BBD1)
            Name (TLS0, Zero)
            Name (TLS1, One)
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
                /* 0000 */    0x00, 0x00, 0x00, 0x00
            })
            CreateField (BDDS, Zero, 0x10, BDD0)
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
            CreateField (DSY0, Zero, 0x40, DY00)
            CreateField (DSY0, 0x40, 0x40, DY01)
            CreateField (DSY0, 0x80, 0x40, DY02)
            CreateField (DSY0, 0xC0, 0x40, DY03)
            CreateField (DSY0, 0x0100, 0x40, DY04)
            CreateField (DSY1, Zero, 0x40, DY10)
            CreateField (DSY1, 0x40, 0x40, DY11)
            CreateField (DSY1, 0x80, 0x40, DY12)
            CreateField (DSY2, Zero, 0x40, DY20)
            CreateField (DSY2, 0x40, 0x10, DY21)
            CreateField (DSY2, 0x50, 0x10, DY22)
            CreateField (DSY0, Zero, 0xC0, DSX4)
            Name (BEDS, Package (0x10)
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
                0x00010000
            })
            Name (WIT0, Zero)
            Name (DSY6, Buffer (0x14)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00
            })
            CreateField (DSY6, Zero, 0x20, DY60)
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
            CreateField (WPRW, Zero, 0x08, WWD0)
            CreateField (WPRW, 0x08, 0x08, WWD1)
            CreateField (WPRW, 0x10, 0x08, WWD2)
            CreateField (WPRW, 0x18, 0x08, WWD3)
            CreateField (WPRW, 0x20, 0x08, WWD4)
            CreateField (WPRW, 0x28, 0x20, WWD5)
            Name (WPCI, Buffer (0x04)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00
            })
            CreateField (WPCI, Zero, 0x08, WPIR)
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
            Name (GSTS, Zero)
            Name (BFEF, Zero)
            Name (BGEF, Zero)
            Name (BGDS, Package (0x01)
            {
                One
            })
            Method (AAF1, 0, NotSerialized)
            {
                Store (^^PCI0.LPCB.EC0.WLEX, AS00)
                Store (^^PCI0.LPCB.EC0.BTEX, AS01)
                Store (One, AS02)
                Store (Zero, AS03)
            }

            Method (Z000, 0, NotSerialized)
            {
                Store (^^PCI0.LPCB.EC0.WLAT, Local0)
                Store (Local0, Index (BADG, Zero))
                Store (^^PCI0.LPCB.EC0.BTAT, Local0)
                Store (Local0, Index (BADG, One))
                Store (^^PCI0.LPCB.EC0.BRTS, Local0)
                Store (Local0, Index (BADG, 0x02))
            }

            Method (Z001, 2, NotSerialized)
            {
                Store (Arg1, BUFF)
                Store (Arg0, Local0)
                Store (BF00, Local1)
                Store (Local0, Debug)
                Store (Local1, Debug)
                Store (Zero, Local2)
                Name (_T_0, Zero)
                Store (Local1, _T_0)
                If (LEqual (_T_0, Zero))
                {
                    Name (_T_1, Zero)
                    Store (Local0, _T_1)
                    If (LEqual (_T_1, 0x04))
                    {
                        Store (Zero, ^^PCI0.LPCB.EC0.WLAT)
                    }
                    Else
                    {
                        If (LEqual (_T_1, 0x05))
                        {
                            Store (Zero, ^^PCI0.LPCB.EC0.BTAT)
                        }
                        Else
                        {
                            If (LEqual (_T_1, 0x06))
                            {
                                Store (Zero, ^^PCI0.LPCB.EC0.BRTS)
                            }
                            Else
                            {
                                If (LEqual (_T_1, 0x07))
                                {
                                    Store (Zero, BAEF)
                                }
                                Else
                                {
                                    Store (One, Local2)
                                }
                            }
                        }
                    }
                }
                Else
                {
                    Name (_T_2, Zero)
                    Store (Local0, _T_2)
                    If (LEqual (_T_2, 0x04))
                    {
                        Store (One, ^^PCI0.LPCB.EC0.WLAT)
                        Store (Zero, Index (BADS, Zero))
                    }
                    Else
                    {
                        If (LEqual (_T_2, 0x05))
                        {
                            Store (One, ^^PCI0.LPCB.EC0.BTAT)
                            Store (Zero, Index (BADS, One))
                        }
                        Else
                        {
                            If (LEqual (_T_2, 0x06))
                            {
                                Store (Local1, ^^PCI0.LPCB.EC0.BRTS)
                                Store (Zero, Index (BADS, 0x02))
                            }
                            Else
                            {
                                If (LEqual (_T_2, 0x07))
                                {
                                    Store (One, BAEF)
                                    Store (Zero, Index (BADS, 0x03))
                                }
                                Else
                                {
                                    Store (One, Local2)
                                }
                            }
                        }
                    }
                }

                If (LEqual (Local2, One))
                {
                    Name (_T_3, Zero)
                    Store (Local0, _T_3)
                    If (LEqual (_T_3, 0x04))
                    {
                        Store (0x02, Index (BADS, Zero))
                    }
                    Else
                    {
                        If (LEqual (_T_3, 0x05))
                        {
                            Store (0x03, Index (BADS, Zero))
                        }
                        Else
                        {
                            If (LEqual (_T_3, 0x06))
                            {
                                Store (0x04, Index (BADS, Zero))
                            }
                        }
                    }
                }
            }

            Method (Z002, 0, NotSerialized)
            {
                If (LEqual (BAEF, One))
                {
                    Store (NTDC, Local0)
                    If (LNotEqual (Local0, Zero))
                    {
                        Store (Zero, NTDC)
                        Return (Local0)
                    }
                }

                If (LEqual (BFEF, One)) {}
                If (LEqual (BGEF, One)) {}
            }

            Method (Z003, 2, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (Arg1, BUFF)
                Store (Zero, BBSB)
                Name (_T_0, Zero)
                Store (Local0, _T_0)
                If (LEqual (_T_0, One))
                {
                    Store (^^PCI0.LPCB.EC0.THRO (Zero), Local1)
                    If (And (Local1, One))
                    {
                        Store (^^PCI0.LPCB.EC0.THRO (One), Local1)
                        Store (Local1, BBSB)
                    }
                }
                Else
                {
                    If (LEqual (_T_0, 0x02))
                    {
                        Store (BF00, Local1)
                        ^^PCI0.LPCB.EC0.CLCK (Local1)
                    }
                    Else
                    {
                        Store (0x00010000, BBSB)
                    }
                }
            }

            Method (Z004, 2, NotSerialized)
            {
            }

            Method (Z005, 1, NotSerialized)
            {
                Store (DSY5, DSY0)
                Store (Arg0, Local0)
                Store (PHWM (Zero, Arg0), Local2)
                Store (Local2, DSY6)
                Store (DY60, DY00)
                Store (DY61, DY01)
                Store (DY62, DY02)
                Store (DY63, DY03)
            }

            Method (Z006, 1, NotSerialized)
            {
                Store (DSY3, DSY1)
                Store (Arg0, DY00)
                Store (PHWM (One, Arg0), Local2)
                Store (Local2, DSY6)
                Store (DY60, DY10)
                Store (DY61, DY11)
                Store (Zero, WIT0)
                Store (WIT0, DY12)
            }

            Method (Z007, 1, NotSerialized)
            {
                Store (DSY3, DSY1)
                Store (PHWM (0x02, Arg0), Local2)
                Store (Local2, DSY6)
                Store (DY60, DY10)
                Store (DY61, DY11)
                Store (Zero, WIT0)
                Store (WIT0, DY12)
            }

            Method (Z008, 2, NotSerialized)
            {
                Store (Arg1, BUFF)
                If (LEqual (Arg0, 0x04))
                {
                    Store (BF00, ^^PCI0.LPCB.C4O3)
                    Store (BF00, Index (BCDS, 0x09))
                }
                Else
                {
                    Store (^^PCI0.LPCB.C4O3, Index (BCDS, 0x09))
                }
            }

            Method (Z009, 0, NotSerialized)
            {
                Store (^^PCI0.LPCB.EC0.THFN, Local0)
                Multiply (Local0, 0x64, Local1)
                Store (Local1, Index (BCDS, 0x0A))
            }

            Method (Z00A, 0, NotSerialized)
            {
                Store (^^PCI0.LPCB.EC0.CTMP, Index (BCDS, 0x0B))
            }

            Method (Z00B, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (PHWM (0x03, Arg0), Local2)
                Store (Local2, DY20)
                Store (Local2, DSY6)
                Store (DSY4, DSY2)
                Store (DY60, DY20)
            }

            Method (Z00C, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (Arg0, DY20)
                Store (PHWM (0x04, Arg0), Local2)
                Store (Local2, DSY6)
                Store (DY61, BUFF)
            }

            Method (Z00D, 0, NotSerialized)
            {
                Store (PHWM (0x05, Zero), Local2)
                Store (Local2, BUFF)
                Store (BUFF, Index (BCDS, 0x0C))
            }

            Method (Z00E, 2, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (Arg1, BUFF)
                If (LEqual (Local0, 0x0D))
                {
                    Store (BF02, BF00)
                    Store (BF01, Local1)
                }

                If (LEqual (Local0, 0x0E))
                {
                    If (LEqual (BF00, Zero))
                    {
                        Store (0xFF, BF00)
                    }
                    Else
                    {
                        Store (BF00, Local1)
                        Store (One, BF00)
                    }
                }

                Name (_T_0, Zero)
                Store (BF00, _T_0)
                If (LEqual (_T_0, One))
                {
                    If (LEqual (^^PCI0.LPCB.EC0.BDC0, Zero))
                    {
                        Store (0x00020000, Local1)
                        Decrement (Local0)
                        Store (Local1, Index (BEDS, Local0))
                    }
                    Else
                    {
                        Name (_T_1, Zero)
                        Store (Local0, _T_1)
                        If (LEqual (_T_1, One))
                        {
                            Store (Zero, Index (BEDS, Zero))
                        }
                        Else
                        {
                            If (LEqual (_T_1, 0x02))
                            {
                                Store (^^PCI0.LPCB.EC0.BPTC, Index (BEDS, One))
                            }
                            Else
                            {
                                If (LEqual (_T_1, 0x03))
                                {
                                    Store (^^PCI0.LPCB.EC0.BPV0, Index (BEDS, 0x02))
                                }
                                Else
                                {
                                    If (LEqual (_T_1, 0x04))
                                    {
                                        Store (^^PCI0.LPCB.EC0.BSCU, Index (BEDS, 0x03))
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_1, 0x05))
                                        {
                                            Store (^^PCI0.LPCB.EC0.BRC0, Index (BEDS, 0x04))
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_1, 0x06))
                                            {
                                                Store (^^PCI0.LPCB.EC0.BFC0, Index (BEDS, 0x05))
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_1, 0x07))
                                                {
                                                    Store (^^PCI0.LPCB.EC0.BSCY, Index (BEDS, 0x06))
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_1, 0x08))
                                                    {
                                                        Store (^^PCI0.LPCB.EC0.BDC0, Index (BEDS, 0x07))
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_1, 0x09))
                                                        {
                                                            Store (^^PCI0.LPCB.EC0.BDV0, Index (BEDS, 0x08))
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_1, 0x0A))
                                                            {
                                                                Store (^^PCI0.LPCB.EC0.BDAD, Index (BEDS, 0x09))
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_1, 0x0B))
                                                                {
                                                                    Store (^^PCI0.LPCB.EC0.BSN0, Index (BEDS, 0x0A))
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_1, 0x0C))
                                                                    {
                                                                        If (LEqual (^^PCI0.LPCB.EC0.ACIS, One))
                                                                        {
                                                                            Store (Zero, ^^PCI0.LPCB.EC0.PSRC)
                                                                            Store (One, Index (BEDS, 0x0B))
                                                                        }
                                                                        Else
                                                                        {
                                                                            Store (0x00020000, Index (BEDS, 0x0B))
                                                                        }
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_1, 0x0D))
                                                                        {
                                                                            Store (Local1, ^^PCI0.LPCB.EC0.BTMA)
                                                                            Store (One, ^^PCI0.LPCB.EC0.SCCF)
                                                                            Store (One, Index (BEDS, 0x0C))
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (_T_1, 0x0E))
                                                                            {
                                                                                Store (Local1, ^^PCI0.LPCB.EC0.BTPV)
                                                                                Store (Zero, ^^PCI0.LPCB.EC0.SCHG)
                                                                                Store (One, ^^PCI0.LPCB.EC0.SCPF)
                                                                                Store (One, Index (BEDS, 0x0D))
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (_T_1, 0x0F))
                                                                                {
                                                                                    Store (^^PCI0.LPCB.EC0.BDFC, Index (BEDS, 0x0E))
                                                                                }
                                                                                Else
                                                                                {
                                                                                    If (LEqual (_T_1, 0x10))
                                                                                    {
                                                                                        Store (^^PCI0.LPCB.EC0.BDME, Index (BEDS, 0x0F))
                                                                                    }
                                                                                    Else
                                                                                    {
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
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
                    Name (_T_2, Zero)
                    Store (Local0, _T_2)
                    If (LEqual (_T_2, One))
                    {
                        Store (0x00020000, Index (BEDS, Zero))
                    }
                    Else
                    {
                        If (LEqual (_T_2, 0x02))
                        {
                            Store (0x00020000, Index (BEDS, One))
                        }
                        Else
                        {
                            If (LEqual (_T_2, 0x03))
                            {
                                Store (0x00020000, Index (BEDS, 0x02))
                            }
                            Else
                            {
                                If (LEqual (_T_2, 0x04))
                                {
                                    Store (0x00020000, Index (BEDS, 0x03))
                                }
                                Else
                                {
                                    If (LEqual (_T_2, 0x05))
                                    {
                                        Store (0x00020000, Index (BEDS, 0x04))
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_2, 0x06))
                                        {
                                            Store (0x00020000, Index (BEDS, 0x05))
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_2, 0x07))
                                            {
                                                Store (0x00020000, Index (BEDS, 0x06))
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_2, 0x08))
                                                {
                                                    Store (0x00020000, Index (BEDS, 0x07))
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_2, 0x09))
                                                    {
                                                        Store (0x00020000, Index (BEDS, 0x08))
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_2, 0x0A))
                                                        {
                                                            Store (0x00020000, Index (BEDS, 0x09))
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_2, 0x0B))
                                                            {
                                                                Store (0x00020000, Index (BEDS, 0x0A))
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_2, 0x0C))
                                                                {
                                                                    If (LEqual (^^PCI0.LPCB.EC0.BDC0, Zero))
                                                                    {
                                                                        Store (0x00030000, Index (BEDS, 0x0B))
                                                                    }
                                                                    Else
                                                                    {
                                                                        Store (One, ^^PCI0.LPCB.EC0.PSRC)
                                                                        Store (One, Index (BEDS, 0x0B))
                                                                    }
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_2, 0x0D))
                                                                    {
                                                                        Store (0x00020000, Index (BEDS, 0x0C))
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_2, 0x0E))
                                                                        {
                                                                            Store (One, ^^PCI0.LPCB.EC0.SCHG)
                                                                            Store (One, ^^PCI0.LPCB.EC0.SCPF)
                                                                            Store (One, Index (BEDS, 0x0D))
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (_T_2, 0x0F))
                                                                            {
                                                                                Store (0x00020000, Index (BEDS, 0x0E))
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (_T_2, 0x10))
                                                                                {
                                                                                    Store (0x00020000, Index (BEDS, 0x0F))
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Method (Z00F, 0, NotSerialized)
            {
                Store (One, GSTS)
                Return (GSTS)
            }

            Method (Z00G, 1, NotSerialized)
            {
            }

            Method (Z00H, 1, NotSerialized)
            {
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

            Name (_WDG, Buffer (0xDC)
            {
                0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E, 
                0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A, 
                0x41, 0x41, /* AA */
                0x01, 
                0x01, 

                0x58, 0xF2, 0xF4, 0x6A, 0x01, 0xB4, 0xFD, 0x42, 
                0xBE, 0x91, 0x3D, 0x4A, 0xC2, 0xD7, 0xC0, 0xD3, 
                0x42, 0x41, /* AB */
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
                If (LLess (Arg1, 0x04))
                {
                    Z000 ()
                    Store (DerefOf (Index (BADG, Subtract (Arg1, One))), BUFF)
                    Return (BUFF)
                }
                Else
                {
                    If (LEqual (Arg1, 0x07))
                    {
                        Store (Arg2, BUFF)
                        If (BF00)
                        {
                            Store (One, BAEF)
                        }
                    }

                    Z001 (Arg1, Arg2)
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
                        Return (Z002 ())
                    }
                }
            }

            Method (WMBB, 3, NotSerialized)
            {
                Z003 (Arg1, Arg2)
                If (LEqual (Arg1, One))
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
                Z004 (Arg1, Arg2)
                If (LLess (Arg1, 0x0A))
                {
                    Subtract (Arg1, One, Local0)
                    Store (DerefOf (Index (BCDS, Subtract (Arg1, One))), BUFF)
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
                If (LEqual (Arg1, One))
                {
                    Store (Arg2, BUFF)
                    Store (BUFF, Local0)
                    Store (Arg2, WIT0)
                    Z005 (WIT0)
                    Return (DSY0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (Arg2, Local0)
                    Z006 (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (Arg2, Local0)
                    Z007 (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x04))
                {
                    Z008 (Arg1, Arg2)
                    ShiftRight (DerefOf (Index (BCDS, Add (Arg1, 0x05))), 0x10, 
                        BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x05))
                {
                    Z008 (Arg1, Arg2)
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x06))
                {
                    Z009 ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x07))
                {
                    Z00A ()
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
                    Z00B (Local0)
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
                    Z00C (Local1)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x0A))
                {
                    Z00D ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x02))), BUFF)
                    Return (BUFF)
                }
            }

            Method (WMBE, 3, NotSerialized)
            {
                Z00E (Arg1, Arg2)
                Store (BUFF, Debug)
                Store (BEDS, Debug)
                Store (DerefOf (Index (BEDS, Subtract (Arg1, One))), BUFF)
                Store (BUFF, Debug)
                Return (BUFF)
            }

            Method (WMBF, 3, NotSerialized)
            {
                If (LGreater (Arg1, 0x04))
                {
                    Store (0x02, BF00)
                    Store (Zero, BF01)
                    Store (Zero, BF02)
                    Store (Zero, BF03)
                    Return (BUFF)
                }

                If (Z00F ())
                {
                    Store (Arg2, BUFF)
                    If (LEqual (Arg1, One))
                    {
                        Z00G (BF00)
                    }
                    Else
                    {
                        If (LEqual (Arg1, 0x02))
                        {
                            Z00H (BF00)
                        }
                        Else
                        {
                            If (LEqual (Arg1, 0x03))
                            {
                                Z00I (BF00)
                            }
                            Else
                            {
                                Z00J (BF00)
                            }
                        }
                    }

                    Store (DerefOf (Index (BFDS, Subtract (Arg1, One))), BUFF)
                    Store (BUFF, Debug)
                }
                Else
                {
                    Store (0x03, BF00)
                    Store (Zero, BF01)
                    Store (Zero, BF02)
                    Store (Zero, BF03)
                }

                Return (BUFF)
            }

            Method (WMBG, 3, NotSerialized)
            {
                Store (Arg2, BUFF)
                Z00K (BF00)
                Store (DerefOf (Index (BGDS, Subtract (Arg1, One))), BUFF)
                Store (BUFF, Debug)
                Return (BUFF)
            }
        }

        OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
        Field (SMI0, AnyAcc, NoLock, Preserve)
        {
            SMIC,   8
        }

        OperationRegion (SMI1, SystemMemory, 0x3FE8DEBD, 0x00000090)
        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
            WCMD,   8, 
            WDID,   32, 
            TPID,   8, 
            DI00,   320
        }

        Field (SMI1, AnyAcc, NoLock, Preserve)
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
            Acquire (PSMX, 0xFFFF)
            Store (0xE0, WCMD)
            Store (0x57, TPID)
            Store (Arg0, WDID)
            Store (Arg1, DI00)
            Store (Zero, SMIC)
            Store (DI00, Local0)
            Release (PSMX)
            Return (Local0)
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, 0x030AD041)
            Name (_ADR, Zero)
            Name (_BBN, Zero)
            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                        Offset (0x50), 
                    ,   4, 
                PM0H,   2, 
                        Offset (0x51), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                        Offset (0x52), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                        Offset (0x53), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                        Offset (0x54), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                        Offset (0x55), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                        Offset (0x56), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                        Offset (0x57), 
                    ,   7, 
                HENA,   1, 
                        Offset (0x5C), 
                    ,   3, 
                TOUD,   5
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
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
                    ,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED40000,         // Range Minimum
                    0xFED44FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                If (PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y00._LEN, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y00._RW, C0RW)
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C4RW)
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C8RW)
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, CCRW)
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, D0RW)
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D4RW)
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D8RW)
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, DCRW)
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, E0RW)
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E4RW)
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E8RW)
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, ECRW)
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, F0RW)
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MIN, M1MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MAX, M1MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, M1LN)
                ShiftLeft (TOUD, 0x1B, M1MN)
                Add (Subtract (M1MX, M1MN), One, M1LN)
                Return (BUF0)
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x11)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            Zero, 
                            Zero, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            Zero, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            One, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            Zero, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            One, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            Zero, 
                            Zero, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            One, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            Zero, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            One, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            Zero, 
                            0x10
                        }
                    })
                }
                Else
                {
                    Return (Package (0x11)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            ^LPCB.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            ^LPCB.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            Zero, 
                            ^LPCB.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            Zero, 
                            ^LPCB.LNKG, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            Zero, 
                            ^LPCB.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            One, 
                            ^LPCB.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            ^LPCB.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            ^LPCB.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            Zero, 
                            ^LPCB.LNKH, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            One, 
                            ^LPCB.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            ^LPCB.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            ^LPCB.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            Zero, 
                            ^LPCB.LNKG, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            One, 
                            ^LPCB.LNKE, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            Zero, 
                            ^LPCB.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            One, 
                            ^LPCB.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            ^LPCB.LNKA, 
                            Zero
                        }
                    })
                }
            }

            Device (PDRC)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, One)
                Name (_CRS, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED14000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED18000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED19000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED1C000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00020000,         // Address Length
                        )
                })
            }

            Device (PEGP)
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
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
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
                                Zero, 
                                ^^LPCB.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKD, 
                                Zero
                            }
                        })
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)
                    Name (NHKI, Zero)
                    Name (NCDD, Package (0x0B)
                    {
                        One, 
                        One, 
                        One, 
                        0x05, 
                        0x05, 
                        0x03, 
                        0x03, 
                        0x04, 
                        0x04, 
                        0x02, 
                        0x02
                    })
                    Name (NADD, Package (0x0B)
                    {
                        0x03, 
                        0x05, 
                        0x07, 
                        0x05, 
                        0x07, 
                        0x03, 
                        0x07, 
                        0x07, 
                        0x05, 
                        0x07, 
                        0x03
                    })
                    Name (NNDD, Package (0x0B)
                    {
                        0x02, 
                        0x04, 
                        0x02, 
                        One, 
                        One, 
                        One, 
                        0x05, 
                        0x03, 
                        0x05, 
                        0x04, 
                        0x03
                    })
                    OperationRegion (EGFX, PCI_Config, Zero, 0x04)
                    Field (EGFX, DWordAcc, NoLock, Preserve)
                    {
                        EVID,   16
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (And (Arg0, 0x03), DSEN)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x00010200
                        })
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
                        Method (_DCS, 0, NotSerialized)
                        {
                            PHIS (0x0C)
                            If (And (CSTE, One))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (And (NSTE, One))
                            {
                                Return (One)
                            }

                            Return (Zero)
                        }
                    }

                    Device (CRT1)
                    {
                        Name (_ADR, 0x0100)
                        Method (_DCS, 0, NotSerialized)
                        {
                            PHIS (0x0C)
                            If (And (CSTE, 0x02))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (And (NSTE, 0x02))
                            {
                                Return (One)
                            }

                            Return (Zero)
                        }
                    }

                    Device (DTV1)
                    {
                        Name (_ADR, 0x0200)
                        Method (_DCS, 0, NotSerialized)
                        {
                            PHIS (0x0C)
                            If (And (CSTE, 0x04))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (And (NSTE, 0x04))
                            {
                                Return (One)
                            }

                            Return (Zero)
                        }
                    }

                    Method (DSSW, 0, NotSerialized)
                    {
                        If (LEqual (Zero, DSEN))
                        {
                            PHIS (0x0C)
                            Store (0x0B, NHKI)
                            Store (One, NSTE)
                            And (CADL, 0x07, CADL)
                            And (CSTE, 0x07, CSTE)
                            While (NHKI)
                            {
                                Decrement (NHKI)
                                Store (DerefOf (Index (NCDD, NHKI)), Local0)
                                If (LEqual (Local0, CSTE))
                                {
                                    Store (DerefOf (Index (NADD, NHKI)), Local0)
                                    If (LEqual (Local0, CADL))
                                    {
                                        Store (DerefOf (Index (NNDD, NHKI)), NSTE)
                                        Store (Zero, NHKI)
                                    }
                                }
                            }

                            Notify (VGA, 0x80)
                        }

                        If (LEqual (One, DSEN))
                        {
                            PHIS (One)
                            Notify (VGA, 0x81)
                        }
                    }
                }
            }

            Device (GFX0)
            {
                Name (_ADR, 0x00020000)
                Name (IHKI, Zero)
                Name (ICDD, Package (0x0B)
                {
                    0x08, 
                    0x08, 
                    0x08, 
                    0x0A, 
                    0x0A, 
                    0x09, 
                    0x09, 
                    0x02, 
                    0x02, 
                    One, 
                    One
                })
                Name (IADD, Package (0x0B)
                {
                    0x09, 
                    0x0A, 
                    0x0B, 
                    0x0A, 
                    0x0B, 
                    0x09, 
                    0x0B, 
                    0x0B, 
                    0x0A, 
                    0x0B, 
                    0x09
                })
                Name (INDD, Package (0x0B)
                {
                    One, 
                    0x02, 
                    One, 
                    0x08, 
                    0x08, 
                    0x08, 
                    0x0A, 
                    0x09, 
                    0x0A, 
                    0x02, 
                    0x09
                })
                OperationRegion (IGFX, PCI_Config, Zero, 0xA4)
                Field (IGFX, DWordAcc, NoLock, Preserve)
                {
                    IVID,   16, 
                            Offset (0x95), 
                    IRES,   24
                }

                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x03), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Return (Package (0x03)
                    {
                        0x00010100, 
                        0x00010400, 
                        0x00010200
                    })
                }

                Device (LCD)
                {
                    Name (_ADR, 0x0400)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHIS (0x0C)
                        If (And (CSTE, 0x08))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x08))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }
                }

                Device (CRT1)
                {
                    Name (_ADR, 0x0100)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHIS (0x0C)
                        If (And (CSTE, One))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, One))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }
                }

                Device (DTV1)
                {
                    Name (_ADR, 0x0200)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHIS (0x0C)
                        If (And (CSTE, 0x02))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x02))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }
                }

                Method (DSSW, 0, NotSerialized)
                {
                    If (LEqual (Zero, DSEN))
                    {
                        PHIS (0x0C)
                        Store (0x0B, IHKI)
                        Store (0x08, NSTE)
                        And (CADL, 0x0B, CADL)
                        And (CSTE, 0x0B, CSTE)
                        While (IHKI)
                        {
                            Decrement (IHKI)
                            Store (DerefOf (Index (ICDD, IHKI)), Local0)
                            If (LEqual (Local0, CSTE))
                            {
                                Store (DerefOf (Index (IADD, IHKI)), Local0)
                                If (LEqual (Local0, CADL))
                                {
                                    Store (DerefOf (Index (INDD, IHKI)), NSTE)
                                    Store (Zero, IHKI)
                                }
                            }
                        }

                        Notify (GFX0, 0x80)
                    }
                    Else
                    {
                        PHIS (One)
                        Notify (GFX0, 0x81)
                    }
                }
            }

            Device (RP01)
            {
                Name (_ADR, 0x001C0000)
                OperationRegion (P1CS, PCI_Config, 0x40, 0x0100)
                Field (P1CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP1,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS1)
                {
                    Name (_ADR, Zero)
                    OperationRegion (P1FG, PCI_Config, Zero, 0x08)
                    Field (P1FG, DWordAcc, NoLock, Preserve)
                    {
                        P1ID,   32
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (P1ID, Ones))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                    Name (_EJD, "\\_SB.PCI0.USB7.HUB7.PRT2")
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
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
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
                                Zero, 
                                ^^LPCB.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKD, 
                                Zero
                            }
                        })
                    }
                }
            }

            Device (RP02)
            {
                Name (_ADR, 0x001C0001)
                OperationRegion (P2CS, PCI_Config, 0x40, 0x0100)
                Field (P2CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x1A), 
                    ABP2,   1, 
                        ,   2, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP2,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS2)
                {
                    Name (_ADR, Zero)
                    OperationRegion (P2FG, PCI_Config, Zero, 0x08)
                    Field (P2FG, DWordAcc, NoLock, Preserve)
                    {
                        P2ID,   32
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (P2ID, Ones))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                    Name (_EJD, "\\_SB.PCI0.USB7.HUB7.PRT8")
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
                                Zero, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
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
                                Zero, 
                                ^^LPCB.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKA, 
                                Zero
                            }
                        })
                    }
                }
            }

            Device (RP03)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (P3CS, PCI_Config, 0x40, 0x0100)
                Field (P3CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x1A), 
                    ABP3,   1, 
                        ,   2, 
                    PDC3,   1, 
                        ,   2, 
                    PDS3,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP3,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
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
                                Zero, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
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
                                Zero, 
                                ^^LPCB.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKB, 
                                Zero
                            }
                        })
                    }
                }

                Device (BCOL)
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                    Name (LANP, Zero)
                    Method (_PSW, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Store (Zero, LANP)
                        }
                        Else
                        {
                            Store (One, LANP)
                        }
                    }
                }
            }

            Device (RP04)
            {
                Name (_ADR, 0x001C0003)
                OperationRegion (P4CS, PCI_Config, 0x40, 0x0100)
                Field (P4CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x1A), 
                    ABP4,   1, 
                        ,   2, 
                    PDC4,   1, 
                        ,   2, 
                    PDS4,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP4,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS4)
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
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
                                Zero, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
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
                                Zero, 
                                ^^LPCB.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKC, 
                                Zero
                            }
                        })
                    }
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0000)
                Device (HUB1)
                {
                    Name (_ADR, Zero)
                    Device (PRT1)
                    {
                        Name (_ADR, One)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                        Name (_EJD, "\\_SB.PCI0.RP01.PXS1")
                    }
                }

                OperationRegion (U1CS, PCI_Config, 0xC0, 0x08)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x01), 
                    U1SS,   4, 
                            Offset (0x04), 
                    U1EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (Zero, U1EN)
                    }
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0001)
                Device (HUB2)
                {
                    Name (_ADR, Zero)
                    Device (PRT1)
                    {
                        Name (_ADR, One)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }
                }

                OperationRegion (U2CS, PCI_Config, 0xC0, 0x08)
                Field (U2CS, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x01), 
                    U2SS,   4, 
                            Offset (0x04), 
                    U2EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U2EN)
                    }
                    Else
                    {
                        Store (Zero, U2EN)
                    }
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x001D0002)
                Device (HUB3)
                {
                    Name (_ADR, Zero)
                    Device (PRT1)
                    {
                        Name (_ADR, One)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }
                }

                OperationRegion (U3CS, PCI_Config, 0xC0, 0x08)
                Field (U3CS, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x01), 
                    U3SS,   4, 
                            Offset (0x04), 
                    U3EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U3EN)
                    }
                    Else
                    {
                        Store (Zero, U3EN)
                    }
                }
            }

            Device (USB4)
            {
                Name (_ADR, 0x001D0003)
                Device (HUB4)
                {
                    Name (_ADR, Zero)
                    Device (PRT1)
                    {
                        Name (_ADR, One)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                        Name (_EJD, "\\_SB.PCI0.RP02.PXS2")
                    }
                }

                OperationRegion (U4CS, PCI_Config, 0xC0, 0x08)
                Field (U4CS, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x01), 
                    U4SS,   4, 
                            Offset (0x04), 
                    U4EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U4EN)
                    }
                    Else
                    {
                        Store (Zero, U4EN)
                    }
                }
            }

            Device (USB7)
            {
                Name (_ADR, 0x001D0007)
                Device (HUB7)
                {
                    Name (_ADR, Zero)
                    OperationRegion (U7CS, PCI_Config, 0x72, 0x04)
                    Field (U7CS, DWordAcc, NoLock, Preserve)
                    {
                        U7SS,   14
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Store (0x10, U7SS)
                        Return (0x0F)
                    }

                    Device (PRT1)
                    {
                        Name (_ADR, One)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                        Name (_EJD, "\\_SB.PCI0.RP01.PXS1")
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)
                    }

                    Device (PRT6)
                    {
                        Name (_ADR, 0x06)
                    }

                    Device (PRT7)
                    {
                        Name (_ADR, 0x07)
                    }

                    Device (PRT8)
                    {
                        Name (_ADR, 0x08)
                        Name (_EJD, "\\_SB.PCI0.RP02.PXS2")
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)
                Device (LANC)
                {
                    Name (_ADR, 0x00010000)
                    Name (_PRW, Package (0x02)
                    {
                        0x08, 
                        0x05
                    })
                    Name (LANP, Zero)
                    Method (_PSW, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Store (Zero, LANP)
                        }
                        Else
                        {
                            Store (One, LANP)
                        }
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
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                Zero, 
                                Zero, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                Zero, 
                                Zero, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                One, 
                                Zero, 
                                0x17
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                One, 
                                Zero, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x06)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPCB.LNKE, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                Zero, 
                                ^^LPCB.LNKF, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                Zero, 
                                ^^LPCB.LNKG, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                One, 
                                ^^LPCB.LNKH, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                Zero, 
                                ^^LPCB.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                One, 
                                ^^LPCB.LNKB, 
                                Zero
                            }
                        })
                    }
                }
            }

            Device (MODM)
            {
                Name (_ADR, 0x001E0003)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)
                OperationRegion (LPC0, PCI_Config, 0x40, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x20), 
                    PARC,   8, 
                    PBRC,   8, 
                    PCRC,   8, 
                    PDRC,   8, 
                            Offset (0x28), 
                    PERC,   8, 
                    PFRC,   8, 
                    PGRC,   8, 
                    PHRC,   8, 
                            Offset (0x40), 
                    IOD0,   8, 
                    IOD1,   8, 
                    CMA0,   1, 
                    CMB0,   1, 
                    LP0E,   1, 
                    FDDE,   1, 
                            Offset (0x44), 
                    DIO1,   16, 
                    RIO1,   8, 
                            Offset (0x60), 
                        ,   7, 
                    C4O3,   1
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, One)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PARC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,5,6,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLA, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLA, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PARC, 0x0F), IRQ0)
                        Return (RTLA)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PARC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PARC, 0x80))
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
                        Store (0x80, PBRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,5,6,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLB, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLB, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PBRC, 0x0F), IRQ0)
                        Return (RTLB)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PBRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PBRC, 0x80))
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
                        Store (0x80, PCRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,5,6,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLC, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLC, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PCRC, 0x0F), IRQ0)
                        Return (RTLC)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PCRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PCRC, 0x80))
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
                        Store (0x80, PDRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,5,6,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLD, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLD, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PDRC, 0x0F), IRQ0)
                        Return (RTLD)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PDRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PDRC, 0x80))
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
                        Store (0x80, PERC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,5,6,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLE, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLE, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PERC, 0x0F), IRQ0)
                        Return (RTLE)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PERC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PERC, 0x80))
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
                        Store (0x80, PFRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,5,6,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLF, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLF, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PFRC, 0x0F), IRQ0)
                        Return (RTLF)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PFRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PFRC, 0x80))
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
                        Store (0x80, PGRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,5,6,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLG, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLG, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PGRC, 0x0F), IRQ0)
                        Return (RTLG)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PGRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PGRC, 0x80))
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
                        Store (0x80, PHRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,5,6,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLH, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLH, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PHRC, 0x0F), IRQ0)
                        Return (RTLH)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PHRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PHRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Method (ECOK, 0, NotSerialized)
                {
                    If (LEqual (^EC0.ECRY, One))
                    {
                        Return (One)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x19)
                    Name (ECRY, Zero)
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
                            Store (Arg1, ECRY)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
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
                                Offset (0x9F), 
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
                        ADP,    1, 
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
                        If (LEqual (Local0, Zero))
                        {
                            Store (Zero, THEN)
                        }
                        Else
                        {
                            Not (Local0, Local0)
                            Add (Local0, One, Local0)
                            And (Local0, 0x07, Local0)
                            Store (Local0, DUTY)
                            If (LEqual (Local0, Zero))
                            {
                                Store (Zero, THEN)
                            }
                            Else
                            {
                                Store (One, THEN)
                            }
                        }
                    }

                    Method (_Q2D, 0, NotSerialized)
                    {
                        PHIS (0x02)
                    }

                    Method (_Q1D, 0, NotSerialized)
                    {
                        PCLK ()
                    }

                    Method (_Q22, 0, NotSerialized)
                    {
                        Notify (BAT1, 0x80)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Notify (BAT1, 0x81)
                        Notify (BAT1, 0x80)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (BTAT, Local1)
                            Store (^^^^WMID.BLTD, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, ^^^^WMID.NTDC)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q37, 0, NotSerialized)
                    {
                        Notify (ACAD, Zero)
                        Sleep (0x03E8)
                        Notify (BAT1, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q38, 0, NotSerialized)
                    {
                        Notify (ACAD, One)
                        Sleep (0x03E8)
                        Notify (BAT1, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q60, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (WLAT, Local1)
                            Store (^^^^WMID.WLSD, Local2)
                            Add (Local2, Local1, Local2)
                            Store (Local2, ^^^^WMID.NTDC)
                            Notify (WMID, 0x80)
                        }
                    }

                    OperationRegion (CCLK, SystemIO, 0x1010, 0x04)
                    Field (CCLK, DWordAcc, NoLock, Preserve)
                    {
                            ,   1, 
                        DUTY,   3, 
                        THEN,   1, 
                                Offset (0x01), 
                        FTT,    1, 
                            ,   8, 
                        TSTS,   1
                    }

                    OperationRegion (ECRM, EmbeddedControl, Zero, 0xFF)
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
                        If (LEqual (Arg0, Zero))
                        {
                            Return (THEN)
                        }
                        Else
                        {
                            If (LEqual (Arg0, One))
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
                        If (LEqual (Arg0, Zero))
                        {
                            Store (Zero, THEN)
                        }
                        Else
                        {
                            Store (Arg0, DUTY)
                            Store (One, THEN)
                        }

                        Return (THEN)
                    }
                }

                Device (BAT1)
                {
                    Name (_HID, EisaId ("PNP0C0A"))
                    Name (_UID, One)
                    Name (_PCL, Package (0x01)
                    {
                        _SB
                    })
                    Name (PBIF, Package (0x0D)
                    {
                        One, 
                        0x0FA0, 
                        0x0FA0, 
                        One, 
                        0x39D0, 
                        0x0190, 
                        0x78, 
                        0x0108, 
                        0x0EC4, 
                        "Li_Ion 4000mA ", 
                        "", 
                        "Lion", 
                        "COMPAL "
                    })
                    Name (PBST, Package (0x04)
                    {
                        One, 
                        Ones, 
                        Ones, 
                        0x39D0
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            If (^^EC0.BAL0)
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
                            Store (^^EC0.BDC0, Index (PBIF, One))
                            Sleep (0x14)
                            Store (^^EC0.BFC0, Index (PBIF, 0x02))
                            Sleep (0x14)
                            Store (^^EC0.BDV0, Index (PBIF, 0x04))
                            Sleep (0x14)
                            Store (^^EC0.BDC0, Local2)
                            Divide (Local2, 0x64, Local6, Local2)
                            Multiply (Local2, 0x05, Local3)
                            Store (Local3, Index (PBIF, 0x05))
                            Multiply (Local2, 0x03, Local4)
                            Store (Local4, Index (PBIF, 0x06))
                            Store (^^EC0.BMF0, Local1)
                            Sleep (0x14)
                            If (LEqual (Local1, One))
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
                            Store (^^EC0.BST0, Local0)
                            And (Local0, 0x07, Local0)
                            Store (Local0, Index (PBST, Zero))
                            Sleep (0x14)
                            Store (^^EC0.GAU0, Local2)
                            Sleep (0x14)
                            Store (^^EC0.BPV0, Local3)
                            Sleep (0x14)
                            Store (^^EC0.BFC0, Local1)
                            Sleep (0x14)
                            If (Local2)
                            {
                                Multiply (Local2, Local1, Local2)
                                Divide (Local2, 0x64, Local6, Local2)
                                If (Local6)
                                {
                                    Increment (Local2)
                                }
                            }

                            Store (^^EC0.BAC0, Local1)
                            If (And (Local1, 0x8000, Local1))
                            {
                                Store (^^EC0.BAC0, Local1)
                                Subtract (0xFFFF, Local1, Local1)
                            }
                            Else
                            {
                                Store (Zero, Local1)
                            }

                            Sleep (0x14)
                            Store (Local1, Index (PBST, One))
                            Store (Local2, Index (PBST, 0x02))
                            Store (Local3, Index (PBST, 0x03))
                        }

                        Return (PBST)
                    }
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
                            0x11,               // Length
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
                    Name (_CID, 0x010CD041)
                    Name (BUF0, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y0E)
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSYS, 0x07D1))
                        {
                            If (HPAE)
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            If (HPAE)
                            {
                                Return (0x0B)
                            }
                        }

                        Return (Zero)
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        If (HPAE)
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPCB.HPET._Y0E._BAS, HPT0)
                            If (LEqual (HPAS, One))
                            {
                                Store (0xFED01000, HPT0)
                            }

                            If (LEqual (HPAS, 0x02))
                            {
                                Store (0xFED02000, HPT0)
                            }

                            If (LEqual (HPAS, 0x03))
                            {
                                Store (0xFED03000, HPT0)
                            }
                        }

                        Return (BUF0)
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

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x02)
                    Name (BUF0, ResourceTemplate ()
                    {
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
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
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
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
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
                        IO (Decode16,
                            0x1640,             // Range Minimum
                            0x1640,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x01,               // Alignment
                            0xFF,               // Length
                            )
                        IO (Decode16,
                            0xFF2C,             // Range Minimum
                            0xFF2C,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
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
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
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
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
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
                        IO (Decode16,
                            0x1640,             // Range Minimum
                            0x1640,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x01,               // Alignment
                            0xFF,               // Length
                            )
                        IO (Decode16,
                            0xFF2C,             // Range Minimum
                            0xFF2C,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (CIRP)
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
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
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (TIMR)
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
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (KBTP, 0x4A))
                        {
                            Return (Zero)
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
                            Return (Zero)
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

                Device (MSE0)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreater (TSTE, One))
                        {
                            Return (Zero)
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
                }

                Device (MSS0)
                {
                    Name (_HID, EisaId ("SYN0703"))
                    Name (_CID, Package (0x03)
                    {
                        0x00072E4F, 
                        0x02002E4F, 
                        0x130FD041
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreater (TSTE, One))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (ACAD)
                {
                    Name (_HID, "ACPI0003")
                    Name (_PCL, Package (0x01)
                    {
                        _SB
                    })
                    Method (_PSR, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            Return (^^EC0.ADP)
                        }

                        Return (One)
                    }
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
                        If (LEqual (Arg0, Zero))
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
                        If (LEqual (Arg0, Zero))
                        {
                            WRRG (Arg1, Arg2)
                        }

                        Release (S227)
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("SMCF010"))
                        Name (FENA, One)
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                _Y0F)
                            IO (Decode16,
                                0x0230,             // Range Minimum
                                0x0230,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                _Y10)
                            IRQNoFlags (_Y11)
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8, _Y12)
                                {3}
                        })
                        Name (RSRC, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x00,               // Alignment
                                0x00,               // Length
                                )
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x00,               // Alignment
                                0x00,               // Length
                                )
                            IRQNoFlags ()
                                {0}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0}
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (CMBP, Zero))
                            {
                                Return (Zero)
                            }

                            Store (READ (Zero, 0x25, 0xFF), Local0)
                            If (LEqual (Local0, 0xFE))
                            {
                                Store (Zero, Local1)
                            }

                            If (LEqual (Local0, 0xBE))
                            {
                                Store (0x10, Local1)
                            }

                            If (LEqual (Local0, 0xBA))
                            {
                                Store (0x50, Local1)
                            }

                            If (LEqual (Local0, 0xFA))
                            {
                                Store (0x70, Local1)
                            }

                            Store (IOD0, Local0)
                            And (Local0, 0x0F, Local0)
                            Or (Local0, Local1, Local0)
                            Store (Local0, IOD0)
                            If (FENA)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x0D)
                            }
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateByteField (Arg0, 0x0A, I2LO)
                            CreateByteField (Arg0, 0x0B, I2HI)
                            CreateByteField (Arg0, 0x11, IRQL)
                            CreateByteField (Arg0, 0x14, DMAC)
                            WRIT (Zero, 0x25, Zero)
                            FindSetRightBit (IRQL, Local0)
                            Decrement (Local0)
                            Store (READ (Zero, 0x28, 0xF0), Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (Zero, 0x28, Local0)
                            Store (IOLO, Local0)
                            ShiftRight (Local0, 0x02, Local0)
                            And (Local0, 0xFE, Local0)
                            Store (IOHI, Local1)
                            ShiftLeft (Local1, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (Zero, 0x25, Local0)
                            Store (I2LO, Local0)
                            ShiftRight (Local0, 0x03, Local0)
                            Store (I2HI, Local1)
                            ShiftLeft (Local1, 0x05, Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (Zero, 0x2B, Local0)
                            Store (Local0, Local3)
                            ShiftLeft (Local3, 0x03, Local3)
                            Or (Local3, One, Local3)
                            Store (Local3, DIO1)
                            FindSetRightBit (DMAC, Local0)
                            Decrement (Local0)
                            WRIT (Zero, 0x2C, Local0)
                            Store (READ (Zero, 0x0A, 0xFF), Local0)
                            Not (0xC0, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x40, Local0)
                            WRIT (Zero, 0x0A, Local0)
                            Store (READ (Zero, 0x0C, 0xFF), Local0)
                            Not (0x38, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x0E, Local0)
                            WRIT (Zero, 0x0C, Local0)
                            Store (READ (Zero, 0x02, 0xFF), Local0)
                            Or (Local0, 0x80, Local0)
                            WRIT (Zero, 0x02, Local0)
                            Store (READ (Zero, 0x07, 0xFF), Local0)
                            Not (0x20, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (Zero, 0x07, Local0)
                            Store (One, FENA)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            If (LNotEqual (_STA (), 0x0F))
                            {
                                Return (RSRC)
                            }

                            CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO.FIR._Y0F._MIN, IOLO)
                            CreateByteField (BUF0, 0x03, IOHI)
                            CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO.FIR._Y0F._MAX, IORL)
                            CreateByteField (BUF0, 0x05, IORH)
                            CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO.FIR._Y10._MIN, I2LO)
                            CreateByteField (BUF0, 0x0B, I2HI)
                            CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO.FIR._Y10._MAX, I2RL)
                            CreateByteField (BUF0, 0x0D, I2RH)
                            CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO.FIR._Y11._INT, IRQL)
                            CreateByteField (BUF0, 0x12, IRQH)
                            CreateByteField (BUF0, \_SB.PCI0.LPCB.SIO.FIR._Y12._DMA, DMAC)
                            Store (READ (Zero, 0x25, 0xFF), Local0)
                            Store (Local0, Local1)
                            And (Local1, 0xC0, Local1)
                            ShiftRight (Local1, 0x06, Local1)
                            ShiftLeft (Local0, 0x02, Local0)
                            And (Local0, 0xFF, Local0)
                            Store (Local0, IOLO)
                            Store (Local1, IOHI)
                            Store (IOLO, IORL)
                            Store (IOHI, IORH)
                            Store (READ (Zero, 0x2B, 0xFF), Local0)
                            ShiftLeft (Local0, 0x03, Local0)
                            And (Local0, 0xFF, Local1)
                            ShiftRight (Local0, 0x08, Local0)
                            Store (Local1, I2LO)
                            Store (Local0, I2HI)
                            Store (I2LO, I2RL)
                            Store (I2HI, I2RH)
                            Store (READ (Zero, 0x28, 0x0F), Local0)
                            Store (One, Local1)
                            ShiftLeft (Local1, Local0, IRQL)
                            Store (Zero, IRQH)
                            Store (READ (Zero, 0x2C, 0x0F), Local0)
                            Store (One, Local1)
                            ShiftLeft (Local1, Local0, DMAC)
                            Return (BUF0)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {2}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {2}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {2}
                            }
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0230,             // Range Minimum
                                    0x0230,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, BusMaster, Transfer8, )
                                    {2}
                            }
                            EndDependentFn ()
                        })
                        Method (_DIS, 0, NotSerialized)
                        {
                            Store (READ (Zero, 0x25, 0xFF), Local0)
                            Store (Zero, FENA)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (READ (Zero, 0x02, 0xFF), Local0)
                            Or (Local0, 0x80, Local0)
                            WRIT (Zero, 0x02, Local0)
                            Store (READ (Zero, 0x07, 0xFF), Local0)
                            Not (0x20, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (Zero, 0x07, Local0)
                        }

                        Method (_PS1, 0, NotSerialized)
                        {
                            Store (READ (Zero, 0x07, 0xFF), Local0)
                            Or (Local0, 0x20, Local0)
                            WRIT (Zero, 0x07, Local0)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (READ (Zero, 0x02, 0xFF), Local0)
                            Not (0x80, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (Zero, 0x02, Local0)
                        }
                    }
                }
            }

            Device (PATA)
            {
                Name (_ADR, 0x001F0001)
                OperationRegion (PACS, PCI_Config, 0x40, 0xC0)
                Field (PACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                            Offset (0x04), 
                    PSIT,   4, 
                            Offset (0x08), 
                    SYNC,   4, 
                            Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                            Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (PBUF, Buffer (0x14)
                        {
                            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x00, 0x00, 0x00, 0x00
                        })
                        CreateDWordField (PBUF, Zero, PIO0)
                        CreateDWordField (PBUF, 0x04, DMA0)
                        CreateDWordField (PBUF, 0x08, PIO1)
                        CreateDWordField (PBUF, 0x0C, DMA1)
                        CreateDWordField (PBUF, 0x10, FLAG)
                        Store (GETP (PRIT), PIO0)
                        Store (GDMA (And (SYNC, One), And (ICR3, One), 
                            And (ICR0, One), SDT0, And (ICR1, One)), DMA0)
                        If (LEqual (DMA0, Ones))
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
                            Store (Ones, PIO1)
                        }

                        Store (GDMA (And (SYNC, 0x02), And (ICR3, 0x02), 
                            And (ICR0, 0x02), SDT1, And (ICR1, 0x02)), DMA1)
                        If (LEqual (DMA1, Ones))
                        {
                            Store (PIO1, DMA1)
                        }

                        Store (GETF (And (SYNC, One), And (SYNC, 0x02), 
                            PRIT), FLAG)
                        If (And (LEqual (PIO0, Ones), LEqual (DMA0, Ones)))
                        {
                            Store (0x78, PIO0)
                            Store (0x14, DMA0)
                            Store (0x03, FLAG)
                        }

                        Return (PBUF)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        CreateDWordField (Arg0, Zero, PIO0)
                        CreateDWordField (Arg0, 0x04, DMA0)
                        CreateDWordField (Arg0, 0x08, PIO1)
                        CreateDWordField (Arg0, 0x0C, DMA1)
                        CreateDWordField (Arg0, 0x10, FLAG)
                        If (LEqual (SizeOf (Arg1), 0x0200))
                        {
                            And (PRIT, 0x40F0, PRIT)
                            And (SYNC, 0x02, SYNC)
                            Store (Zero, SDT0)
                            And (ICR0, 0x02, ICR0)
                            And (ICR1, 0x02, ICR1)
                            And (ICR3, 0x02, ICR3)
                            And (ICR5, 0x02, ICR5)
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
                            If (And (FLAG, One))
                            {
                                Or (SYNC, One, SYNC)
                                Store (SDMA (DMA0), SDT0)
                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, One, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, One, ICR0)
                                }

                                If (And (W930, 0x2000))
                                {
                                    Or (ICR1, One, ICR1)
                                }
                            }
                        }

                        If (LEqual (SizeOf (Arg2), 0x0200))
                        {
                            And (PRIT, 0x3F0F, PRIT)
                            Store (Zero, PSIT)
                            And (SYNC, One, SYNC)
                            Store (Zero, SDT1)
                            And (ICR0, One, ICR0)
                            And (ICR1, One, ICR1)
                            And (ICR3, One, ICR3)
                            And (ICR5, One, ICR5)
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
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB0, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                            })
                            CreateByteField (PIB0, One, PMD0)
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
                                Store (One, PMD0)
                            }

                            If (And (SYNC, One))
                            {
                                Store (Or (SDT0, 0x40), DMD0)
                                If (And (ICR1, One))
                                {
                                    If (And (ICR0, One))
                                    {
                                        Add (DMD0, 0x02, DMD0)
                                    }

                                    If (And (ICR3, One))
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
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB1, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                            })
                            CreateByteField (PIB1, One, PMD1)
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
                                Store (One, PMD1)
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
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x001F0002)
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
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
                    ICR5,   4, 
                            Offset (0x50), 
                    MAPV,   2, 
                            Offset (0x53), 
                    PCSR,   8
                }
            }

            Device (SBUS)
            {
                Name (_ADR, 0x001F0003)
                OperationRegion (SMBP, PCI_Config, 0x40, 0xC0)
                Field (SMBP, DWordAcc, NoLock, Preserve)
                {
                        ,   2, 
                    I2CE,   1
                }

                OperationRegion (SMBI, SystemIO, 0x5420, 0x10)
                Field (SMBI, ByteAcc, NoLock, Preserve)
                {
                    HSTS,   8, 
                            Offset (0x02), 
                    HCON,   8, 
                    HCOM,   8, 
                    TXSA,   8, 
                    DAT0,   8, 
                    DAT1,   8, 
                    HBDR,   8, 
                    PECR,   8, 
                    RXSA,   8, 
                    SDAT,   16
                }

                Method (SSXB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (Zero)
                    }

                    Store (Zero, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (SRXB, 1, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (Zero, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, One), TXSA)
                    Store (0x44, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (DAT0)
                    }

                    Return (0xFFFF)
                }

                Method (SWRB, 3, Serialized)
                {
                    If (STRT ())
                    {
                        Return (Zero)
                    }

                    Store (Zero, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (Arg2, DAT0)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (SRDB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (Zero, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, One), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (DAT0)
                    }

                    Return (0xFFFF)
                }

                Method (SBLW, 4, Serialized)
                {
                    If (STRT ())
                    {
                        Return (Zero)
                    }

                    Store (Arg3, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (SizeOf (Arg2), DAT0)
                    Store (Zero, Local1)
                    Store (DerefOf (Index (Arg2, Zero)), HBDR)
                    Store (0x54, HCON)
                    While (LGreater (SizeOf (Arg2), Local1))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (Zero)
                        }

                        Store (0x80, HSTS)
                        Increment (Local1)
                        If (LGreater (SizeOf (Arg2), Local1))
                        {
                            Store (DerefOf (Index (Arg2, Local1)), HBDR)
                        }
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (SBLR, 3, Serialized)
                {
                    Name (TBUF, Buffer (0x0100) {})
                    If (STRT ())
                    {
                        Return (Zero)
                    }

                    Store (Arg2, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, One), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x54, HCON)
                    Store (0x0FA0, Local0)
                    While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                    {
                        Decrement (Local0)
                        Stall (0x32)
                    }

                    If (LNot (Local0))
                    {
                        KILL ()
                        Return (Zero)
                    }

                    Store (DAT0, Index (TBUF, Zero))
                    Store (0x80, HSTS)
                    Store (One, Local1)
                    While (LLess (Local1, DerefOf (Index (TBUF, Zero))))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (Zero)
                        }

                        Store (HBDR, Index (TBUF, Local1))
                        Store (0x80, HSTS)
                        Increment (Local1)
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (TBUF)
                    }

                    Return (Zero)
                }

                Method (STRT, 0, Serialized)
                {
                    Store (0xC8, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x40))
                        {
                            Decrement (Local0)
                            Sleep (One)
                            If (LEqual (Local0, Zero))
                            {
                                Return (One)
                            }
                        }
                        Else
                        {
                            Store (Zero, Local0)
                        }
                    }

                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, One))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, Zero))
                            {
                                KILL ()
                            }
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Return (One)
                }

                Method (COMP, 0, Serialized)
                {
                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x02))
                        {
                            Return (One)
                        }
                        Else
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, Zero))
                            {
                                KILL ()
                            }
                        }
                    }

                    Return (Zero)
                }

                Method (KILL, 0, Serialized)
                {
                    Or (HCON, 0x02, HCON)
                    Or (HSTS, 0xFF, HSTS)
                }
            }

            Device (AZAL)
            {
                Name (_ADR, 0x001B0000)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }
        }
    }
}

