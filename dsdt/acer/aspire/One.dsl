/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080514
 *
 * Disassembly of DSDT.dat, Fri Jul 25 22:39:52 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00005D05 (23813)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0xD2
 *     OEM ID           "INTEL "
 *     OEM Table ID     "Napa    "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x01000013 (16777235)
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "INTEL ", "Napa    ", 0x00000001)
{
    OperationRegion (PORT, SystemIO, 0x80, One)
    Field (PORT, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
    }

    OperationRegion (GPIO, SystemIO, 0x0500, 0x39)
    Field (GPIO, ByteAcc, NoLock, Preserve)
    {
                Offset (0x2C), 
                Offset (0x2D), 
            ,   1, 
        INV9,   1, 
        INVA,   1, 
                Offset (0x38), 
            ,   1, 
            ,   1, 
        CPEN,   1
    }

    OperationRegion (PMBA, SystemIO, 0x0400, 0x80)
    Field (PMBA, ByteAcc, NoLock, Preserve)
    {
                Offset (0x28), 
            ,   2, 
        SPST,   1, 
                Offset (0x29), 
                Offset (0x2A), 
                Offset (0x2B), 
        GP2B,   8, 
                Offset (0x42), 
            ,   1, 
        GPEC,   1
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
        AZAD,   1, 
        A97D,   1, 
                Offset (0x341A), 
        RP1D,   1, 
        RP2D,   1, 
        RP3D,   1, 
        RP4D,   1
    }

    OperationRegion (MBOX, SystemMemory, 0x1F4BED90, 0x000000E8)
    Field (MBOX, AnyAcc, NoLock, Preserve)
    {
        PCI1,   8, 
        PCI2,   8, 
        PCI3,   8, 
        PCI4,   8, 
        PCI5,   8, 
        PCI6,   8, 
        PCI7,   8, 
        PCI8,   8, 
        NLCK,   8, 
        ZIPE,   8, 
        COMA,   8, 
        CAIO,   8, 
        CAIP,   8, 
        CAMD,   8, 
        CADA,   8, 
        COMB,   8, 
        CBIO,   8, 
        CBIP,   8, 
        CBMD,   8, 
        CBDA,   8, 
        COMC,   8, 
        CCIO,   8, 
        CCIP,   8, 
        CCMD,   8, 
        CCDA,   8, 
        COMD,   8, 
        CDIO,   8, 
        CDIP,   8, 
        CDMD,   8, 
        CDDA,   8, 
        LPT1,   8, 
        L1IO,   8, 
        L1IP,   8, 
        L1MD,   8, 
        L1DA,   8, 
        LPT2,   8, 
        L2IO,   8, 
        L2IP,   8, 
        L2MD,   8, 
        L2DA,   8, 
        LPT3,   8, 
        L3IO,   8, 
        L3IP,   8, 
        L3MD,   8, 
        L3DA,   8, 
        FDDC,   8, 
        FDWP,   8, 
        HGMP,   8, 
        LGMP,   8, 
        MIDI,   8, 
        AZLA,   8, 
        AUDO,   8, 
        MODM,   8, 
        IDEC,   8, 
        PACT,   8, 
        SCFG,   8, 
        AIBT,   8, 
        AMOD,   8, 
        P0HP,   8, 
        P2HP,   8, 
        P0IL,   8, 
        P2IL,   8, 
        IDLY,   8, 
        PMTP,   8, 
        PMIO,   8, 
        PMBM,   8, 
        PMTM,   8, 
        PSTP,   8, 
        PSIO,   8, 
        PSBM,   8, 
        PSTM,   8, 
        SMTP,   8, 
        SMIO,   8, 
        SMBM,   8, 
        SMTM,   8, 
        SSTP,   8, 
        SSIO,   8, 
        SSBM,   8, 
        SSTM,   8, 
        IDE0,   8, 
        IDE1,   8, 
        IDE2,   8, 
        IDE3,   8, 
        IDE4,   8, 
        IDE5,   8, 
        IDE6,   8, 
        IDE7,   8, 
        PEGS,   8, 
        D2F1,   8, 
        IGMT,   8, 
        DTSZ,   8, 
        HIUB,   8, 
        LUBS,   8, 
        EDCG,   8, 
        SDFY,   8, 
        SDTC,   8, 
        SDRP,   8, 
        SDCL,   8, 
        SDRC,   8, 
        SDRE,   8, 
        FC2L,   8, 
        FC3L,   8, 
        FCS4,   8, 
        APIM,   8, 
        HPTS,   8, 
        HPTA,   8, 
        EMAS,   8, 
        MASF,   8, 
        ASFB,   8, 
        MBTX,   8, 
        XPRO,   8, 
        IDER,   8, 
        SOLE,   8, 
        EYLS,   8, 
        EYLH,   8, 
        TPMD,   8, 
        TPMO,   8, 
        TPMC,   8, 
        TPMM,   8, 
        TPCC,   8, 
        TPLC,   8, 
        TPLR,   32, 
        ISTC,   8, 
        TRML,   8, 
        TRON,   8, 
        NXMD,   8, 
        PCRR,   8, 
        C4EN,   8, 
        C43D,   8, 
        EMTT,   8, 
        PROH,   8, 
        DFSB,   8, 
        TUBM,   8, 
        TSTE,   8, 
        DAS3,   8, 
        WKPM,   8, 
        WKMD,   8, 
        WKS5,   8, 
        HOUR,   8, 
        MINS,   8, 
        SECS,   8, 
        DOFM,   8, 
        QKS4,   8, 
        POPU,   8, 
        POPD,   8, 
        NXFE,   8, 
        VTST,   8, 
        VTFE,   8, 
        S5FG,   8, 
        CSTS,   8, 
        ENCS,   8, 
        DEC4,   8, 
        HC4E,   8, 
        ENC6,   8, 
        CSTR,   8, 
        CMPE,   8, 
        DTSE,   8, 
        DTSC,   8, 
        QBOT,   8, 
        QEBT,   8, 
        PBOT,   8, 
        OSYS,   16, 
        PSW0,   8, 
        PSW1,   8, 
        D2DF,   8, 
        F12F,   8
    }

    OperationRegion (CMS1, SystemIO, 0x72, 0x02)
    Field (CMS1, ByteAcc, NoLock, Preserve)
    {
        CMSI,   8, 
        CMSD,   8
    }

    Method (CMSW, 2, NotSerialized)
    {
        Store (Arg0, CMSI)
        Store (Arg1, CMSD)
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
                Offset (0x02), 
                Offset (0x04), 
                Offset (0x06), 
                Offset (0x08), 
        TRP0,   8, 
                Offset (0x0A), 
                Offset (0x0B), 
                Offset (0x0C), 
                Offset (0x0D), 
                Offset (0x0E), 
                Offset (0x0F), 
                Offset (0x10)
    }

    OperationRegion (IO_D, SystemIO, 0x0810, 0x08)
    Field (IO_D, ByteAcc, NoLock, Preserve)
    {
        TRPD,   8
    }

    OperationRegion (NVST, SystemMemory, 0x1F4BEE78, 0x00000056)
    Field (NVST, AnyAcc, Lock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        BRTL,   8, 
        TLST,   8, 
        IGDS,   8, 
        LCDA,   16, 
        CSTE,   16, 
        NSTE,   16, 
        CADL,   16, 
        PADL,   16, 
        LIDS,   8, 
        PWRS,   8, 
        BVAL,   32, 
        CMPF,   8, 
        CSTF,   8, 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        DTS1,   8, 
        DTS2,   8, 
        DTSF,   8, 
        PPMF,   32, 
        DI00,   320
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x01, 0x00000410, 0x06) {}
        Processor (CPU1, 0x02, 0x00000410, 0x06) {}
    }

    Method (IHWM, 2, NotSerialized)
    {
        Store (Arg0, PRM0)
        Store (Arg1, DI00)
        Store (0xD1, APMC)
        Store (DI00, Local0)
        Return (Local0)
    }

    OperationRegion (GSMI, SystemIO, 0xB2, 0x02)
    Field (GSMI, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    Name (ECON, Zero)
    Name (CTYP, Zero)
    Name (DSEN, One)
    Name (PSTA, Zero)
    Method (_PTS, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x03))
        {
            Store (0x53, P80H)
        }

        If (LEqual (Arg0, 0x04))
        {
            If (ECON)
            {
                Store (One, \_SB.PCI0.LPC.EC0.FLS4)
            }

            Store (0x54, P80H)
        }

        Return (Zero)
    }

    Method (_WAK, 1, NotSerialized)
    {
        If (ECON)
        {
            \_SB.BAT1.UBIF ()
            Notify (\_SB.BAT1, 0x80)
            Notify (\_SB.BAT1, 0x81)
        }

        If (LEqual (Arg0, 0x03))
        {
            Notify (\_SB.PCI0.EXP1, Zero)
            Notify (\_SB.PCI0.EXP4, Zero)
            Store (0xE3, P80H)
        }

        If (LEqual (Arg0, 0x04))
        {
            Notify (\_SB.PCI0.EXP1, Zero)
            Notify (\_SB.PCI0.EXP4, Zero)
            Store (0xE4, P80H)
        }

        Return (Zero)
    }

    Name (_S0, Package (0x04)
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (LEqual (DAS3, One))
    {
        Name (_S3, Package (0x04)
        {
            0x05, 
            0x05, 
            Zero, 
            Zero
        })
    }

    Name (_S4, Package (0x04)
    {
        0x06, 
        0x06, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)
    {
        0x07, 
        0x07, 
        Zero, 
        Zero
    })
    Scope (_GPE)
    {
        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC1, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC2, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.AZAL, 0x02)
            Notify (\_SB.PCI0.MODM, 0x02)
        }

        Method (_L09, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.EXP1, 0x02)
            Notify (\_SB.PCI0.EXP2, 0x02)
            Notify (\_SB.PCI0.EXP3, 0x02)
            Notify (\_SB.PCI0.EXP4, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P32, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC3, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.ECHI, 0x02)
        }

        Method (_L0E, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC4, 0x02)
        }

        Method (_L19, 0, NotSerialized)
        {
            Sleep (0x64)
            If (\_SB.PCI0.EXP4.PDC4)
            {
                Store (One, \_SB.PCI0.EXP4.PDC4)
                Store (One, \_SB.PCI0.EXP4.HPCS)
                If (\_SB.PCI0.EXP4.PDS4)
                {
                    Store (Zero, INV9)
                    Store (0x94, APMD)
                    Store (0xB2, APMC)
                    Sleep (0x64)
                }
                Else
                {
                    Store (One, INV9)
                    Sleep (0x64)
                }

                Notify (\_SB.PCI0.EXP4, Zero)
            }
        }

        Method (_L1A, 0, NotSerialized)
        {
            Sleep (0x64)
            If (\_SB.PCI0.EXP1.PDC1)
            {
                Store (One, \_SB.PCI0.EXP1.PDC1)
                Store (One, \_SB.PCI0.EXP1.HPCS)
                If (\_SB.PCI0.EXP1.PDS1)
                {
                    Store (Zero, INVA)
                    Store (0x91, APMD)
                    Store (0xB2, APMC)
                    Sleep (0x64)
                }
                Else
                {
                    Store (One, INVA)
                    Sleep (0x64)
                }

                Notify (\_SB.PCI0.EXP1, Zero)
            }
        }
    }

    Name (GPIC, Zero)
    Method (_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Method (_INI, 0, NotSerialized)
    {
        Store (0x12, P80H)
        If (CondRefOf (_OSI, Local0))
        {
            If (_OSI ("Linux"))
            {
                Store (0x03E8, OSYS)
                Store (0x0A, \_SB.PCI0.LPC.S4TM)
                Store (0x43, \_SB.PCI0.EXP2.PXS2.LSMP)
                Store (One, \_SB.PCI0.EXP2.LL0S)
                Store (One, \_SB.PCI0.EXP2.LLL1)
            }
            Else
            {
                If (_OSI ("Windows 2006"))
                {
                    Store (0x07D6, OSYS)
                    Store (0x06, \_SB.PCI0.LPC.S4TM)
                    Store (Zero, \_SB.PCI0.EXP2.PXS2.LSMP)
                    Store (Zero, \_SB.PCI0.EXP2.LL0S)
                    Store (Zero, \_SB.PCI0.EXP2.LLL1)
                }
                Else
                {
                    Store (0x0A, \_SB.PCI0.LPC.S4TM)
                    Store (0x43, \_SB.PCI0.EXP2.PXS2.LSMP)
                    Store (One, \_SB.PCI0.EXP2.LL0S)
                    Store (One, \_SB.PCI0.EXP2.LLL1)
                    Store (0x07D1, OSYS)
                }
            }
        }
        Else
        {
            Store (0x0A, \_SB.PCI0.LPC.S4TM)
            Store (0x43, \_SB.PCI0.EXP2.PXS2.LSMP)
            Store (One, \_SB.PCI0.EXP2.LL0S)
            Store (One, \_SB.PCI0.EXP2.LLL1)
            Store (0x07D0, OSYS)
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

    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (ECON)
                {
                    If (LEqual (^^PCI0.LPC.EC0.LID2, Zero))
                    {
                        Return (One)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
                Else
                {
                    Return (One)
                }
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (BAT1)
        {
            Name (CBTI, Zero)
            Name (PBTI, Zero)
            Name (BTIN, Zero)
            Name (BTCH, Zero)
            Name (BIFI, Zero)
            Name (SEL0, Zero)
            Name (BCRI, Zero)
            Name (PBIF, Package (0x0D)
            {
                One, 
                0x1130, 
                0x1130, 
                One, 
                0x2B5C, 
                0x012C, 
                0x84, 
                0x20, 
                0x20, 
                "BAT1      ", 
                "11        ", 
                "11        ", 
                "11        "
            })
            Name (PBST, Package (0x04)
            {
                Zero, 
                Ones, 
                Ones, 
                0x2710
            })
            Name (ERRC, Zero)
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, Zero)
            Method (_STA, 0, NotSerialized)
            {
                Store (0x11, P80H)
                If (BTIN)
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
                Store (0x12, P80H)
                If (LEqual (BIFI, Zero))
                {
                    UBIF ()
                    Store (One, BIFI)
                }

                Return (PBIF)
            }

            Name (LFCC, 0x1130)
            Method (UBIF, 0, NotSerialized)
            {
                If (ECON)
                {
                    Store (0x13, P80H)
                    Store (^^PCI0.LPC.EC0.BTDC, Local0)
                    Store (^^PCI0.LPC.EC0.LFC2, Local1)
                    Store (^^PCI0.LPC.EC0.BTDV, Local2)
                    Store (^^PCI0.LPC.EC0.BTMD, Local3)
                    Store (^^PCI0.LPC.EC0.BTMN, Local4)
                    Store (^^PCI0.LPC.EC0.BTSN, Local5)
                    Store (^^PCI0.LPC.EC0.LION, Local6)
                    Store (Local0, Index (PBIF, One))
                    Store (Local1, Index (PBIF, 0x02))
                    Store (Local2, Index (PBIF, 0x04))
                    Store (Local1, LFCC)
                    Multiply (Local1, 0x04, Local7)
                    Divide (Local7, 0x64, , Local7)
                    Store (Local7, Index (PBIF, 0x06))
                    If (Local6)
                    {
                        Store ("NiMH", Index (PBIF, 0x0B))
                    }
                    Else
                    {
                        Store ("LION", Index (PBIF, 0x0B))
                    }

                    And (Local3, 0x0F, Local3)
                    If (LEqual (Local3, One))
                    {
                        Store ("UM08A31", Index (PBIF, 0x09))
                    }
                    Else
                    {
                        If (LEqual (Local3, 0x02))
                        {
                            Store ("UM08A32", Index (PBIF, 0x09))
                        }
                        Else
                        {
                            If (LEqual (Local3, 0x03))
                            {
                                Store ("UM08A51", Index (PBIF, 0x09))
                            }
                            Else
                            {
                                If (LEqual (Local3, 0x04))
                                {
                                    Store ("UM08A52", Index (PBIF, 0x09))
                                }
                                Else
                                {
                                    If (LEqual (Local3, 0x05))
                                    {
                                        Store ("UM08A71", Index (PBIF, 0x09))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local3, 0x06))
                                        {
                                            Store ("UM08A72", Index (PBIF, 0x09))
                                        }
                                        Else
                                        {
                                            If (LEqual (Local3, 0x07))
                                            {
                                                Store ("UM08A73", Index (PBIF, 0x09))
                                            }
                                            Else
                                            {
                                                If (LEqual (Local3, 0x08))
                                                {
                                                    Store ("UM08A74", Index (PBIF, 0x09))
                                                }
                                                Else
                                                {
                                                    If (LEqual (Local3, 0x09))
                                                    {
                                                        Store ("UM08B51", Index (PBIF, 0x09))
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (Local3, 0x0A))
                                                        {
                                                            Store ("UM08B71", Index (PBIF, 0x09))
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (Local3, 0x0B))
                                                            {
                                                                Store ("UM08B72", Index (PBIF, 0x09))
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (Local3, 0x0C))
                                                                {
                                                                    Store ("UM08B73", Index (PBIF, 0x09))
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (Local3, 0x0D))
                                                                    {
                                                                        Store ("UM08B74", Index (PBIF, 0x09))
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (Local3, 0x0E))
                                                                        {
                                                                            Store ("UM08AC1", Index (PBIF, 0x09))
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

                    If (LEqual (Local4, 0x03))
                    {
                        Store ("SANYO", Index (PBIF, 0x0C))
                    }
                    Else
                    {
                        If (LEqual (Local4, 0x04))
                        {
                            Store ("SONY", Index (PBIF, 0x0C))
                        }
                        Else
                        {
                            If (LEqual (Local4, 0x05))
                            {
                                Store ("PANASONIC", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local4, 0x07))
                                {
                                    Store ("SIMPLO", Index (PBIF, 0x0C))
                                }
                                Else
                                {
                                    If (LEqual (Local4, 0x08))
                                    {
                                        Store ("MOTOROLA", Index (PBIF, 0x0C))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local4, 0x09))
                                        {
                                            Store ("Celxpert", Index (PBIF, 0x0C))
                                        }
                                        Else
                                        {
                                            Store ("UNKNOWN", Index (PBIF, 0x0C))
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Store (ITOS (Local5), Index (PBIF, 0x0A))
                }
            }

            Name (RCAP, Zero)
            Method (_BST, 0, NotSerialized)
            {
                Store (0x14, P80H)
                If (LEqual (BTIN, Zero))
                {
                    Store (Zero, Index (PBST, Zero))
                    Store (Ones, Index (PBST, One))
                    Store (Ones, Index (PBST, 0x02))
                    Store (Ones, Index (PBST, 0x03))
                    Return (PBST)
                }

                If (ECON)
                {
                    Store (^^PCI0.LPC.EC0.MBTC, Local0)
                    Store (^^PCI0.LPC.EC0.MBRM, Local1)
                    Store (^^PCI0.LPC.EC0.MBVG, Local2)
                    Store (^^PCI0.LPC.EC0.MCUR, Local3)
                    Store (^^PCI0.LPC.EC0.BTST, Local4)
                    Store (^^PCI0.LPC.EC0.MBTF, Local5)
                    Store (^^PCI0.LPC.EC0.ACDF, Local6)
                    If (Local6)
                    {
                        If (LEqual (Local5, One))
                        {
                            Store (Zero, Local7)
                            Store (LFCC, Local1)
                        }
                        Else
                        {
                            If (LEqual (Local0, One))
                            {
                                Store (0x02, Local7)
                            }
                            Else
                            {
                                Store (Zero, Local7)
                            }
                        }
                    }
                    Else
                    {
                        If (LAnd (Local4, One))
                        {
                            Store (One, Local7)
                        }
                        Else
                        {
                            Store (Zero, Local7)
                        }
                    }

                    And (Local4, 0x04, Local4)
                    If (LEqual (Local4, 0x04))
                    {
                        Or (Local7, Local4, Local7)
                    }

                    Store (Local7, Index (PBST, Zero))
                    If (LNot (And (Local1, 0x8000)))
                    {
                        Store (Local1, Index (PBST, 0x02))
                    }

                    If (LNot (And (Local2, 0x8000)))
                    {
                        Store (Local2, Index (PBST, 0x03))
                    }

                    If (LAnd (Local3, 0x8000))
                    {
                        If (LNotEqual (Local3, 0xFFFF))
                        {
                            Not (Local3, Local3)
                            Increment (Local3)
                            And (Local3, 0xFFFF, Local3)
                        }
                    }

                    Store (Local3, Index (PBST, One))
                }

                Return (PBST)
            }

            Method (ITOS, 1, NotSerialized)
            {
                Store ("", Local0)
                Store (0x04, Local1)
                While (Local1)
                {
                    Decrement (Local1)
                    And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
                    Store (DerefOf (Index (CHAR, Local4)), Local2)
                    Concatenate (Local0, Local2, Local5)
                    Store (Local5, Local0)
                }

                Return (Local0)
            }

            Name (CHAR, Package (0x10)
            {
                "0", 
                "1", 
                "2", 
                "3", 
                "4", 
                "5", 
                "6", 
                "7", 
                "8", 
                "9", 
                "A", 
                "B", 
                "C", 
                "D", 
                "E", 
                "F"
            })
            Method (BATS, 0, NotSerialized)
            {
                If (ECON)
                {
                    Store (0x15, P80H)
                    Store (^^PCI0.LPC.EC0.MBTS, Local0)
                    If (LEqual (Local0, One))
                    {
                        If (LEqual (BTIN, Zero))
                        {
                            Store (One, BTCH)
                            Store (Zero, BIFI)
                        }

                        Store (One, BTIN)
                    }
                    Else
                    {
                        If (LEqual (BTIN, One))
                        {
                            Store (One, BTCH)
                            Store (Zero, BIFI)
                        }

                        Store (Zero, BTIN)
                    }
                }
            }
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Name (ACST, Zero)
            Method (_PSR, 0, NotSerialized)
            {
                If (ECON)
                {
                    Store (0x16, P80H)
                    Store (^^PCI0.LPC.EC0.ACDF, ACST)
                }
                Else
                {
                    Store (One, ACST)
                }

                If (ACST)
                {
                    Store (One, Local0)
                    Store (Zero, ^^BAT1.BCRI)
                }
                Else
                {
                    Store (Zero, Local0)
                }

                Return (Local0)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, 0x030AD041)
            Name (_ADR, Zero)
            Method (_INI, 0, NotSerialized)
            {
                Store (0x12, P80H)
                If (CondRefOf (_OSI, Local0))
                {
                    If (_OSI ("Linux"))
                    {
                        Store (0x03E8, OSYS)
                        Store (0x0A, ^LPC.S4TM)
                        Store (0x43, ^EXP2.PXS2.LSMP)
                        Store (One, ^EXP2.LL0S)
                        Store (One, ^EXP2.LLL1)
                    }
                    Else
                    {
                        If (_OSI ("Windows 2006"))
                        {
                            Store (0x07D6, OSYS)
                            Store (0x06, ^LPC.S4TM)
                            Store (Zero, ^EXP2.PXS2.LSMP)
                            Store (Zero, ^EXP2.LL0S)
                            Store (Zero, ^EXP2.LLL1)
                        }
                        Else
                        {
                            Store (0x0A, ^LPC.S4TM)
                            Store (0x43, ^EXP2.PXS2.LSMP)
                            Store (One, ^EXP2.LL0S)
                            Store (One, ^EXP2.LLL1)
                            Store (0x07D1, OSYS)
                        }
                    }
                }
                Else
                {
                    Store (0x0A, ^LPC.S4TM)
                    Store (0x43, ^EXP2.PXS2.LSMP)
                    Store (One, ^EXP2.LL0S)
                    Store (One, ^EXP2.LLL1)
                    Store (0x07D0, OSYS)
                }
            }

            Method (_OSC, 4, NotSerialized)
            {
                Store (Arg2, Local0)
                Multiply (Local0, 0x04, Local1)
                Name (BUF1, Buffer (Local1) {})
                Store (Arg3, BUF1)
                Store (Zero, Local1)
                Store (Zero, Local2)
                While (Local0)
                {
                    Multiply (Local1, 0x04, Local2)
                    CreateDWordField (BUF1, Local2, CAPB)
                    If (Arg1)
                    {
                        If (LEqual (Local1, Zero))
                        {
                            And (CAPB, 0xFFFFFFFC, CAPB)
                        }
                    }
                    Else
                    {
                    }

                    Increment (Local1)
                    Decrement (Local0)
                }

                Return (BUF1)
            }

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
                If (LEqual (GPIC, Zero))
                {
                    Return (Package (0x0F)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            Zero, 
                            ^LPC.LNKG, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            One, 
                            ^LPC.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            One, 
                            ^LPC.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            One, 
                            ^LPC.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            One, 
                            ^LPC.LNKB, 
                            Zero
                        }
                    })
                }
                Else
                {
                    Return (Package (0x0F)
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
                            0x001BFFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            One, 
                            Zero, 
                            0x11
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
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            One, 
                            Zero, 
                            0x11
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
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            One, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            One, 
                            Zero, 
                            0x11
                        }
                    })
                }
            }

            Device (P32)
            {
                Name (_ADR, 0x001E0000)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (Package (0x02)
                        {
                            0x0B, 
                            0x04
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            0x0B, 
                            Zero
                        })
                    }
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x09)
                        {
                            Package (0x04)
                            {
                                0x0002FFFF, 
                                Zero, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                One, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x02, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x03, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                Zero, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                One, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x02, 
                                ^^LPC.LNKF, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x03, 
                                ^^LPC.LNKG, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0008FFFF, 
                                Zero, 
                                ^^LPC.LNKE, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x09)
                        {
                            Package (0x04)
                            {
                                0x0002FFFF, 
                                Zero, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                One, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x02, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x03, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                Zero, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                One, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x02, 
                                Zero, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x03, 
                                Zero, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0008FFFF, 
                                Zero, 
                                Zero, 
                                0x14
                            }
                        })
                    }
                }
            }

            Device (LPC)
            {
                Name (_ADR, 0x001F0000)
                OperationRegion (PRR0, PCI_Config, 0x60, 0x04)
                Field (PRR0, AnyAcc, NoLock, Preserve)
                {
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8
                }

                OperationRegion (PRR1, PCI_Config, 0x68, 0x04)
                Field (PRR1, AnyAcc, NoLock, Preserve)
                {
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                OperationRegion (PRR2, PCI_Config, 0x80, 0x02)
                Field (PRR2, AnyAcc, NoLock, Preserve)
                {
                    IODL,   8, 
                    IODH,   8
                }

                OperationRegion (BRKE, PCI_Config, 0xAA, 0x02)
                Field (BRKE, AnyAcc, NoLock, Preserve)
                {
                    S4TM,   8, 
                    PCEE,   8
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, One)
                    Method (_STA, 0, NotSerialized)
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

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRA, 0x80, PIRA)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRA, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRA, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRA)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_STA, 0, NotSerialized)
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

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRB, 0x80, PIRB)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRB, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRB, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRB)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_STA, 0, NotSerialized)
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

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRC, 0x80, PIRC)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRC, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRC, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRC)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_STA, 0, NotSerialized)
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

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRD, 0x80, PIRD)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRD, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRD, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRD)
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_STA, 0, NotSerialized)
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

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRE, 0x80, PIRE)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRE, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRE, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRE)
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_STA, 0, NotSerialized)
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

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRF, 0x80, PIRF)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRF, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRF, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRF)
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_STA, 0, NotSerialized)
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

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRG, 0x80, PIRG)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRG, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRG, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRG)
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_STA, 0, NotSerialized)
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

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRH, 0x80, PIRH)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRH, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRH, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRH)
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
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0200,             // Range Minimum
                            0x0200,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x164E,             // Range Minimum
                            0x164E,             // Range Maximum
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
                            0x0600,             // Range Minimum
                            0x0600,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0610,             // Range Minimum
                            0x0610,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xE0000000,         // Address Base
                            0x10000000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED1C000,         // Address Base
                            0x00004000,         // Address Length
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
                            0xFEC00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFEE00000,         // Address Base
                            0x00001000,         // Address Length
                            )
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
                        If (LEqual (HPTS, One))
                        {
                            Return (BUF0)
                        }
                        Else
                        {
                            Return (BUF1)
                        }
                    }
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
                            _Y0E)
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSYS, 0x07D1))
                        {
                            If (LEqual (HPTS, One))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Else
                        {
                            If (HPTS)
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        If (LEqual (HPTS, One))
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPC.HPET._Y0E._BAS, HPT0)
                            If (LEqual (HPTA, One))
                            {
                                Store (0xFED01000, HPT0)
                            }

                            If (LEqual (HPTA, 0x02))
                            {
                                Store (0xFED02000, HPT0)
                            }

                            If (LEqual (HPTA, 0x03))
                            {
                                Store (0xFED03000, HPT0)
                            }
                        }

                        Return (BUF0)
                    }
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

                Device (FPU)
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
                        If (HPTS)
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF800000,         // Address Base
                            0x00800000,         // Address Length
                            )
                    })
                }

                Device (KBC)
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
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (MOUE)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
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
                    Name (_GPE, 0x17)
                    Name (SEL0, 0xF0)
                    Name (BFLG, Zero)
                    Method (_REG, 2, NotSerialized)
                    {
                        Store (0x17, P80H)
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Local0)
                            If (Local0)
                            {
                                Store (One, ECON)
                            }
                            Else
                            {
                                Store (Zero, ECON)
                            }
                        }

                        If (ECON)
                        {
                            Store (0x18, P80H)
                            Store (0x03, RG59)
                            Store (One, CPLE)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
                    Field (ERAM, ByteAcc, NoLock, Preserve)
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
                        BATD,   16, 
                        ACDF,   1, 
                                Offset (0x41), 
                            ,   5, 
                        FLS4,   1, 
                                Offset (0x42), 
                                Offset (0x4C), 
                        ARCD,   1, 
                            ,   3, 
                        DOCK,   1, 
                        LANC,   1, 
                        LID2,   1, 
                        CRTS,   1, 
                                Offset (0x51), 
                        BLVL,   8, 
                                Offset (0x53), 
                        DOFF,   8, 
                                Offset (0x58), 
                        CTMP,   8, 
                        RG59,   8, 
                                Offset (0x60), 
                        WLAN,   1, 
                        BLTH,   1, 
                        CPLE,   1, 
                            ,   3, 
                        WLST,   1, 
                        BLTS,   1, 
                            ,   2, 
                        ST3G,   1, 
                        MNST,   1, 
                            ,   1, 
                        ED3G,   1, 
                            ,   3, 
                                Offset (0x63), 
                        TJ85,   1, 
                            ,   6, 
                        VGAF,   1, 
                                Offset (0x70), 
                        BTMD,   8, 
                        MBTS,   1, 
                        MBTF,   1, 
                        BATF,   1, 
                            ,   3, 
                        MBDX,   1, 
                        MBAD,   1, 
                        MBTC,   1, 
                            ,   2, 
                        LION,   1, 
                                Offset (0x77), 
                        BA1C,   8, 
                        MCYC,   16, 
                        MTMP,   16, 
                        MDAT,   16, 
                        MCUR,   16, 
                        MBRM,   16, 
                        MBVG,   16, 
                        MRTF,   16, 
                        MMER,   8, 
                        BA2C,   8, 
                        LFC2,   16, 
                        BTSN,   16, 
                        BTDC,   16, 
                        BTDV,   16, 
                        BTMN,   8, 
                                Offset (0x93), 
                        BTST,   8, 
                                Offset (0x9D), 
                        OSTP,   1, 
                                Offset (0xA0), 
                        ABMD,   8, 
                        ABTS,   1, 
                        ABFC,   1, 
                            ,   4, 
                        ABDX,   1, 
                        ABAD,   1, 
                        ABCG,   1, 
                            ,   2, 
                        ABTP,   1, 
                                Offset (0xA8), 
                        ACYC,   16, 
                        ATMP,   16, 
                        ADAT,   16, 
                        ABCR,   16, 
                        ABRM,   16, 
                        ABVG,   16, 
                        ARTF,   16, 
                        AMER,   8, 
                                Offset (0xB8), 
                        AFCC,   16, 
                        ABSN,   16, 
                        ABDC,   16, 
                        ABDV,   16, 
                        ABMN,   8, 
                                Offset (0xD0), 
                        EBPL,   1, 
                                Offset (0xD1), 
                        PWRE,   1, 
                                Offset (0xD2), 
                            ,   6, 
                        VAUX,   1, 
                                Offset (0xD6), 
                        DBPL,   8, 
                                Offset (0xE0), 
                        DESP,   8, 
                        DTS3,   8, 
                        DE0L,   8, 
                        DE0H,   8, 
                        DE1L,   8, 
                        DE1H,   8, 
                        DE2L,   8, 
                        DE2H,   8, 
                        DE3L,   8, 
                        DE3H,   8, 
                        DE4L,   8, 
                        DE4H,   8
                    }

                    Method (APOL, 1, NotSerialized)
                    {
                        Store (0x19, P80H)
                        Store (Arg0, DBPL)
                        Store (One, EBPL)
                    }

                    Method (CPOL, 1, NotSerialized)
                    {
                        Store (0x1A, P80H)
                        If (LEqual (PSTA, Zero))
                        {
                            If (LNotEqual (ECON, Zero))
                            {
                                APOL (Arg0)
                                Store (One, PSTA)
                            }
                        }
                    }

                    Method (_Q20, 0, NotSerialized)
                    {
                        Store (0x20, P80H)
                        If (ECON)
                        {
                            If (And (SMST, 0x40))
                            {
                                Store (SMAA, Local0)
                                If (LEqual (Local0, 0x14))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (PWRE, Local1)
                                    If (Local1)
                                    {
                                        Store (Zero, PWRE)
                                        Store (0x12, BFLG)
                                        CPOL (One)
                                    }
                                }

                                If (LEqual (Local0, 0x16))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (0x04, ^^^^BAT1.BCRI)
                                    Notify (BAT1, 0x80)
                                }
                                Else
                                {
                                    Store (Zero, ^^^^BAT1.BCRI)
                                }
                            }
                        }
                    }

                    Method (_Q09, 0, NotSerialized)
                    {
                        Store (0x09, P80H)
                        If (ECON)
                        {
                            Store (0x1B, P80H)
                            Store (Zero, PSTA)
                            ^^^^BAT1.BATS ()
                            Notify (ACAD, 0x80)
                            Sleep (0x01F4)
                            Notify (BAT1, 0x80)
                            If (^^^^BAT1.BTCH)
                            {
                                Store (0x1C, P80H)
                                ^^^^BAT1.UBIF ()
                                Notify (BAT1, 0x81)
                                Store (Zero, ^^^^BAT1.BTCH)
                            }
                        }
                    }

                    Method (_Q9B, 0, NotSerialized)
                    {
                        Store (0x9B, P80H)
                        Sleep (0x32)
                        Notify (LID0, 0x80)
                    }
                }
            }

            Device (UHC1)
            {
                Name (_ADR, 0x001D0000)
                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
            }

            Device (UHC2)
            {
                Name (_ADR, 0x001D0001)
                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
            }

            Device (UHC3)
            {
                Name (_ADR, 0x001D0002)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
            }

            Device (UHC4)
            {
                Name (_ADR, 0x001D0003)
                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
            }

            Device (ECHI)
            {
                Name (_ADR, 0x001D0007)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, URES)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (0x03, URES)
                    }
                }
            }

            Device (EXP1)
            {
                Name (_ADR, 0x001C0000)
                OperationRegion (P1CS, PCI_Config, 0x40, 0x0100)
                Field (P1CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                        ,   4, 
                    LKD1,   1, 
                            Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                            Offset (0x20), 
                    RID1,   16, 
                    PSP1,   1, 
                    PPP1,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKD, 
                                Zero
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
                }

                Device (J380)
                {
                    Name (_ADR, Zero)
                    OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
                    Field (PCFG, ByteAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                                Offset (0x2C), 
                        SSID,   32, 
                                Offset (0xAC), 
                        D3EF,   8, 
                                Offset (0xB2), 
                        LAT0,   8, 
                                Offset (0xCF), 
                        ATRB,   8, 
                                Offset (0xD3), 
                        PMC0,   8
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }

                Device (J382)
                {
                    Name (_ADR, 0x02)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }

                Device (J383)
                {
                    Name (_ADR, 0x03)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }

                Device (J384)
                {
                    Name (_ADR, 0x04)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }
            }

            Device (EXP2)
            {
                Name (_ADR, 0x001C0001)
                OperationRegion (P2CS, PCI_Config, 0x40, 0x0100)
                Field (P2CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                    LL0S,   1, 
                    LLL1,   1, 
                        ,   2, 
                    LKD2,   1, 
                            Offset (0x1A), 
                    ABP2,   1, 
                        ,   2, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                            Offset (0x20), 
                    RID2,   16, 
                    PSP2,   1, 
                    PPP2,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS2)
                {
                    Name (_ADR, Zero)
                    OperationRegion (P2CS, PCI_Config, 0x80, 0x0100)
                    Field (P2CS, AnyAcc, NoLock, Preserve)
                    {
                        LSMP,   8
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (Zero)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKA, 
                                Zero
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
                }
            }

            Device (EXP3)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (P3CS, PCI_Config, 0x40, 0x0100)
                Field (P3CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                        ,   4, 
                    LKD3,   1, 
                            Offset (0x1A), 
                    ABP3,   1, 
                        ,   2, 
                    PDC3,   1, 
                        ,   2, 
                    PDS3,   1, 
                            Offset (0x20), 
                    RID3,   16, 
                    PSP3,   1, 
                    PPP3,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS3)
                {
                    Name (_ADR, Zero)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (Zero)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKB, 
                                Zero
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
                }
            }

            Device (EXP4)
            {
                Name (_ADR, 0x001C0003)
                OperationRegion (P4CS, PCI_Config, 0x40, 0x0100)
                Field (P4CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                        ,   4, 
                    LKD4,   1, 
                            Offset (0x1A), 
                    ABP4,   1, 
                        ,   2, 
                    PDC4,   1, 
                        ,   2, 
                    PDS4,   1, 
                            Offset (0x20), 
                    RID4,   16, 
                    PSP4,   1, 
                    PPP4,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKC, 
                                Zero
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
                }

                Device (J380)
                {
                    Name (_ADR, Zero)
                    OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
                    Field (PCFG, ByteAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                                Offset (0x2C), 
                        SSID,   32, 
                                Offset (0xAC), 
                        D3EF,   8, 
                                Offset (0xB2), 
                        LAT0,   8, 
                                Offset (0xCF), 
                        ATRB,   8, 
                                Offset (0xD3), 
                        PMC0,   8
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }

                Device (J382)
                {
                    Name (_ADR, 0x02)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }

                Device (J383)
                {
                    Name (_ADR, 0x03)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }

                Device (J384)
                {
                    Name (_ADR, 0x04)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }
            }

            Device (AZAL)
            {
                Name (_ADR, 0x001B0000)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKMD, One))
                    {
                        Return (Package (0x02)
                        {
                            0x05, 
                            0x04
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            0x05, 
                            Zero
                        })
                    }
                }
            }

            Device (AUDO)
            {
                Name (_ADR, 0x001E0002)
            }

            Device (MODM)
            {
                Name (_ADR, 0x001E0003)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKMD, One))
                    {
                        Return (Package (0x02)
                        {
                            0x05, 
                            0x04
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            0x05, 
                            Zero
                        })
                    }
                }
            }

            Device (OVGA)
            {
                Name (_ADR, 0x00020000)
                OperationRegion (VNVS, SystemMemory, 0x1F477010, 0x00010004)
                Field (VNVS, AnyAcc, Lock, Preserve)
                {
                    RSIZ,   32, 
                    RBUF,   524288
                }

                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x03), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    If (LEqual (LCDA, 0x0110))
                    {
                        Return (Package (0x06)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x00010200, 
                            0x00010300, 
                            0x00010500, 
                            0x00010600
                        })
                    }

                    Return (Package (0x06)
                    {
                        0x00010100, 
                        0x00010200, 
                        0x00010300, 
                        0x00010400, 
                        0x00010500, 
                        0x00010600
                    })
                }

                Method (_ROM, 2, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg1, Local1)
                    If (LGreater (Local1, 0x1000))
                    {
                        Store (0x1000, Local1)
                    }

                    If (LGreater (Add (Local0, Local1), RSIZ))
                    {
                        Store (Zero, Local0)
                    }

                    Multiply (Local0, 0x08, Local2)
                    Multiply (Local1, 0x08, Local3)
                    Name (ROM1, Buffer (RSIZ) {})
                    Name (ROM2, Buffer (Local1) {})
                    Store (RBUF, ROM1)
                    CreateField (ROM1, Local2, Local3, TMPB)
                    Store (TMPB, ROM2)
                    Return (ROM2)
                }

                Device (CRT1)
                {
                    Name (_ADR, 0x0100)
                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (One, SMIF)
                        Store (Zero, TRP0)
                        If (And (CSTE, 0x0101))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0101))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DTV1)
                {
                    Name (_ADR, 0x0200)
                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (One, SMIF)
                        Store (Zero, TRP0)
                        If (And (CSTE, 0x0202))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0202))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DFP1)
                {
                    Name (_ADR, 0x0300)
                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (One, SMIF)
                        Store (Zero, TRP0)
                        If (And (CSTE, 0x0404))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0404))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (LCD)
                {
                    Method (_ADR, 0, NotSerialized)
                    {
                        Return (LCDA)
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (One, SMIF)
                        Store (Zero, TRP0)
                        If (And (CSTE, 0x0808))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0808))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DTV2)
                {
                    Name (_ADR, 0x0500)
                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (One, SMIF)
                        Store (Zero, TRP0)
                        If (And (CSTE, 0x1010))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x1010))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DFP2)
                {
                    Name (_ADR, 0x0600)
                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (One, SMIF)
                        Store (Zero, TRP0)
                        If (And (CSTE, 0x2020))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x2020))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }
            }

            Device (IDEC)
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
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }

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
                    MAPV,   2
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        If (LNotEqual (SCFG, 0x04))
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
                            Return (PBUF)
                        }

                        Return (Zero)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        If (LNotEqual (SCFG, 0x04))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (PRIT, 0x40F0, PRIT)
                                And (SYNC, 0x0E, SYNC)
                                Store (Zero, SDT0)
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

                                    Or (ICR1, One, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (PRIT, 0x3F0F, PRIT)
                                Store (Zero, PSIT)
                                And (SYNC, 0x0D, SYNC)
                                Store (Zero, SDT1)
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
                            If (LNotEqual (SCFG, 0x04))
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

                            Return (Zero)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LNotEqual (SCFG, 0x04))
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

                            Return (Zero)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)
                    Method (_GTM, 0, NotSerialized)
                    {
                        If (LNotEqual (SCFG, 0x04))
                        {
                            Name (SBUF, Buffer (0x14)
                            {
                                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0010 */    0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (SBUF, Zero, PIO0)
                            CreateDWordField (SBUF, 0x04, DMA0)
                            CreateDWordField (SBUF, 0x08, PIO1)
                            CreateDWordField (SBUF, 0x0C, DMA1)
                            CreateDWordField (SBUF, 0x10, FLAG)
                            Store (GETP (SECT), PIO0)
                            Store (GDMA (And (SYNC, 0x04), And (ICR3, 0x04), 
                                And (ICR0, 0x04), SDT2, And (ICR1, 0x04)), DMA0)
                            If (LEqual (DMA0, Ones))
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
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x08), And (ICR3, 0x08), 
                                And (ICR0, 0x08), SDT3, And (ICR1, 0x08)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, 0x04), And (SYNC, 0x08), 
                                SECT), FLAG)
                            If (And (LEqual (PIO0, Ones), LEqual (DMA0, Ones)))
                            {
                                Store (0x78, PIO0)
                                Store (0x14, DMA0)
                                Store (0x03, FLAG)
                            }

                            Return (SBUF)
                        }

                        Return (Zero)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        If (LNotEqual (SCFG, 0x04))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (SECT, 0x40F0, SECT)
                                And (SYNC, 0x0B, SYNC)
                                Store (Zero, SDT2)
                                And (ICR0, 0x0B, ICR0)
                                And (ICR1, 0x0B, ICR1)
                                And (ICR3, 0x0B, ICR3)
                                And (ICR5, 0x0B, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x7E, W630)
                                CreateWordField (Arg1, 0x80, W640)
                                CreateWordField (Arg1, 0xB0, W880)
                                CreateWordField (Arg1, 0xBA, W930)
                                Or (SECT, 0x8004, SECT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (SECT, 0x02, SECT)
                                }

                                Or (SECT, SETP (PIO0, W530, W640), SECT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, 0x04, SYNC)
                                    Store (SDMA (DMA0), SDT2)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, 0x04, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, 0x04, ICR0)
                                    }

                                    If (And (W930, 0x2000))
                                    {
                                        Or (ICR1, 0x04, ICR1)
                                    }
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (SECT, 0x3F0F, SECT)
                                Store (Zero, SSIT)
                                And (SYNC, 0x07, SYNC)
                                Store (Zero, SDT3)
                                And (ICR0, 0x07, ICR0)
                                And (ICR1, 0x07, ICR1)
                                And (ICR3, 0x07, ICR3)
                                And (ICR5, 0x07, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x7E, W631)
                                CreateWordField (Arg2, 0x80, W641)
                                CreateWordField (Arg2, 0xB0, W881)
                                CreateWordField (Arg2, 0xBA, W931)
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
                                    Or (SYNC, 0x08, SYNC)
                                    Store (SDMA (DMA1), SDT3)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x08, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x08, ICR0)
                                    }

                                    If (And (W931, 0x2000))
                                    {
                                        Or (ICR1, 0x08, ICR1)
                                    }
                                }
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LNotEqual (SCFG, 0x04))
                            {
                                Name (SIB0, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (SIB0, One, PMD0)
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
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, 0x04))
                                {
                                    Store (Or (SDT2, 0x40), DMD0)
                                    If (And (ICR1, 0x04))
                                    {
                                        If (And (ICR0, 0x04))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, 0x04))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (SIB0)
                            }

                            Return (Zero)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LNotEqual (SCFG, 0x04))
                            {
                                Name (SIB1, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (SIB1, One, PMD1)
                                CreateByteField (SIB1, 0x08, DMD1)
                                If (And (SECT, 0x20))
                                {
                                    If (LEqual (And (SECT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 
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

                                If (And (SYNC, 0x08))
                                {
                                    Store (Or (SDT3, 0x40), DMD1)
                                    If (And (ICR1, 0x08))
                                    {
                                        If (And (ICR0, 0x08))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x08))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (SIB1)
                            }

                            Return (Zero)
                        }
                    }
                }

                Device (PRT0)
                {
                    Name (_ADR, 0xFFFF)
                    Method (_SDD, 1, NotSerialized)
                    {
                        If (LEqual (SCFG, 0x04))
                        {
                            Name (GBU0, Buffer (0x07)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00
                            })
                            CreateByteField (GBU0, Zero, GB00)
                            CreateByteField (GBU0, One, GB01)
                            CreateByteField (GBU0, 0x02, GB02)
                            CreateByteField (GBU0, 0x03, GB03)
                            CreateByteField (GBU0, 0x04, GB04)
                            CreateByteField (GBU0, 0x05, GB05)
                            CreateByteField (GBU0, 0x06, GB06)
                            If (LEqual (SizeOf (Arg0), 0x0200))
                            {
                                CreateWordField (Arg0, 0x9C, W780)
                                CreateWordField (Arg0, 0x9E, W790)
                                If (LAnd (W780, 0x04))
                                {
                                    If (LEqual (And (W790, 0x04), Zero))
                                    {
                                        Store (0x10, GB00)
                                        Store (0x03, GB01)
                                        Store (0xEF, GB06)
                                    }
                                }
                            }

                            Store (GBU0, GTF0)
                        }
                    }

                    Method (_GTF, 0, NotSerialized)
                    {
                        If (LAnd (LEqual (SCFG, 0x04), LEqual (AIBT, Zero)))
                        {
                            Return (GTF0)
                        }

                        Return (Zero)
                    }
                }

                Device (PRT2)
                {
                    Name (_ADR, 0x0002FFFF)
                    Method (_SDD, 1, NotSerialized)
                    {
                        If (LEqual (SCFG, 0x04))
                        {
                            Name (GBU2, Buffer (0x07)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00
                            })
                            CreateByteField (GBU2, Zero, GB20)
                            CreateByteField (GBU2, One, GB21)
                            CreateByteField (GBU2, 0x02, GB22)
                            CreateByteField (GBU2, 0x03, GB23)
                            CreateByteField (GBU2, 0x04, GB24)
                            CreateByteField (GBU2, 0x05, GB25)
                            CreateByteField (GBU2, 0x06, GB26)
                            If (LEqual (SizeOf (Arg0), 0x0200))
                            {
                                CreateWordField (Arg0, 0x9C, W782)
                                CreateWordField (Arg0, 0x9E, W792)
                                If (LAnd (W782, 0x04))
                                {
                                    If (LEqual (And (W792, 0x04), Zero))
                                    {
                                        Store (0x10, GB20)
                                        Store (0x03, GB21)
                                        Store (0xEF, GB26)
                                    }
                                }
                            }

                            Store (GBU2, GTF2)
                        }
                    }

                    Method (_GTF, 0, NotSerialized)
                    {
                        If (LAnd (LEqual (SCFG, 0x04), LEqual (AIBT, Zero)))
                        {
                            Return (GTF2)
                        }

                        Return (Zero)
                    }
                }
            }

            Device (WMID)
            {
                Name (_HID, "PNP0C14")
                Name (_UID, Zero)
                Name (ERRD, 0x00010000)
                Name (BUFF, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BUFF, Zero, BF00)
                CreateByteField (BUFF, One, BF01)
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
                CreateField (AADS, Zero, 0x04, AS00)
                CreateField (AADS, 0x04, One, AS01)
                CreateField (AADS, 0x05, One, AS02)
                CreateField (AADS, 0x10, 0x10, AS03)
                Name (BAEF, Zero)
                Name (BADF, Zero)
                Name (BADG, Package (0x0D)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    Zero, 
                    0x00010000
                })
                Name (WLDS, Zero)
                Name (WLED, Zero)
                Name (BTDS, Zero)
                Name (BTED, Zero)
                Name (BLDS, Zero)
                Name (BLED, Zero)
                Name (NTDC, Zero)
                Name (NTDV, Zero)
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
                Name (CADI, 0x0401)
                Name (CADO, 0x0400)
                Name (GSEE, 0x0501)
                Name (GSED, 0x0502)
                Name (VAPI, 0x0601)
                Name (VAPO, 0x0600)
                Name (WBBO, 0x0701)
                Name (WBBI, 0x0700)
                Name (G3MD, 0x0800)
                Name (G3ME, 0x0801)
                Name (LANI, 0x0900)
                Name (LANO, 0x0901)
                Name (LDOF, 0x0A00)
                Name (LDON, 0x0A01)
                Name (FNKE, 0x00010002)
                Name (FNF5, 0x00015001)
                Name (BBSB, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
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
                    0x00, 0x00, 0x00, 0x00
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
                    0x00, 0x00, 0x00, 0x00
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
                    Store (Zero, AS02)
                    Store (Zero, AS03)
                }

                Method (WGDS, 1, NotSerialized)
                {
                    Name (T_0, Zero)
                    Store (Arg0, T_0)
                    If (LEqual (T_0, One)) {}
                    Else
                    {
                        If (LEqual (T_0, 0x02)) {}
                        Else
                        {
                            If (LEqual (T_0, 0x03)) {}
                            Else
                            {
                                If (LEqual (T_0, 0x08))
                                {
                                    Store (One, Index (BADG, 0x07))
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x09))
                                    {
                                        Store (Zero, Index (BADG, 0x08))
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x0C)) {}
                                        Else
                                        {
                                            If (LEqual (T_0, 0x0D)) {}
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (WSDS, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    Store (Arg0, Local0)
                    Store (BF00, Local1)
                    Store (Zero, Index (BADG, Subtract (Local0, One)))
                    Name (T_0, Zero)
                    Store (Local1, T_0)
                    If (LEqual (T_0, Zero))
                    {
                        Name (T_1, Zero)
                        Store (Local0, T_1)
                        If (LEqual (T_1, 0x04)) {}
                        Else
                        {
                            If (LEqual (T_1, 0x05)) {}
                            Else
                            {
                                If (LEqual (T_1, 0x06)) {}
                                Else
                                {
                                    If (LEqual (T_1, 0x07))
                                    {
                                        Store (Zero, BAEF)
                                    }
                                    Else
                                    {
                                        Store (0x0100, Index (BADG, Subtract (Local0, One)))
                                    }
                                }
                            }
                        }
                    }
                    Else
                    {
                        Name (T_2, Zero)
                        Store (Local0, T_2)
                        If (LEqual (T_2, 0x04)) {}
                        Else
                        {
                            If (LEqual (T_2, 0x05)) {}
                            Else
                            {
                                If (LEqual (T_2, 0x06)) {}
                                Else
                                {
                                    If (LEqual (T_2, 0x07))
                                    {
                                        Store (One, BAEF)
                                    }
                                    Else
                                    {
                                        Store (0x0100, Index (BADG, Subtract (Local0, One)))
                                    }
                                }
                            }
                        }
                    }
                }

                Method (OEMN, 0, NotSerialized)
                {
                    If (LEqual (BGEF, One))
                    {
                        Store (NTDV, Local0)
                        If (LNotEqual (Local0, Zero))
                        {
                            Store (Zero, NTDV)
                            Return (Local0)
                        }
                    }

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
                    Return (Zero)
                }

                Method (STRL, 2, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg1, BUFF)
                    Store (Zero, BBSB)
                    Name (T_0, Zero)
                    Store (Local0, T_0)
                    If (LEqual (T_0, One)) {}
                    Else
                    {
                        If (LEqual (T_0, 0x02)) {}
                        Else
                        {
                            Store (0x00010000, BBSB)
                        }
                    }
                }

                Method (WODP, 2, NotSerialized)
                {
                    If (LEqual (Arg0, 0x03)) {}
                    Else
                    {
                        Store (One, Index (BCDS, Subtract (Arg0, One)))
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        If (Arg1) {}
                        Else
                        {
                        }
                    }
                    Else
                    {
                    }
                }

                Method (GCPU, 1, NotSerialized)
                {
                    Store (DSY5, DSY0)
                    Store (Arg0, Local0)
                    Store (IHWM (Zero, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY00)
                    Store (DY61, DY01)
                    Store (DY62, DY02)
                    Store (DY63, DY03)
                }

                Method (MSRR, 1, NotSerialized)
                {
                    Store (DSY3, DSY1)
                    Store (Arg0, DY00)
                    Store (IHWM (One, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY10)
                    Store (DY61, DY11)
                    Store (Zero, WIT0)
                    Store (WIT0, DY12)
                }

                Method (MSRW, 1, NotSerialized)
                {
                    Store (DSY3, DSY1)
                    Store (IHWM (0x02, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY10)
                    Store (DY61, DY11)
                    Store (Zero, WIT0)
                    Store (WIT0, DY12)
                }

                Method (C4C3, 2, NotSerialized)
                {
                }

                Method (CPUF, 0, NotSerialized)
                {
                }

                Method (CPUT, 0, NotSerialized)
                {
                }

                Method (PCIR, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (IHWM (0x03, Arg0), Local2)
                    Store (Local2, DY20)
                    Store (Local2, DSY6)
                    Store (DSY4, DSY2)
                    Store (DY60, DY20)
                }

                Method (PCIW, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg0, DY20)
                    Store (IHWM (0x04, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY61, BUFF)
                }

                Method (CPUS, 0, NotSerialized)
                {
                    Store (IHWM (0x05, Zero), Local2)
                    Store (Local2, BUFF)
                    Store (BUFF, Index (BCDS, 0x0C))
                }

                Method (PCID, 1, NotSerialized)
                {
                    Store (IHWM (0x06, Arg0), Local2)
                    Store (Local2, DSY6)
                }

                Method (BTIF, 2, NotSerialized)
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
                }

                Method (CKGS, 0, NotSerialized)
                {
                    Store (One, GSTS)
                    Return (GSTS)
                }

                Method (WSHP, 1, NotSerialized)
                {
                }

                Method (WSSL, 1, NotSerialized)
                {
                }

                Method (WSSP, 1, NotSerialized)
                {
                }

                Method (WSSE, 1, NotSerialized)
                {
                }

                Method (WSVE, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LEqual (Local0, One))
                    {
                        Store (One, BGEF)
                    }
                    Else
                    {
                        Store (Zero, BGEF)
                    }

                    Store (Zero, Index (BGDS, Zero))
                }

                Name (_WDG, Buffer (0xDC)
                {
                    0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E, 
                    0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A, 
                    0x41, 0x41, 0x01, 0x01, 

                    0x58, 0xF2, 0xF4, 0x6A, 0x01, 0xB4, 0xFD, 0x42,
                    0xBE, 0x91, 0x3D, 0x4A, 0xC2, 0xD7, 0xC0, 0xD3, 
                    0x42, 0x41, // BA
                    0x01, 0x02, 

                    0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41, 
                    0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5, 
                    0x80, 0x00, 0x01, 0x08, 

                    0x53, 0x44, 0x8C, 0xE7, 0x27, 0x02, 0x61, 0x48, 
                    0x9E, 0xDE, 0xF5, 0x60, 0x0B, 0x4A, 0x3D, 0x39, 
                    0x42, 0x42, // BB
                    0x01, 0x02, 

                    0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48, 
                    0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B, 
                    0x42, 0x43, // BC
                    0x01, 0x02, 

                    0x79, 0x4C, 0xF9, 0xCF, 0x77, 0x6C, 0xF7, 0x4A, 
                    0xAC, 0x56, 0x7D, 0xD0, 0xCE, 0x01, 0xC9, 0x97, 
                    0x42, 0x44, // BD
                    0x01, 0x02, 

                    0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B, 
                    0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9, 
                    0x42, 0x45, // BE
                    0x01, 0x02, 

                    0xB7, 0xA0, 0xC9, 0xA7, 0x9D, 0x4C, 0x72, 0x4C, 
                    0x83, 0xBB, 0x53, 0xA3, 0x45, 0x91, 0x71, 0xDF, 
                    0x42, 0x46, // BF
                    0x01, 0x02, 

                    0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48, 
                    0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82, 
                    0x42, 0x47, // BG
                    0x01, 0x02, 

                    0xA7, 0xB1, 0x85, 0xDB, 0x9A, 0x06, 0xBB, 0x4A, 
                    0xA2, 0xB5, 0xD1, 0x86, 0xA2, 0x1B, 0x80, 0xF1, 
                    0x81, 0x00, 0x01, 0x08, 

                    0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45, 
                    0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D, 
                    0x82, 0x00, 0x01, 0x08
                })
                Method (WQAA, 1, NotSerialized)
                {
                    AAF1 ()
                    Store (AADS, BUFF)
                    Return (BUFF)
                }

                Method (WMBA, 3, NotSerialized)
                {
                    Name (T_0, Zero)
                    Store (Arg1, T_0)
                    If (LNotEqual (Match (Package (0x08)
                                    {
                                        One, 
                                        0x02, 
                                        0x03, 
                                        0x08, 
                                        0x09, 
                                        0x0A, 
                                        0x0C, 
                                        0x0D
                                    }, MEQ, T_0, MTR, Zero, Zero), Ones))
                    {
                        Store (Zero, Local0)
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
                                        }, MEQ, T_0, MTR, Zero, Zero), Ones))
                        {
                            If (LEqual (Arg1, 0x07))
                            {
                                Store (Arg2, BUFF)
                                If (BF00)
                                {
                                    Store (One, BAEF)
                                }
                            }

                            Store (One, Local0)
                        }
                    }

                    If (Local0)
                    {
                        WSDS (Arg1, Arg2)
                    }
                    Else
                    {
                        WGDS (Arg1)
                    }

                    Store (DerefOf (Index (BADG, Subtract (Arg1, One))), BUFF)
                    Return (BUFF)
                }

                Method (_WED, 1, NotSerialized)
                {
                    If (LGreaterEqual (Arg0, 0x80))
                    {
                        If (LLess (Arg0, 0x83))
                        {
                            Return (OEMN ())
                        }
                    }

                    Return (Zero)
                }

                Method (WMBB, 3, NotSerialized)
                {
                    STRL (Arg1, Arg2)
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
                    WODP (Arg1, Arg2)
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
                        GCPU (WIT0)
                        Return (DSY0)
                    }

                    If (LEqual (Arg1, 0x02))
                    {
                        Store (Arg2, Local0)
                        MSRR (Arg2)
                        Return (DSY1)
                    }

                    If (LEqual (Arg1, 0x03))
                    {
                        Store (Arg2, Local0)
                        MSRW (Arg2)
                        Return (DSY1)
                    }

                    If (LEqual (Arg1, 0x04))
                    {
                        C4C3 (Arg1, Arg2)
                        ShiftRight (DerefOf (Index (BCDS, Add (Arg1, 0x05))), 0x10, 
                            BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x05))
                    {
                        C4C3 (Arg1, Arg2)
                        Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x06))
                    {
                        CPUF ()
                        Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x07))
                    {
                        CPUT ()
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
                        PCIR (Local0)
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
                        PCIW (Local1)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x0A))
                    {
                        CPUS ()
                        Store (DerefOf (Index (BCDS, Add (Arg1, 0x02))), BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x0B))
                    {
                        PCID (Arg2)
                        Return (DSY6)
                    }

                    Return (Zero)
                }

                Method (WMBE, 3, NotSerialized)
                {
                    BTIF (Arg1, Arg2)
                    Store (BUFF, Debug)
                    Store (BEDS, Debug)
                    Store (DerefOf (Index (BEDS, Subtract (Arg1, One))), BUFF)
                    Store (BUFF, Debug)
                    Return (BUFF)
                }

                Method (WMBF, 3, NotSerialized)
                {
                }

                Method (WMBG, 3, NotSerialized)
                {
                    Store (Arg2, BUFF)
                    WSVE (BF00)
                    Store (DerefOf (Index (BGDS, Subtract (Arg1, One))), BUFF)
                    Store (BUFF, Debug)
                    Return (BUFF)
                }
            }
        }
    }
}

