# Four-Quadrant Chopper Simulation (E-Type Chopper) – MATLAB Simulink

![image](https://github.com/user-attachments/assets/656f4154-5f1b-4a4e-87e7-aea234f543fc)


This repository contains a complete MATLAB Simulink model of a **four-quadrant DC-DC chopper (E-Type chopper)**. The system enables bidirectional current and voltage control across the load, supporting all four modes of operation: forward motoring, forward braking, reverse motoring, and reverse braking.

---

## 🌀 What’s Included

- Full H-bridge (E-type) chopper implementation using 4 power switches.
- Quadrant-wise gate signal control via MATLAB Function Block.
- Support for **PWM-based switching** with logic to activate correct pairs.
- Configurable **RLE load** (motor-like behavior with back EMF).
- Output voltage and current measurements for quadrant observation.
---

## 🔧 Operation Modes (Quadrants)

| Quadrant | Voltage | Current | Mode               |
|----------|---------|---------|--------------------|
| I        | +       | +       | Forward Motoring   |
| II       | –       | +       | Forward Braking    |
| III      | –       | –       | Reverse Motoring   |
| IV       | +       | –       | Reverse Braking    |

Quadrant selection is handled using an integer input (`1` to `4`) to the control logic block.

---

## 🚀 Getting Started

### 🛠 How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/ketan6789/Four-Quadrant-Chopper-and-Closed-Loop-Speed-Control-of-DC-Motor.git
   ```
2. Open MATLAB and navigate to the folder.
3. Open the Simulink model:
   ```matlab
   open('FourQuadrantChopper.slx')
   ```
4. Run the simulation.
5. Use the **Scope** and **XY Plot** to observe voltage-current behavior.

---

## ℹ️ Notes on Current Direction and Quadrant Behavior

- The **current measurement** in the model is connected with a fixed polarity, meaning it measures **positive current** in one direction only. When the current flows in the **opposite direction** (as in Quadrants 2 and 3), the sensor naturally outputs a **negative value**. To display the **correct current polarity** (relative to quadrant operation), this model incorporates a correction inside the MATLAB Function Block:  
  → Whenever operation in **Quadrant 2 or 3** is selected, the measured current is **multiplied by –1** internally.  
  This effectively mirrors the current waveform, giving a proper representation of regenerative modes without physically reversing the current sensor terminals.

- Although the **switching pattern code** for Quadrants 1 & 2 and 3 & 4 is structurally similar, their behavior is **functionally distinct**. The difference becomes clear when observing the simulation waveforms:
  - In **Quadrant 1** (forward motoring), current flows into the load during the PWM ON time.
  - In **Quadrant 2** (forward regeneration), the load **returns current** during the **same PWM ON intervals**, i.e., where current was rising before, it now falls (and vice versa).
  - This reversal happens because **the opposite switches** conduct during regeneration — e.g., if AH was active for motoring, AL takes over for braking.

In short, the **same PWM duty pattern** triggers **inverted current behavior** due to the **power path reversal**, illustrating the essence of **four-quadrant operation**.

---

## 📜 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more info.

---

## 🙌 Acknowledgment

This project is developed by Ketan Singh as part of power electronics simulation and control learning.

---

🚀 Simulate | 🔁 Regenerate | 🧠 Understand — All in One!
